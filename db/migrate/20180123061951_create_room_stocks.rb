class CreateRoomStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :room_stocks do |t|
      t.references :room, foreign_key: true, null: false
      t.date :date, null: false

      t.timestamps
      t.index [:room_id, :date], unique: true
    end
  end
end
