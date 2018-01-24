class CreateChargings < ActiveRecord::Migration[5.1]
  def change
    create_table :chargings do |t|
      t.references :booking, foreign_key: true
      t.integer :amount
      t.string :currency

      t.timestamps
    end
  end
end
