class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :number
      t.references :room_type, foreign_key: true

      t.timestamps
    end
  end
end
