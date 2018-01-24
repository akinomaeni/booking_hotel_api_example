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

  validates :user, :room, :first_night_on, :last_night_on, presence: true

  def self.make(user, room, duration)
    b = Booking.new(user: user, room: room, first_night_on: duration.first, last_night_on: duration.last)
    transaction do
      stocks = room.room_stocks.where(date: duration)
      if b.number_of_nights < stocks.size
        return false
      end

      stocks.destroy
      b.save
    end
  end

  def number_of_nights
    (last_night_on - first_night_on).to_i + 1
  end
end
