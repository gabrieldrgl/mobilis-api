class Company < ApplicationRecord
  has_many :users
  has_many :vans

  accepts_nested_attributes_for :users, allow_destroy: false

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
