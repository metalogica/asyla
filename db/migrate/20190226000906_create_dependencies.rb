class CreateDependencies < ActiveRecord::Migration[5.2]
  def change
    create_table :dependencies do |t|
      t.references :task, foreign_key: true
      t.references :depends_on_task, foreign_key: { to_table: :tasks }

      t.timestamps
    end
  end
end
