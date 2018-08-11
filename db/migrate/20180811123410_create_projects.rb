class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string  :title
      t.integer :manager_id, index: true
      t.timestamps
    end

    add_foreign_key :projects, :users, column: :manager_id

  end
end
