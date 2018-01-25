User.create(name: "John Smith")

h = Hotel.create(name: "The SF Hotel", address: "333 Post St, San Francisco, CA 94108")
rt = h.room_types.create(name: "Normal room")
r = rt.rooms.create(name: "101", price: 5000)

1.upto(40) do |i|
  r.room_stocks.create(date: Time.zone.today + 40 + i)
  r.room_stocks.create(date: Time.zone.today + 80 + i)
end
