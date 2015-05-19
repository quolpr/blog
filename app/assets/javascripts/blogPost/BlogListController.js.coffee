angular.module('blog.blogPost')
.controller('BlogListController',
["$scope", "BlogPost", 'PostsPerPage', '$state', '$stateParams', ($scope, blogPost, PostsPerPage, $state, $stateParams) ->
  
  $scope.loading = true
  $scope.posts = {}
  blogPost.loadAll($stateParams.page).then(
    (data)->
      $scope.loading = false
      $scope.posts = data.data.blog_posts

      $scope.delete = blogPost.delete

      $scope.pagination = {
        currentPage: $stateParams.page
        perPage: PostsPerPage
        count: data.data.count
        pageChanged: -> $state.go('blog.post.list', {page: this.currentPage})
      }
  )
  
])

