angular.module('blogModule').controller('BlogListController',
  ["$scope", "BlogPost", ($scope, blogPost) ->
    blogPost.query((data)->
      $scope.posts = data
    ) 
])

