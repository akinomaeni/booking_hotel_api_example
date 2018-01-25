# == Schema Information
#
# Table name: rooms
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  room_type_id :integer          not null
#  price        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Room < ApplicationRecord
  belongs_to :room_type
  has_many :bookings
  has_many :room_stocks
  has_one :hotel, through: :room_type

  validates :name, :room_type, :price, presence: true
end
