class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true
      t.boolean :problem

      t.timestamps
    end
  end
end
