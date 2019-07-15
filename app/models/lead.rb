class Lead < ApplicationRecord
  enum delivery_status: [:unsent, :sending, :sent]
  validates :email, :delivery_status, presence: true
  validates :email, uniqueness: true
end
