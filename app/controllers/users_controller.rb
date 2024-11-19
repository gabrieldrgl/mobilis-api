class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!

  before_action :set_user

  def show
    render json: { user: @user, van: @user.van }, status: :ok
  end

  def checkin
    # Atualiza o checkin para true
    if @user.update(checkin: true)
      render json: { message: "Check-in realizado com sucesso!" }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
