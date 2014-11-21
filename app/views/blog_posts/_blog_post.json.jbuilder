json.extract! blog_post, :id, :title, :path, :post, :created_at, :updated_at
json.tags blog_post.tags, :name, :id, :path