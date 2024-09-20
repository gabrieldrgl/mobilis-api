class Route < ApplicationRecord
  belongs_to :van
  has_many :locations

  enum status: { in_progress: 0, completed: 1 }
end
