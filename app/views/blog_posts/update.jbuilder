unless @blog_post.valid?
  json.errors @blog_post.errors
end