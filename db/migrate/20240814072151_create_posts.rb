class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    unless table_exists?(:posts)
      create_table :posts do |t|
        t.string :title
        t.text :body
        t.timestamps
      end
    end
  end
end
