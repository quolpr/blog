json.partial! 'blog_posts/blog_post', blog_post: @blog_post
json.post @blog_post.preamble_part + @blog_post.main_part