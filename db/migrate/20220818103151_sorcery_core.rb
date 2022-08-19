class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.integer :age, null: false, default: 20
      t.integer :sex, null: false, default: 0
      t.integer :height, null: false, default: 170
      t.integer :weight, null: false, default: 65
      t.integer :rucksack_weight, null: false, default: 0
      t.integer :role, null: false, default: 0

      t.timestamps                null: false
    end
  end
end
