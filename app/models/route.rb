class Route < ApplicationRecord
  belongs_to :van

  enum status: { in_progress: 0, completed: 1 }
end
