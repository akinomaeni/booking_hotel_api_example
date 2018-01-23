# == Schema Information
#
# Table name: rooms
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  room_type_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Room < ApplicationRecord
  belongs_to :room_type
  has_many :bookings
  has_many :room_stocks
end
