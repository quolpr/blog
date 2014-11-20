json.blog_posts @blog_posts do |blog_post|
  json.partial! 'blog_posts/blog_post', blog_post: blog_post


end

json.pages do
  json.count   BlogPost.count
end