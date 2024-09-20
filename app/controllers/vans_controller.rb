class VansController < ApplicationController
  before_action :set_company
  before_action :set_van, only: %i[show update destroy current_location]

  def index
    @vans = @company.vans
    render json: @vans, status: :ok
  end

  def show
    render json: @van, status: :ok
  end

  def create
    @van = @company.vans.build(van_params)

    if @van.save
      render json: @van, status: :created
    else
      render json: { errors: @van.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @van.update(van_params)
      render json: @van, status: :ok
    else
      render json: { errors: @van.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @van.destroy
    head :no_content
  end

  def current_location
    if @van.route_in_progress?
      last_location = @van.routes.last.locations.last

      render json: { current_location: last_location }, status: :ok
    else
      render json: { error: "No route in progress" }, status: :not_found
    end
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_van
    @van = @company.vans.find(params[:id])
  end

  def van_params
    params.require(:van).permit(:license_plate, :current_location)
  end
end
