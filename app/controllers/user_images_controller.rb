class UserImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_user.id != user_id.to_i
      return render json: {error: 'permission denied'}, status: :forbidden
    end

    user_image = Image.new(user_image_params)

    if user_image.save
      render json: user_image, status: :created
    else
      render json: user_image.errors, status: :unprocessable_entity
    end
  end

  private

  def user_image_params
    params.permit(:url).merge(:of_id => user_id(), :of_type => 'User', :user_id => user_id())
  end

  def user_id
    params[:user_id]
  end
end
