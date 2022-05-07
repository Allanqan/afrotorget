class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.text :name
      t.text :description
      t.text :photo
      t.text :location
      t.integer :price
      t.boolean :favorite
      t.references :user, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
