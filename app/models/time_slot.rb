class TimeSlot < ApplicationRecord
  belongs_to :venue
  belongs_to :performer
  belongs_to :promoter, through: :venue

  validates :start_time, :end_time, presence:true
end
