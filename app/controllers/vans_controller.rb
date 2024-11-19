class VansController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!

  before_action :set_company
  before_action :set_van, only: %i[show update destroy current_location]

  def index
    @vans = @company.vans
    render json: @vans, status: :ok
  end

  def show
    render json: {van: @van, driver: @van.driver, students: @van.students, destination: @van.destination}, status: :ok
  end

  def create
    @van = @company.vans.build(van_params)

    if @van.save
      @van.driver = User.find(permitted_params[:driver_id]) if permitted_params[:driver_id].present?
      @van.students = User.find(permitted_params[:student_ids]) if permitted_params[:student_ids].present?
      @address = Address.new(address_params)
      @address.van = @van

      unless @address.save
        render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
        return
      end

      render json: @van, status: :created
    else
      render json: { errors: @van.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @van.update(van_params)
      @van.driver = User.find(permitted_params[:driver_id]) if permitted_params[:driver_id].present?
      @van.students = User.find(permitted_params[:student_ids]) if permitted_params[:student_ids].present?

      @address = Address.new(address_params)
      @address.van = @van

      unless @address.save
        render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
        return
      end

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
    params.require(:van).permit(:license_plate, :current_location, :max_checkin_time_away, :max_checkin_time_return)
  end

  def address_params
    params.require(:address).permit(:street, :city, :postal_code, :number, :latitude, :longitude)
  end

  def permitted_params
    params.require(:van).permit(:driver_id, student_ids: [])
  end
end
