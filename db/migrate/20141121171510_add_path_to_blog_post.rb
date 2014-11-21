class AddPathToBlogPost < ActiveRecord::Migration
  def change
    add_column :blog_posts, :path, :string, null:false
  end
end
