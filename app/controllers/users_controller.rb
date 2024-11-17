class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!

  before_action :set_user

  def show
    render json: { user: @user }, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
