class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :message
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
