json.blog_posts @blog_posts do |blog_post|
  json.partial! 'blog_posts/blog_post', blog_post: blog_post
  
  if blog_post.preamble_part == ''
    json.post blog_post.main_part
  else
    json.post blog_post.preamble_part
  end
  
  
end

json.pages do
  json.count   BlogPost.count
end