class CreateRoomStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :room_stocks do |t|
      t.references :room, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
