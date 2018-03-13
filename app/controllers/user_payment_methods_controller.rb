class UserPaymentMethodsController < ApiController
  before_action :authenticate_user!

  def index
    if current_user.id != user_id.to_i
      return render json: {error: 'permission denied'}, status: :forbidden
    end

    render json: current_user.payment_method, status: :ok
  end

  private

  def user_id
    params[:user_id]
  end
end
