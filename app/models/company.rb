class Company < ApplicationRecord
  has_many :users

  def students
    users.where(role: :student)
  end

  def drivers
    users.where(role: :driver)
  end

  def moderators
    users.where(role: :moderator)
  end
end
