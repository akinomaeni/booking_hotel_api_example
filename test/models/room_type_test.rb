# == Schema Information
#
# Table name: room_types
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  hotel_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RoomTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
