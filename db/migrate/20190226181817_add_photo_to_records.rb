class AddPhotoToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :photo, :string
  end
end
