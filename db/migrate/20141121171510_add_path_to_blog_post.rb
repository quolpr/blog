class AddPathToBlogPost < ActiveRecord::Migration
  def change
    add_column :blog_posts, :path, :string
  end
end
