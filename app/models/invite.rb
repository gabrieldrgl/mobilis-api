class Invite < ApplicationRecord
  belongs_to :company

  before_create :generate_token

  validates :token, presence: true, uniqueness: true
  enum role: { student: 0, driver: 1, moderator: 2 }

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end
