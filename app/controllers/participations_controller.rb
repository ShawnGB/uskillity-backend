class ParticipationsController < ApiController
  before_action :set_workshop_session
  before_action :authenticate_user!

  # POST /participations
  # POST /participations.json
  def create
    if @workshop_session.nil?
      return render json: {error: "Session not found"}, status: :not_found
    end

    allocatable =  (@workshop_session.workshop.maximum_workshop_registration_count || 999) - @workshop_session.participations.count

    if allocatable < 0
      return render json: {error: "Maximum registrations reached"}, status: :unprocessable_entity
    end

    if allocatable < requested_participation_count
      return render json: {error: "Only #{allocatable} tickets can be reserved"}, status: :unprocessable_entity
    end

    # create order object
    order = Order.create(payment_method: payment_method())
    # create participations
    participations = []

    requested_participation_count.times {
      
      p = Participation.new(participation_params)
      # add participations to order object
      p.order = order

      if p.save!
        participations.append(p)
      else
        participations.map{ |pd| pd.delete }
        return render json: participation.errors, status: :unprocessable_entity
      end
    }

    # trigger payment on order
    order.trigger_payment_transaction


    # TODO: send emails only after payments have been made
    # ws = Workshop.includes(:provider).find(workshop_id())
    # UserMailer.participations_created(ws, current_user, requested_participation_count).deliver
    # UserMailer.you_are_participating(ws, @workshop_session, current_user, participations).deliver

    render json: participations, status: :created
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_participation
    @participation = Participation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def participation_params
    {}.merge(:user_id => current_user.id, workshop_session_id: workshop_session_id())
  end

  def set_workshop_session
    @workshop_session = WorkshopSession.includes(:workshop).find_by(id: workshop_session_id())
  end

  def requested_participation_count
    (params[:requested_participation_count] || 1).to_i
  end

  def payment_method
    params[:payment_method]
  end

  def workshop_id()
    params[:workshop_id]
  end

  def workshop_session_id()
    params[:workshop_session_id]
  end
end
