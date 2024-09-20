class RoutesController < ApplicationController
  before_action :set_van
  before_action :set_route, only: %i[update]

  def create
    @route = @van.routes.build(route_params)

    if @route.save
      render json: { students: @van.students.where(checkin: true) }, status: :created
    else
      render json: { errors: @route.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @route.update(route_params)
      render json: @route, status: :ok
    else
      render json: @route.errors, status: :unprocessable_entity
    end
  end

  private

  def set_van
    @van = Van.find(params[:van_id])
  end

  def set_route
    @route = @van.routes.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:status, locations_attributes: %i[latitude longitude])
  end
end
