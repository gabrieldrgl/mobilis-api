class Van < ApplicationRecord
  belongs_to :company
  has_one :driver, -> { where(role: :driver) }, class_name: "User"
  has_many :students, -> { where(role: :student) }, class_name: "User"
  has_many :routes

  validates :license_plate, presence: true

  def route_in_progress?
    routes.last&.in_progress?
  end
end
