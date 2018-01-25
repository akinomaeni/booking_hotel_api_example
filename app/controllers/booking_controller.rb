class BookingController < ApplicationController
  before_action :authenticate, :set_room

  def create
    b = Booking.new(
      user: @current_user,
      room: @room,
      first_night_on: Date.parse(params[:firstNightOn]),
      last_night_on: Date.parse(params[:lastNightOn])
    )

    if b.make(params[:stripeEmail], params[:stripeToken])
      render json: {
        id:           b.id,
        firstNightOn: b.first_night_on,
        lastNightOn:  b.last_night_on,
        room: {
          id:         b.room.id,
          name:       b.room.name
        },
        hotel: {
          id:         b.room.hotel.id,
          name:       b.room.hotel.name,
          address:    b.room.hotel.address
        }
      }, status: 201
    elsif b.errors.message == "The payment was failed."
      render json: { error: { message: b.errors.message } }, status: 402
    elsif b.errors.message == "The room is not available."
      render json: { error: { message: b.errors.message } }, status: 409
    else
      render json: { error: { message: "Invalid request" } }, status: 400
    end
  end

  private

  def set_room
    @room = Room.includes(:hotel).find(params[:roomId])
  end
end
