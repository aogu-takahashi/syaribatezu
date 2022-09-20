class RemouveDateFromMemos < ActiveRecord::Migration[7.0]
  def up
    remove_column :memos, :date
  end

  def down
    add_column :memos, :date, :integer
  end
end
