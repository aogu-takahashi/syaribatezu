class ChangeDataCourse < ActiveRecord::Migration[7.0]
  def change
    change_column :courses, :walking_time, :float
    change_column :courses, :distance, :float
    change_column :courses, :denivele_plus, :float
    change_column :courses, :denivele_minus, :float
  end
end
