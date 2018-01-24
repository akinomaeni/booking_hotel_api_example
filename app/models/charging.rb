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

class Charging < ApplicationRecord

  USD = 'usd'

  belongs_to :booking

  def self.charge(booking, stripe_email, stripe_token)

    c = booking.chargings.new(
      amount: booking.room.price * booking.number_of_nights,
      currency: USD
    )

    customer = Stripe::Customer.create(email: stripe_email, source: stripe_token)

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => c.amount,
      :description => "#{booking.room.name} #{booking.room.hotel.name} #{booking.first_night_on} - #{booking.last_night_on}",
      :currency    => c.currency
    )

    c.save
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
