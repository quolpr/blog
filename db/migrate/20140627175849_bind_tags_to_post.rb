class BindTagsToPost < ActiveRecord::Migration
  def change
    add_column :tags, :blog_post_id, :integer
  end
end
