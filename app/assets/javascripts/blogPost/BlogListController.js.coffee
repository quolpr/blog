angular.module('blog.blogPost')
.controller('BlogListController',
["$scope", "BlogPost", "ngProgress", "flash", 'smoothScroll',($scope, blogPost, ngProgress, flash, smoothScroll) ->
  $scope.loading = true

  $scope.onReadMore = ->
    smoothScroll(
      duration: 500
      offset:   0
      easing:   'easeInQuad'
    )

  blogPost.loadAll().then(
    (data)->
      $scope.loading = false
      $scope.posts = data.data.blog_posts
  )

])

