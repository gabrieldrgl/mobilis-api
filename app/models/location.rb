class Location < ApplicationRecord
  belongs_to :route

  validates :latitude, :longitude, presence: true
end
