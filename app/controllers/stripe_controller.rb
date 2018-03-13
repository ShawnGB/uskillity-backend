class StripeController < ActionController::Base
  prepend_view_path 'app/views/stripe'
  def connect_callback
    if stripe_params[:error]
      render :error
    else
      status = StripeConnector.connect_user_from_stripe(stripe_params['state'], stripe_params['code'])
      if status == "error"
        render :error
      else
        render :success
      end
    end
  end

  private
  def stripe_params
    params.permit(:state, :scope, :code, :error)
  end
end
