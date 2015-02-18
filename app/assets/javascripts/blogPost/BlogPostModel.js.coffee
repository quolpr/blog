angular.module('blog.blogPost')
.service('BlogPost', ['$http', 'PostsPerPage',
  class BlogPost
    constructor: (@$http, @PostsPerPage) ->

    load: (id) ->
      @$http.get("/blog_posts/#{id}")
    loadAll: (@page=1) ->
      offset = (@page-1) * @PostsPerPage
      @$http.get("/blog_posts?offset=#{offset}&limit=#{@PostsPerPage}")
    create: (title, post, tags) ->
      @$http.post("/blog_posts", {blog_post:{title:title, post:post, tags:tags}})
])