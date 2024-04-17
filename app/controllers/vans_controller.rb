class VansController < ApplicationController
  before_action :set_van, only: %i[ show update destroy ]

  # GET /vans
  def index
    @vans = Van.all

    render json: @vans
  end

  # GET /vans/1
  def show
    render json: @van
  end

  # POST /vans
  def create
    @van = Van.new(van_params)

    if @van.save
      render json: @van, status: :created, location: @van
    else
      render json: @van.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vans/1
  def update
    if @van.update(van_params)
      render json: @van
    else
      render json: @van.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vans/1
  def destroy
    @van.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_van
      @van = Van.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def van_params
      params.require(:van).permit(:license_plate, :color, :company_id)
    end
end
