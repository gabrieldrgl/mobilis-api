class Van < ApplicationRecord
  belongs_to :company
  has_many :users

  validates :license_plate, presence: true
end
