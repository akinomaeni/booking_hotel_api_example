class Room < ApplicationRecord
  belongs_to :room_type
  has_many :bookings
  has_many :room_stocks
end
