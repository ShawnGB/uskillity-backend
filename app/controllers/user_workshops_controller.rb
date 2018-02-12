class UserWorkshopsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    if user == nil
      return render json: nil, status: :not_found
    end
    render json: WorkshopRepository.workshops_by_user(user), status: :ok
  end

end
