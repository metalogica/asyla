class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :nationality, :string
    add_column :users, :language, :string
    add_column :users, :address, :string
  end
end
