angular.module('blog.blogPost')
.controller('BlogListController',
["$scope", "BlogPost", "ngProgress", ($scope, blogPost, ngProgress) ->
  ngProgress.start()
  blogPost.loadAll().then(
    (data)->
      $scope.posts = data.data.blog_posts
      ngProgress.complete()
  )
])

