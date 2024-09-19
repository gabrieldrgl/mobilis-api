class User < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :van, optional: true
  has_one :address

  accepts_nested_attributes_for :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :api

  enum role: { student: 0, driver: 1, moderator: 2 }

  validates :name, presence: true
  validate :van_belongs_to_same_company

  private

  def van_belongs_to_same_company
    if van.present? && van.company_id != company_id
      errors.add(:van, "must belong to the same company as the van")
    end
  end
end
