class WorkshopRegistrationsController < ApplicationController
  before_action :set_workshop_registration, only: [:show, :edit, :update, :destroy]

  # GET /workshop_registrations
  # GET /workshop_registrations.json
  def index
    @workshop_registrations = WorkshopRegistration.all
  end

  # GET /workshop_registrations/1
  # GET /workshop_registrations/1.json
  def show
  end

  # GET /workshop_registrations/new
  def new
    @workshop_registration = WorkshopRegistration.new
  end

  # GET /workshop_registrations/1/edit
  def edit
  end

  # POST /workshop_registrations
  # POST /workshop_registrations.json
  def create
    @workshop_registration = WorkshopRegistration.new(workshop_registration_params)

    respond_to do |format|
      if @workshop_registration.save
        format.html { redirect_to @workshop_registration, notice: 'WorkshopRegistration was successfully created.' }
        format.json { render :show, status: :created, location: @workshop_registration }
      else
        format.html { render :new }
        format.json { render json: @workshop_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workshop_registrations/1
  # PATCH/PUT /workshop_registrations/1.json
  def update
    respond_to do |format|
      if @workshop_registration.update(workshop_registration_params)
        format.html { redirect_to @workshop_registration, notice: 'WorkshopRegistration was successfully updated.' }
        format.json { render :show, status: :ok, location: @workshop_registration }
      else
        format.html { render :edit }
        format.json { render json: @workshop_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshop_registrations/1
  # DELETE /workshop_registrations/1.json
  def destroy
    @workshop_registration.destroy
    respond_to do |format|
      format.html { redirect_to workshop_registrations_url, notice: 'WorkshopRegistration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop_registration
      @workshop_registration = WorkshopRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workshop_registration_params
      params.require(:workshop_registration).permit(:workshop_id, :user_id, :booking_id, :status)
    end
end
