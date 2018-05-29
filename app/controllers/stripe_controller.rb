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

  # users will be redirected here, after accepting or declining their giropay flow
  # note that this will not complete the payment, the source will not yet be chargeable
  # we will be notified from stripe via a webhook, once the source becomes chargeable
  def giropay_callback
    @order = Order.find(params[:order_id])
    @amount = @order.payment_transaction.total_amount / 100.0
    render :giropay_callback
  end

  # webhook to receive events from stripe, e.g. when source becomes chargeable
  def event_webhook
    # if source becomes chargeable, find the order and trigger the transaction
    # for now, only act on source.chargeable events
    if event_params[:type] == "source.chargeable"
      order = Order.where(stripe_source: event_params[:data][:object][:id]).first
      order.payment_transaction.make_charge
    end
  end

  private
  def stripe_params
    params.permit(:state, :scope, :code, :error)
  end

  def event_params
    params.permit(:type, data: [ object: [:id]])
  end
end
