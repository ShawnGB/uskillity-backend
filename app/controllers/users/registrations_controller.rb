require 'securerandom'
class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  after_action :clear_session

  def register
    @user = User.new
    render
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    # create a random password for users who just sign up for the mailinglist
    # implementing the pre-signup/landingpage behaviour of creating a user without the full signup form
    if User.find_by_email(params["user"]["email"])
      flash[:success] = "This email address is already registered"
      redirect_to root_path
    else
      random_password = SecureRandom.hex(20)
      params["user"]["password"] = random_password
      params["user"]["password_confirmation"] = random_password
      super
    end
  end

  def after_sign_up_path_for(user)
    root_path
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def clear_session
    session.clear
  end
end
