class DeletePreviousBindTagsToPost < ActiveRecord::Migration
  def change
    remove_column :tags, :blog_post_id
  end
end
