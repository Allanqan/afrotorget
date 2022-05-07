class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.integer :size
      t.text :location
      t.boolean :favorite
      t.references :user, null: false, foreign_key: true
      t.references :company_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
