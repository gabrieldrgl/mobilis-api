class Role < ApplicationRecord
  belongs_to :user
  belongs_to :company

  enum role: { student: 0, driver: 1, moderator: 2 }

  validates :user_id, uniqueness: { scope: [:company_id, :role], message: "can only have one role per company" }
end
