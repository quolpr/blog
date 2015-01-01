angular.module('blog.blogPost')
.factory('BlogPost', ['$http',($http) ->
  BlogPost = (blogPostData)->
    #some methods

  BlogPost.prototype = {
    load: (id) ->
      $http.get("/blog_posts/#{id}")
    loadAll: (offset=0, count=10) ->
      $http.get("/blog_posts?offset=#{offset}&count=#{count}")
    create: (title, post, tags) ->
      $http.post("/blog_posts", {blog_post:{title:title, post:post, tags:tags}})
  }
  new BlogPost
])