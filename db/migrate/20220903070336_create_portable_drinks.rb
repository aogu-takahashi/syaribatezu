class CreatePortableDrinks < ActiveRecord::Migration[7.0]
  def change
    create_table :portable_drinks do |t|
      t.integer :volume, default: 0, null: false
      t.references :memo, null: false, foreign_key: true
      t.references :drink, null: false, foreign_key: true

      t.timestamps
    end
  end
end
