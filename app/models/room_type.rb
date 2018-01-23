# == Schema Information
#
# Table name: room_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  hotel_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomType < ApplicationRecord
  belongs_to :hotel
  has_many :rooms
end
