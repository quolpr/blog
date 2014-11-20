class LinkBlogAndTags < ActiveRecord::Migration
  def change
    create_table :blog_posts_tags do |t|
      t.belongs_to :tag
      t.belongs_to :blog_post
    end
  end
end
