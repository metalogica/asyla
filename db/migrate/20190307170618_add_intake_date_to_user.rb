class AddIntakeDateToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :intake_date, :datetime
  end
end
