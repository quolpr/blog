class ChangeBlogPostColumnBody < ActiveRecord::Migration
  def change
    change_column :blog_posts, :post, :text

  end
end
