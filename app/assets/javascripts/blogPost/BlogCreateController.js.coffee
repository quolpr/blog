angular.module('blog.blogPost')
.controller('BlogCreateController',
["$scope", "BlogPost", "ngProgress", '$interval', ($scope, blogPost, ngProgress, $interval) ->
  $scope.post = {
    title: '',
    post: '',
    tags: ''
  }

  actions = $scope.actions = {}
  actions.submit = ->
    blogPost.create($scope.post.title, $scope.post.post, $scope.post.tags).then(
      () ->
  )

])

