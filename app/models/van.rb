class Van < ApplicationRecord
  belongs_to :company
  has_one :driver, -> { where(role: :driver) }, class_name: "User"
  has_many :students, -> { where(role: :student) }, class_name: "User"
  has_many :routes

  validates :license_plate, presence: true, format: { with: /\A[A-Z]{3}[0-9][A-Z0-9][0-9]{2}\z/, message: "deve estar no formato ABC1D23 ou AAA0000" }

  def route_in_progress?
    routes.last&.in_progress?
  end
end
