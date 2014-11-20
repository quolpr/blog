if @blog_post.valid?
  json.id @blog_post.id
else
  json.errors @blog_post.errors
end