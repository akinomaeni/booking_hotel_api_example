class CreateRoomStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :room_stocks do |t|
      t.references :room, foreign_key: true, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false

      t.timestamps
    end
  end
end
