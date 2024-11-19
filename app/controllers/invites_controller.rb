class InvitesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!

  def create
    @company = current_devise_api_token.resource_owner.company
    @invite = @company.invites.build(invite_params)

    if @invite.save
      render json: { token: @invite.token, role: @invite.role }, status: :created
    else
      render json: { errors: @invite.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def accept
    @invite = Invite.find_by(token: params[:token])

    if @invite.nil?
      render json: { error: "Invalid invite" }, status: :not_found
    else
      if @invite.role == "student"
        @address = Address.new(address_params)
        @address.user = current_devise_api_token.resource_owner

        unless @address.save
          render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
          return
        end
      end

      current_devise_api_token.resource_owner.update(company: @invite.company, role: @invite.role, name: params[:name])
      @invite.destroy

      render json: { message: "You have successfully joined the company!", role: current_devise_api_token.resource_owner.role }, status: :ok
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :postal_code, :number, :latitude, :longitude)
  end

  def invite_params
    params.require(:invite).permit(:role)
  end
end
