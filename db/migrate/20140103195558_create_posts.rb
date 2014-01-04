class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :desc
      t.text :text
      t.boolean :active

      t.timestamps
    end
  end
end
