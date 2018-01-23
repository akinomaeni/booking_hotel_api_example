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

require 'test_helper'

class RoomTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
