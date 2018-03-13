class UsersController < ApiController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :stripe_account_connect, :delete_payment_method]
  before_action :authenticate_user!, except: [:show, :authenticate_with_facebook]

  def show
    if @user.nil?
      return render json: nil, status: :not_found
    end
    render json: @user, status: :ok
  end

  def update
    if @user.nil?
      return render json: nil, status: :not_found
    end

    if current_user.id != @user.id
      return render json: {error: 'permission denied'}, status: :forbidden
    end

    if @user.update(user_params)
      if @user.stripe_temporary_token.present?
        StripeConnector.create_stripe_customer(@user, @user.stripe_temporary_token)
      end
      render json: nil, status: :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.nil?
      return render json: nil, status: :not_found
    end

    if current_user.id != @user.id
      return render json: {error: 'permission denied'}, status: :forbidden
    end

    @user.destroy
    render json: nil, status: :no_content
  end

  def stripe_account_connect
    if @user.nil?
      return render json: nil, status: :not_found
    end
    if current_user.id != @user.id
      return render json: {error: 'permission denied'}, status: :forbidden
    end
    @user.stripe_connection_token = SecureRandom.urlsafe_base64(nil, false)
    @user.save
    redirect_url = StripeConnector.authorization_url(@user)
    return render json: {redirect_url: redirect_url}
  end

  def authenticate_with_facebook
    status, user = FacebookUserAuthenticator.authenticate_from_web_cookies(cookies, facebook_params['accessToken'])

    client, token = user.generate_devise_auth_tokens()
    user.save!

    if user
      if user.valid?
        response.headers['access-token'] = token
        response.headers['client'] = client
        response.headers['uid'] = user.uid
        render json: user, status: status
      else
        render json: user.errors, status: :unprocessable_entity
      end
    else
      render nothing: true, status: :forbidden
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :first_name, :locale, :gender,
                                 :nickname, :about, :edu_bg, :profession,
                                 :location,
                                 :stripe_customer_id,
                                 :stripe_temporary_token => [
                                   :brand,
                                   :id,
                                   :last4
                                   ])
  end

  def facebook_params
    params.require(:facebook_data).permit(:email, :gender, :first_name, :name,
                                          :country, :birthdate, :fb_uid,
                                          :fb_token, :fb_token_expires_at,
                                          :accessToken, :expiresIn,
                                          :signedRequest, :userID)
  end
end
