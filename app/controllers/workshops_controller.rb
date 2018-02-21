class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:update, :destroy]
  before_action :authenticate_user!, except: [:random, :index, :show]

  def random
    render json: WorkshopRepository.random(), status: :ok
  end

  def index
    @category = Category.find_by_id(params[:category_id]) if params[:category_id]
    @workshops = @category ?
      WorkshopRepository.categorised_workshops(@category) :
      WorkshopRepository.workshops
    render json: @workshops, status: :ok
  end

  def show
    workshop = WorkshopRepository.workshop_with_id(params[:id])
    if workshop.nil?
      return render json: nil, status: :not_found
    end
    render json: workshop, status: :ok
  end

  def create
    @workshop = Workshop.new()
    update_workshop(@workshop, create_workshop_params)
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
    update_workshop(@workshop, update_workshop_params)
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

  def update_workshop(w, values)
    w.title_en                   = w.title_de                   = values[:title]                   if values[:title]
    w.subtitle_en                = w.subtitle_de                = values[:subtitle]                if values[:subtitle]
    w.description_en             = w.description_de             = values[:description]             if values[:description]
    w.additional_requirements_en = w.additional_requirements_de = values[:additional_requirements] if values[:additional_requirements]

    w.category_id    = values[:category_id]    if values[:category_id]
    w.fees           = values[:fees]           if values[:fees]
    w.level_id       = values[:level_id]       if values[:level_id]
    w.min_age        = values[:min_age]        if values[:min_age]
    w.max_age        = values[:max_age]        if values[:max_age]
    w.full_address   = values[:full_address]   if values[:full_address]


    unless values[:terms_accepted].nil?
      w.terms_accepted = values[:terms_accepted]
      if w.terms_accepted and w.published_at.nil?
        w.published_at = Time.zone.now
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_workshop
    @workshop = Workshop.find_by(id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def create_workshop_params
    params.require(:workshop).permit(:title, :subtitle, :description, :category_id, :fees, :level_id, :min_age, :max_age, :full_address, :additional_requirements)
  end

  def update_workshop_params
    params.require(:workshop).permit(:title, :subtitle, :description, :category_id, :fees, :level_id, :min_age, :max_age, :full_address, :terms_accepted, :additional_requirements)
  end

end
