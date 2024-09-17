class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.string :brand
      t.string :image
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
