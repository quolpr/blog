angular.module('blog.blogPost')
.controller('BlogListController',
["$scope", "BlogPost", ($scope, blogPost) ->
  blogPost.loadAll().then(
    (data)->
      $scope.posts = data.data.blog_posts
  )
])

