# == Schema Information
#
# Table name: chargings
#
#  id         :integer          not null, primary key
#  booking_id :integer
#  amount     :integer
#  currency   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ChargingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
