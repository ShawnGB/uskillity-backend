class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def show
    if @user.nil?
      return render json: nil, status: :not_found
    end
    render json: @user, status: :ok
  end

  def update
    if @user.nil?
      return render json: nil, status: :not_found
    end

    if current_user.id != @user.id
      return render json: {error: 'permission denied'}, status: :forbidden
    end

    if @user.update(user_params)
      render json: nil, status: :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.nil?
      return render json: nil, status: :not_found
    end

    if current_user.id != @user.id
      return render json: {error: 'permission denied'}, status: :forbidden
    end

    @user.destroy
    render json: nil, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :first_name, :locale, :gender, :nickname)
    end
end
