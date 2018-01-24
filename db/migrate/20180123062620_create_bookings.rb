class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true, null: false
      t.references :room, foreign_key: true, null: false
      t.date :first_night_on, null: false
      t.date :last_night_on, null: false

      t.timestamps
    end
  end
end
