class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :details
      t.string :deadline
      t.boolean :completed
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
