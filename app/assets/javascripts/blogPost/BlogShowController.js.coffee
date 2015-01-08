angular.module('blog.blogPost')
.controller('BlogShowController', ["$scope", "BlogPost", "$stateParams",   ($scope, blogPost, $stateParams) ->
  $scope.loading = true
  blogPost.load($stateParams.id).success((data)->
    $scope.post = data
    $scope.loading = false
  )
])