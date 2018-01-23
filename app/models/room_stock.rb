# == Schema Information
#
# Table name: room_stocks
#
#  id         :integer          not null, primary key
#  room_id    :integer
#  start_at   :datetime
#  end_at     :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomStock < ApplicationRecord
  belongs_to :room
end
