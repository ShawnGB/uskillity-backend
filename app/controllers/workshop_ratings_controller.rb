class WorkshopRatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, except: [:index, :show]

  # GET /workshops/:workshop_id/ratings
  # GET /workshops/:workshop_id/ratings.json
  def index
    workshop = Workshop.find_by(id: params[:workshop_id])
    if workshop
      render json: workshop.ratings, status: :ok
    end
  end

  # GET /workshops/:workshop_id/ratings/1
  # GET /workshops/:workshop_id/ratings/1.json
  def show
  end

  # POST /workshops/:workshop_id/ratings
  # POST /workshops/:workshop_id/ratings.json
  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      render json: @rating, status: :created
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workshops/:workshop_id/ratings/1
  # PATCH/PUT /workshops/:workshop_id/ratings/1.json
  def update
    if @rating.update(rating_params)
      render json: nil, status: :no_content
    else
      render json: @rating.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workshops/:workshop_id/ratings/1
  # DELETE /workshops/:workshop_id/ratings/1.json
  def destroy
    if @rating
      @rating.destroy
      render json: nil, status: :no_content
    else
      render json: {}, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:rating, :creator_id).merge(:rated_id => workshop_id(), :rated_type => 'Workshop')
    end

    def workshop_id()
      params[:workshop_id]
    end
end
