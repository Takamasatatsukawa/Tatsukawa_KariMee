class Trap < ApplicationRecord
  belongs_to :user
  validates :lat, :lng, presence: true
  validates :trap_type, presence: true
  validates :start_date, :end_date, presence: true
end
