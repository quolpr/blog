angular.module('blog.blogPost')
.controller('BlogCreateController',
["$scope", "BlogPost", "ngProgress", '$interval', ($scope, blogPost, ngProgress, $interval) ->
  $scope.post = {
    title: '',
    post: ''
  }
  $interval(->
    console.log($scope.post)
  , 1000)

])

