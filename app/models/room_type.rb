# == Schema Information
#
# Table name: room_types
#
#  id         :integer          not null, primary key
#  name       :string
#  hotel_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomType < ApplicationRecord
  belongs_to :hotel
  has_many :rooms
end
