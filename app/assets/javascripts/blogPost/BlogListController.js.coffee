angular.module('blog.blogPost')
.controller('BlogListController',
["$scope", "BlogPost", "ngProgress", "flash", ($scope, blogPost, ngProgress, flash) ->
  $scope.loading = true
  blogPost.loadAll().then(
    (data)->
      $scope.loading = false
      $scope.posts = data.data.blog_posts
      
  )
])

