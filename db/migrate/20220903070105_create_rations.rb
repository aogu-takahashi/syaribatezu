class CreateRations < ActiveRecord::Migration[7.0]
  def change
    create_table :rations do |t|
      t.string :name, null: false
      t.integer :energy, default: 0, null: false

      t.timestamps
    end
  end
end
