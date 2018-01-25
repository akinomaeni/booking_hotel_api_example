# == Schema Information
#
# Table name: hotels
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  address    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hotel < ApplicationRecord
  has_many :room_types
  has_many :rooms, through: :room_types

  validates :name, :address, presence: true
end
