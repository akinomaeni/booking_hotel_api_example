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

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
