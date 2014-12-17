angular.module('blog.blogPost')
.controller('BlogListController',
["$scope", "BlogPost", "ngProgress", "flash", ($scope, blogPost, ngProgress, flash) ->
  blogPost.loadAll().then(
    (data)->
      $scope.posts = data.data.blog_posts
      
  )
])

