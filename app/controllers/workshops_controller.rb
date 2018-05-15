class WorkshopsController < ApiController
  before_action :set_workshop, only: [:update, :destroy]
  before_action :authenticate_user!, except: [:random, :index, :show]

  def random
    render json: WorkshopRepository.random(), status: :ok
  end

  def index
    @category = Category.active.find_by_id(params[:category_id]) if params[:category_id]
    @workshops = @category ?
      WorkshopRepository.categorised_workshops(@category) :
      WorkshopRepository.workshops.uniq
    render json: @workshops, status: :ok
  end

  def show
    workshop = WorkshopRepository.workshop_with_id(params[:id], current_user)
    if workshop.nil?
      return render json: nil, status: :not_found
    end
    render json: workshop, status: :ok
  end

  def create
    @workshop = Workshop.new()
    WorkshopRepository.update_workshop(@workshop, create_workshop_params)
    @workshop.provider = current_user

    if @workshop.save
      render json: @workshop, status: :created
    else
      render json: @workshop.errors, status: :unprocessable_entity
    end
  end

  def update
    if @workshop.nil?
      return render json: nil, status: :not_found
    end
    WorkshopRepository.update_workshop(@workshop, update_workshop_params)
    if @workshop.save
      render json: nil, status: :no_content
    else
      render json: @workshop.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @workshop.nil?
      return render json: nil, status: :not_found
    end
    @workshop.destroy
    render json: nil, status: :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_workshop
    @workshop = Workshop.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def create_workshop_params
    params.require(:workshop).permit(:title, :subtitle, :description, :category_id, :fees, :level_id, :min_age, :max_age, :full_address, :additional_requirements, :maximum_workshop_registration_count)
  end

  def update_workshop_params
    params.require(:workshop).permit(:title, :subtitle, :description, :category_id, :fees, :level_id, :min_age, :max_age, :full_address, :terms_accepted, :additional_requirements, :maximum_workshop_registration_count)
  end

end
