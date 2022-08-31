class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.belongs_to :mountain

      t.string :name, null: false
      t.integer :days, default: 1, null: false
      t.integer :walking_time, default: 0, null: false
      t.integer :distance, default: 0, null: false
      t.integer :denivele_plus, default: 0, null: false
      t.integer :denivele_minus, default: 0, null: false

      t.timestamps
    end
  end
end
