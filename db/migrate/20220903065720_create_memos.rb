class CreateMemos < ActiveRecord::Migration[7.0]
  def change
    create_table :memos do |t|
      t.integer :date, null: false
      t.integer :temperature, default: 20, null: false
      t.text :description
      t.integer :done, default: 0, null: false
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
