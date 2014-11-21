angular.module('blogModule').controller('BlogShowController',
  ["$scope", "BlogPost", ($scope, blogPost) ->
    blogPost.get({id:})
])