class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.integer :price

      t.timestamps
    end
  end
end
