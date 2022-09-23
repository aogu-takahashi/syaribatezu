class ChangeColumsAddNotnullOnMemos < ActiveRecord::Migration[7.0]
  def change
    change_column_null :memos, :date, false
  end
end
