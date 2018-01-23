# == Schema Information
#
# Table name: room_stocks
#
#  id         :integer          not null, primary key
#  room_id    :integer          not null
#  start_at   :datetime         not null
#  end_at     :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RoomStockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
