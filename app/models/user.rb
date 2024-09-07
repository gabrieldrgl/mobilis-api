class User < ApplicationRecord
  has_many :roles
  has_many :companies, through: :roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :api
end
