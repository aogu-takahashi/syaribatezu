class AddDateToMemos < ActiveRecord::Migration[7.0]
  def change
    add_column :memos, :date, :date
  end
end
