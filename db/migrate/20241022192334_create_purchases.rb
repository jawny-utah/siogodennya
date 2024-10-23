class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :city, null: false
      t.string :np_post_office, null: false
      t.string :phone_number, null: false
      t.string :full_name, null: false
      t.string :comment
      t.belongs_to :product

      t.timestamps
    end
  end
end
