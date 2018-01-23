# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  room_id    :integer          not null
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :user, :room, :start_at, :end_at, presence: true

  def self.make(user, room, duration)
    b = Booking.new(user: user, room: room, start_at: duration.first, end_at: duration.last)
    transaction do
      stocks = room.room_stocks.where(start_at: duration)
      if count_months < stocks.size
        return false
      end

      stocks.destroy
      b.save
    end
  end

  def count_months
    (end_at.year - start_at.year) * 12 + end_at.month - start_at.month + 1
  end
end
