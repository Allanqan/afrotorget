class CreateAdverts < ActiveRecord::Migration[6.1]
  def change
    create_table :adverts do |t|
      t.text :title
      t.string :image
      t.string :video
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
