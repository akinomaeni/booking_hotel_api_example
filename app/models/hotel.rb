# == Schema Information
#
# Table name: hotels
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hotel < ApplicationRecord
  has_many :room_types
end
