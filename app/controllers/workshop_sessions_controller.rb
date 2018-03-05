class WorkshopSessionsController < ApiController
  before_action :set_workshop_session, only: [:update, :destroy]
  before_action :authenticate_user!

  def create
    @workshop_session = WorkshopSession.new(workshop_session_params)

    if @workshop_session.save
      render json: @workshop_session, status: :created
    else
      render json: @workshop_session.errors, status: :unprocessable_entity

    end
  end

  def update
    if @workshop_session.update(workshop_session_params)
      render json: nil, status: :no_content
    else
      render json: @workshop_session.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @workshop_session
      @workshop_session.destroy
      render json: nil, status: :no_content
    else
      render json: {}, status: :not_found
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_workshop_session
    @workshop_session = WorkshopSession.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def workshop_session_params
    params.require(:workshop_session).permit(:starts_at, :ends_at).merge(:workshop_id => workshop_id())
  end

  def workshop_id()
    params[:workshop_id]
  end
end
