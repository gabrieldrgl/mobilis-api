class User < ApplicationRecord
  belongs_to :company

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :api

  enum role: { student: 0, driver: 1, moderator: 2 }
end
