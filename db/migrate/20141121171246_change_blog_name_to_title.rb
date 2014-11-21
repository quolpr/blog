class ChangeBlogNameToTitle < ActiveRecord::Migration
  def change
    rename_column :blog_posts, :name, :title
  end
end
