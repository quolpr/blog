angular.module('blog.blogPost')
.controller('BlogListController',
["$scope", "BlogPost", "flash", 'smoothScroll',($scope, blogPost, flash, smoothScroll) ->
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

