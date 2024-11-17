class CompaniesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!

  before_action :set_company, only: %i[show update destroy students drivers moderators remove_user]

  def show
    render json: @company, status: :ok
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @company.update(company_params)
      render json: @company, status: :ok
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @company.destroy
    head :no_content
  end

  def students
    @students = @company.students
    render json: @students, status: :ok
  end

  def drivers
    @drivers = @company.drivers
    render json: @drivers, status: :ok
  end

  def moderators
    @moderators = @company.moderators
    render json: @moderators, status: :ok
  end

  def remove_user
    user = @company.users.find_by(id: params[:user_id])
    if user
      user.update(company_id: nil, van: nil)
      render json: { message: "Aluno removido com sucesso." }, status: :ok
    else
      render json: { error: "Aluno não encontrado." }, status: :not_found
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name)
  end
end
