# == Schema Information
#
# Table name: hotels
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hotel < ApplicationRecord
  has_many :room_types
end
