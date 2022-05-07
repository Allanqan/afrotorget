class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :image
      t.text :video
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
