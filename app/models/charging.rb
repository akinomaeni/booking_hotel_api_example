# == Schema Information
#
# Table name: chargings
#
#  id         :integer          not null, primary key
#  booking_id :integer
#  amount     :integer
#  currency   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Charging < ApplicationRecord
  belongs_to :booking
end
