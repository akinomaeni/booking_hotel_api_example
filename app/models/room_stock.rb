# == Schema Information
#
# Table name: room_stocks
#
#  id         :integer          not null, primary key
#  room_id    :integer          not null
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomStock < ApplicationRecord
  belongs_to :room

  validates :room, :date, presence: true
end
