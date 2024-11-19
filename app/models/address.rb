class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :van, optional: true

  validates :street, :city, :postal_code, :number, :latitude, :longitude, presence: true
end
