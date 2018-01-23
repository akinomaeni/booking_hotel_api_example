# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  room_id    :integer
#  start_at   :datetime
#  end_at     :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
