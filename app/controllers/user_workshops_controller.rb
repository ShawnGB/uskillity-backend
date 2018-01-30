class UserWorkshopsController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    if user == nil
      return render json: nil, status: :not_found
    end
    render json: user.workshops_offered.includes(:provider), status: :ok
  end

end
