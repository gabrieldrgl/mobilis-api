class Company < ApplicationRecord
  has_many :roles
  has_many :users, through: :roles

  def students
    users.joins(:roles).where(roles: { role: Role.roles[:student], company_id: id }).distinct
  end

  def drivers
    users.joins(:roles).where(roles: { role: Role.roles[:driver], company_id: id }).distinct
  end

  def moderators
    users.joins(:roles).where(roles: { role: Role.roles[:moderator], company_id: id }).distinct
  end
end
