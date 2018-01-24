class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.references :room_type, foreign_key: true, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
