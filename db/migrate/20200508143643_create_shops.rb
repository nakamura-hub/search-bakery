class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :station_name
      t.string :open
      t.string :close

      t.timestamps
    end
  end
end
