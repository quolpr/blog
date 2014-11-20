angular.module('blogModule').controller('BlogPostController',
  ["$scope",
    ($scope) ->
      post = {
        id:     1,
        title: 'Blog title',
        post:  'Hello world!<br/><br/>test :)',
        path:  'blog_title',
        date:  'date',
        tags: [
          {id:1, name:'first'},
          {id:2, name:'tag'}
        ]
      }
      
      $scope.post = post
])