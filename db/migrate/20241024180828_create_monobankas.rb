class CreateMonobankas < ActiveRecord::Migration[7.0]
  def change
    create_table :monobankas do |t|
      t.string :monobankalink, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
