class UserPaymentMethodsController < ApiController
  before_action :set_user
  before_action :authenticate_user!

  def index
    if current_user.id != @user.id
      return render json: {error: 'permission denied'}, status: :forbidden
    end

    render json: current_user.payment_method, status: :ok
  end

  def destroy
    if @user.nil?
      return render json: nil, status: :not_found
    end

    if current_user.id != @user.id
      return render json: {error: 'permission denied'}, status: :forbidden
    end

    if @user.stripe_customer_id.blank?
      return render json: {error: 'could not find associated stripe account'}, status: :forbidden
    end

    StripeConnector.remove_stripe_customer(@user)

    render json: nil, status: :no_content
  end

  private
  def set_user
    @user = User.find_by(id: user_id)
  end

  def user_id
    params[:user_id]
  end
end
