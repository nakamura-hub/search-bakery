class AddUserdescribeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :describe, :string
  end
end
