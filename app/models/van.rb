class Van < ApplicationRecord
  belongs_to :company
  has_one :driver, -> { where(role: :driver) }, class_name: "User"
  has_many :students, -> { where(role: :student) }, class_name: "User"

  validates :license_plate, presence: true

  def on_route?
    current_location.present?
  end
end
