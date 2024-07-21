class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :header, null: false
      t.string :description, null: false
      t.string :video_link, null: false

      t.timestamps
    end
  end
end
