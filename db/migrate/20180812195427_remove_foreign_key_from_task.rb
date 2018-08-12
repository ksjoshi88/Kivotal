class RemoveForeignKeyFromTask < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :tasks, column: :developer_id
    change_column :tasks, :developer_id, :integer, null: true
  end
end
