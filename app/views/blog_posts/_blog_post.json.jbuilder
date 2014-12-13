json.extract! blog_post, :id, :title, :path, :created_at, :updated_at
json.tags blog_post.tags, :name, :id, :path