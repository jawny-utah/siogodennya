class AddActiveBooleanStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :active, :boolean, default: false
    add_column :products, :active, :boolean, default: false
  end
end
