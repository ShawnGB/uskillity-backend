class StripeConnector
  class << self
    STRIPE_AUTHZ_URL = "https://connect.stripe.com/oauth/authorize"
    def authorization_url(user)
      state = user.stripe_connection_token
      client_id = Rails.configuration.stripe[:client_id]
      authz_url = "#{STRIPE_AUTHZ_URL}?response_type=code&client_id=#{client_id}&scope=read_write&state=#{state}"
    end

    def create_stripe_customer(user, token)
      if !user.stripe_customer_id.blank?
        customer = Stripe::Customer.retrieve(user.stripe_customer_id)
        customer.source = token[:id]
        customer.save
      else
        customer = Stripe::Customer.create(
          email: user.email,
          source: token[:id]
        )
      end
      user.update_attribute(:stripe_customer_id, customer.id)
      payment_method = {
        brand: token[:brand],
        last4: token[:last4]
      }
      user.update_attribute(:payment_method, payment_method)
    end

    def remove_stripe_customer(user)
      #TODO => remove only payment_method field from user
      # deleting the user from stripe can result in users not being chargeable
      cu = Stripe::Customer.retrieve(user.stripe_customer_id)
      cu.delete
      user.update_attribute(:stripe_customer_id, nil)
      user.update_attribute(:payment_method, nil)
    end

    def connect_user_from_stripe(state, code)
      @client = Rack::OAuth2::Client.new(
        identifier: Rails.configuration.stripe[:secret_key],
        secret: Rails.configuration.stripe[:secret_key],
        redirect_uri: Rails.configuration.stripe[:redirect_uri],
        authorization_endpoint: STRIPE_AUTHZ_URL,
        token_endpoint: 'https://connect.stripe.com/oauth/token'
      )
      @client.authorization_code = code

      access_token = @client.access_token!

      # find user by state == stripe_connection_token
      user = User.where(stripe_connection_token: state).first
      if user.blank?
        #TODO refactor for better error handling
        Raven.capture_message("Error trying to connect a stripe account, could not find user for stripe_connection_token #{state}")
        return "error"
      end

      auth_data = access_token.raw_attributes
      auth_data = HashWithIndifferentAccess.new(auth_data)
      user.stripe_provider = "stripe"
      user.stripe_uid = auth_data[:stripe_user_id]
      user.stripe_access_code = auth_data[:access_token]
      user.stripe_refresh_token = auth_data[:refresh_token]
      user.stripe_publishable_key = auth_data[:stripe_publishable_key]

      #also reset stripe connection token, so no other user can connect stripe to this stripe_account_connect
      user.stripe_connection_token = ""
      user.save!

      return "ok"
    end
  end
end
