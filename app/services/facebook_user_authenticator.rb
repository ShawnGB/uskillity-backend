require 'securerandom'
class FacebookUserAuthenticator
  class << self

    def authenticate_from_web_cookies(cookies, token)
      # get APPID and APP_SECRET from ENV
      fb_secret = Rails.configuration.fb_secret
      @oauth = Koala::Facebook::OAuth.new(Rails.configuration.fb_app_id, fb_secret)

      # first get the user info from the cookie which was set by the JS SDK
      auth = @oauth.get_user_info_from_cookies(cookies)
      access_token = auth['access_token'] unless auth.nil?
      access_token = token if access_token.blank?

      # then exchange the short lived token for a long lived token
      new_auth = @oauth.exchange_access_token_info(access_token)
      auth['access_token'] = new_auth['access_token']

      # access the graph API using the received access token to get the user profile data
      @graph = Koala::Facebook::API.new(auth["access_token"], fb_secret)

      profile = @graph.get_object("me", {:fields => 'picture, email, first_name, last_name, birthday'})
      #friends = @graph.get_connections("me", "friends")

      # add the access_token to the profile as the token is used by our existing authenticate function
      data = profile.merge({"fb_token" => auth["access_token"]})
      # set the name field to only be the last name, a thing that is done in the apps, so we have to repeat the same thign here
      data["name"] = data["last_name"]
      # make all fields in the hash accessible by symbols to not change the existing code
      # TODO refactor the authenticate function if it makes sense
      data = HashWithIndifferentAccess.new(data)

      return authenticate(data)
    end

    # returns [status, user]
    def authenticate(data)
      return unless data[:fb_token]
      fb_token = data[:fb_token]

      user = user_from_data(data)
      status = nil

      begin
        if user.new_record?
          Rails.logger.info 'FB-Login: new record'
          user.oauth_token = fb_token
          user.save!
          return :created, user
        else
          Rails.logger.info 'FB-Login: existing user'
          Rails.logger.info "FB data: #{data}"
          status, user = validate_and_update_token(user, fb_token)
        end
      rescue ActiveRecord::RecordInvalid
        # If creation or update of the user fails we return the user with
        # unprocesable entity as status so the controller can serve errors
        # messages and does not silently fail
        status = :unprocessable_entity
      end

      return status, user
    end

    private

    # returns user
    def user_from_data(data)
      fb_uid_received = data[:fb_uid]
      fb_uid_received = data[:id] if fb_uid_received.nil?

      # The uid recieved from the app is for the current app_scope.
      # Check whether the user is registered with this fb_uid
      # (in effect, whether the user is registered for the current app_scope).
      Rails.logger.info "Get registered user for this fb_uid: #{fb_uid_received}"
      user = User.where(uid: fb_uid_received, provider: 'facebook').first

      # If not, the user is absolutely new to us.
      if user.nil?
        Rails.logger.info "Creating new"
        user = User.new(provider: 'facebook', uid: fb_uid_received)
        user.password = SecureRandom.urlsafe_base64(16)
      end

      user.email      = data[:email] if data.has_key? :email
      user.gender     = data[:gender] if data.has_key? :gender
      user.first_name = data[:first_name] if data.has_key? :first_name
      user.name       = data[:name] if data.has_key? :name
      user.birthdate  = Date.parse(data[:birthdate]) if data.has_key? :birthdate

      user
    end

    # validates fb_token
    # returns [status, user]
    def validate_and_update_token(user, fb_token)
      # If given fb_token is the known fb_token, just return
      if user.oauth_token == fb_token
        Rails.logger.info 'FB-Login: matching fb_token'
        user.save!
        return :ok, user

        # If it's is an unknown fb_token, validate against facebook api
      else
        Rails.logger.info "validating using token: #{fb_token}"
        uri = URI("https://graph.facebook.com/me?access_token=#{fb_token}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        response = http.request(Net::HTTP::Get.new(uri.request_uri))
        fb_uid_from_graph_api = JSON.parse(response.body)['id']

        # if the received fb_uid is known/saved, update the token and
        # authenticate the user.
        Rails.logger.info "received fb uid from graph api: #{fb_uid_from_graph_api}"
        if user.uid == fb_uid_from_graph_api
          Rails.logger.info 'FB-Login: successful'
          user.oauth_token = fb_token
          user.save!
          return :ok, user

          # Otherwise authentication failed
        else
          Rails.logger.info 'FB-Login: failed'
          return
        end
      end
    end

  end
end
