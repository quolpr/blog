angular.module('blog.blogPost')
.controller('BlogShowController', ["$scope", "BlogPost", "$stateParams", "ngProgress",  ($scope, blogPost, $stateParams, ngProgress) ->
  $scope.loading = true
  blogPost.load($stateParams.id).success((data)->
    $scope.post = data
    $scope.loading = false
  )
])