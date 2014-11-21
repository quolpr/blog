angular.module('blog.blogPost')
.controller('BlogShowController', ["$scope", "BlogPost", "$stateParams",  ($scope, blogPost, $stateParams) ->
  blogPost.load($stateParams.id).success((data)->
    $scope.post = data
  )
])