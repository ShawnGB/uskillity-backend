class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:update, :destroy]
  before_action :authenticate_user!, except: [:random, :index, :show, :new]

  before_action :load_workshops, only: [:index]

  def random
    @workshops = Workshop.includes({provider: :images}, :images).take(6)
    render json: @workshops, status: :ok
  end

  def index
    @category = Category.find_by_id(params[:category_id]) if params[:category_id]
    # TODO -- send only ready items.
    @workshops = @category ?
      @category.workshops.includes({provider: :images}, :images) : # .where(is_approved: true).where.not(published_at: nil)
      Workshop.includes({provider: :images}, :images) # .where(is_approved: true).where.not(published_at: nil)
    render json: @workshops, status: :ok
  end

  def show
    workshop = Workshop.includes({provider: :images}, :images).find_by(id: params[:id])
    if workshop.nil?
      return render json: nil, status: :not_found
    end
    # TODO for not yet ready workshops
    render json: workshop, status: :ok
  end

  # GET /workshops/new
  def new
    @workshop = Workshop.new
  end

  # GET /workshops/1/edit
  def edit
  end

  def create
    @workshop = Workshop.new()
    update_workshop(@workshop, workshop_params)
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
    if @workshop.update(workshop_params)
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

  def update_workshop(workshop, values)
    workshop.title_en       = workshop.title_de       = values[:title] if values[:title]
    workshop.subtitle_en    = workshop.subtitle_de    = values[:subtitle] if values[:subtitle]
    workshop.description_en = workshop.description_de = values[:description] if values[:description]
    workshop.fees           = values[:fees] if values[:fees]
    workshop.category_id    = values[:category_id] if values[:category_id]
    workshop.level_id       = values[:level_id] if values[:level_id]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_workshop
    @workshop = Workshop.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def workshop_params
    params.require(:workshop).permit(:title, :subtitle, :description, :category_id, :offered_on, :fees, :provider_id, :main_image, :more_images, :level_id, :min_age, :max_age, :full_address)
  end

  def load_workshops
  end
end
