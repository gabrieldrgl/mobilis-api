class Address < ApplicationRecord
  belongs_to :user

  validates :street, :city, :state, :postal_code, :number, presence: true
end
