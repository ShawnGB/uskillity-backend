class WorkshopSessionsController < ApplicationController
  before_action :set_workshop_session, only: [:show, :edit, :update, :destroy]

  # GET /workshop_sessions
  # GET /workshop_sessions.json
  def index
    @workshop_sessions = WorkshopSession.all
  end

  # GET /workshop_sessions/1
  # GET /workshop_sessions/1.json
  def show
  end

  # GET /workshop_sessions/new
  def new
    @workshop_session = WorkshopSession.new
  end

  # GET /workshop_sessions/1/edit
  def edit
  end

  # POST /workshop_sessions
  # POST /workshop_sessions.json
  def create
    @workshop_session = WorkshopSession.new(workshop_session_params)

    respond_to do |format|
      if @workshop_session.save
        format.html { redirect_to @workshop_session, notice: 'Workshop session was successfully created.' }
        format.json { render :show, status: :created, location: @workshop_session }
      else
        format.html { render :new }
        format.json { render json: @workshop_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshop_sessions/1
  # PATCH/PUT /workshop_sessions/1.json
  def update
    respond_to do |format|
      if @workshop_session.update(workshop_session_params)
        format.html { redirect_to @workshop_session, notice: 'Workshop session was successfully updated.' }
        format.json { render :show, status: :ok, location: @workshop_session }
      else
        format.html { render :edit }
        format.json { render json: @workshop_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshop_sessions/1
  # DELETE /workshop_sessions/1.json
  def destroy
    @workshop_session.destroy
    respond_to do |format|
      format.html { redirect_to workshop_sessions_url, notice: 'Workshop session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop_session
      @workshop_session = WorkshopSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workshop_session_params
      params.require(:workshop_session).permit(:title_translations, :subtitle_translations, :description_translations, :starts_at, :ends_at, :level_id, :main_image, :more_images, :tutor_id, :workshop_id, :venue_id, :minimum_participation_count, :maximum_participation_count)
    end
end
