# == Schema Information
#
# Table name: bookings
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  room_id        :integer          not null
#  first_night_on :date             not null
#  last_night_on  :date             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one :charging

  validates :user, :room, :first_night_on, :last_night_on, presence: true
  def charge
    c = charging.new(amount: price, currency: Charging::USD)
    c.exec(stripe_email, stripe_token)
  end

  def description
    "#{room.name} #{room.hotel.name} #{first_night_on} - #{last_night_on}"
  end

  def duration
    first_night_on..last_night_on
  end

  def make(stripe_email, stripe_token)
    return unless new_record?

    transaction do
      stocks = room.room_stocks.where(date: duration).lock.load
      if stocks.size < number_of_nights
        self.errors.message = "The room is not available."
        return false
      end
      stocks.destroy_all

      unless charge(stripe_email, stripe_token)
        self.errors.message = "The payment was failed."
        return false
      end
      save
    end
  end

  def number_of_nights
    duration.count
  end

  def price
    room.price * number_of_nights
  end
end
