angular.module('blog.blogPost')
.controller('BlogListController',
["$scope", "BlogPost", "ngProgress", "flash", ($scope, blogPost, ngProgress, flash) ->
  ngProgress.start()
  blogPost.loadAll().then(
    (data)->
      $scope.posts = data.data.blog_posts
      ngProgress.complete()
      
  )
])

