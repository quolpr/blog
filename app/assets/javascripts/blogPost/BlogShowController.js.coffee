angular.module('blog.blogPost')
.controller('BlogShowController', ["$scope", "BlogPost", "$stateParams", "ngProgress",  ($scope, blogPost, $stateParams, ngProgress) ->
  ngProgress.start()
  blogPost.load($stateParams.id).success((data)->
    $scope.post = data
    ngProgress.complete()
  )
])