class CreateMountainLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :mountain_locations do |t|
      t.belongs_to :mountain, foreign_key: true
      t.belongs_to :prefecture, foreign_key: true

      t.timestamps
    end
  end
end
