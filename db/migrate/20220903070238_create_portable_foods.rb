class CreatePortableFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :portable_foods do |t|
      t.integer :volume, default: 0, null: false
      t.references :memo, null: false, foreign_key: true
      t.references :ration, null: false, foreign_key: true

      t.timestamps
    end
  end
end
