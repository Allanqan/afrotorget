class CreateCompanyTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :company_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
