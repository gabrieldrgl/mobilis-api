class Route < ApplicationRecord
  belongs_to :van
  has_many :locations, dependent: :destroy

  accepts_nested_attributes_for :locations

  enum status: { in_progress: 0, completed: 1 }

  before_save :set_end_time_if_completed

  private

  def set_end_time_if_completed
    return unless completed? && end_time.nil?

    self.end_time = Time.current
  end
end
