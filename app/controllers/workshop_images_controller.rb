class WorkshopImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    w = workshop()
    if w.nil?
      return render json: nil, status: :not_found
    end

    if current_user.id != w.provider_id
      return render json: {error: 'permission denied'}, status: :forbidden
    end

    workshop_image = Image.new(workshop_image_params)

    if workshop_image.save
      render json: workshop_image, status: :created
    else
      render json: workshop_image.errors, status: :unprocessable_entity
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def workshop_image_params
    params.require(:image).permit(:url).merge(:of_id => workshop_id(), :of_type => 'Workshop')
  end

  def workshop_id()
    params[:workshop_id]
  end

  def workshop
    Workshop.find_by(id: workshop_id)
  end
end
