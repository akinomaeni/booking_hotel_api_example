class BookingController < ApplicationController
  before_action :authenticate, :set_room

  def create
    b = Booking.make(
      @current_user,
      @room,
      Date.parse(params[:first_night_on]),
      Date.parse(params[:last_night_on]),
      stripe_email: params[:stripeEmail],
      stripe_token:  params[:stripeToken]
    )

    if b
      render json: {
        id: b.id,
        first_night_on: b.first_night_on,
        last_night_on: b.last_night_on,
        room: {
          id: b.room.id,
          name: b.room.name
        },
        hotel: {
          id: b.room.hotel.id,
          name: b.room.hotel.name
        }
      }, status: 201
    else
      render json: { error: { message: "Error" } }, status: 400
    end
  end

  private

  def set_room
    @room = Room.includes(:hotel).find(params[:room_id])
  end
end
