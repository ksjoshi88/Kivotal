class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string     :todo
      t.integer    :status, default: 0
      t.references :project, index: true
      t.integer    :developer_id
      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :developer_id, index: true
  end
end
