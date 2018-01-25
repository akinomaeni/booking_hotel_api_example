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

  def exec(stripe_email, stripe_token)
    return unless new_record?

    customer = Stripe::Customer.create(email: stripe_email, source: stripe_token)
    Stripe::Charge.create(
      customer:    customer.id,
      amount:      amount,
      description: booking.description,
      currency:    currency
    )

    save
  rescue Stripe::CardError, Stripe::InvalidRequestError => e
    logger.error e.class
    logger.error e.message
    logger.error e.backtrace.join("\n")
    false
  end
end
