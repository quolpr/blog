angular.module('blog.blogPost')
.controller('BlogCreateController',
["$scope", "BlogPost", "ngProgress", '$interval', 'TagConverter', ($scope, blogPost, ngProgress, $interval, tagConverter) ->
  $scope.post = {
    title: '',
    post: '',
    tags: ''
  }

  actions = $scope.actions = {}
  actions.submit = ->
    blogPost.create($scope.post.title, $scope.post.post, tagConverter.convert($scope.post.tags)).then(
      () ->
  )

])

