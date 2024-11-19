class Company < ApplicationRecord
  has_many :users
  has_many :vans
  has_many :invites

  VALID_CNPJ_REGEX = /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/

  validates :cnpj, presence: true, uniqueness: true, format: { with: VALID_CNPJ_REGEX, message: "must be in the format 00.000.000/0000-00" }
  validates :name, presence: true

  validate :valid_cnpj?

  def students
    users.where(role: :student)
  end

  def drivers
    users.where(role: :driver)
  end

  def moderators
    users.where(role: :moderator)
  end

  private

  def valid_cnpj?
    errors.add(:cnpj, "is invalid") unless CnpjUtils.valid?(cnpj)
  end
end
