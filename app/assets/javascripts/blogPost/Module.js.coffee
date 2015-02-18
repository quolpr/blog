blogPost = angular.module('blog.blogPost', [
  'ui.router',
  'templates',
  'ngProgress',
  'btford.markdown',
  'smoothScroll',
  'blog.common'
])

blogPost.config([ '$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider)->
    $stateProvider
      .state('blog.post', {
        url: '',
        abstract: true
      })
      .state('blog.post.list', {
        url: "/{page:[0-9]*}",
        params: {
          page: {
            value: '1'
          }
        },
        views: {
          'main_content@': {
            templateUrl:  'post_list.html',
            controller:   'BlogListController'
          }
        }
      })
      .state('blog.post.show', {
        url: "/post/{path}_{id:[0-9]*}",
        views: {
          'main_content@': {
            templateUrl: 'post.html',
            controller: 'BlogShowController'
          }
          
        }
      })
      .state('blog.post.create', {
        url: "/post/create",
        views: {
          'main_content@': {
            templateUrl: 'create_post.html',
            controller:  'BlogCreateController'
          }
        }
        data: {
          dataPreload: false
        }
      })

      .state('blog.auth.logout', {
        url: "/logout"
        onEnter: ['AuthManager', 'flash', '$rootScope', '$state', (authManager, flash, $rootScope, $state)->
          authManager.logout()
          $state.go('blog.post.list').then ->
            flash.success = 'You was logged out'
        ]
      })
      .state('blog.post.delete', {
        url: "/post/delete/{id:[0-9]*}",
        onEnter: ['BlogPost', 'flash', '$state', '$stateParams', (blogPost, flash, $state, $stateParams)->
          console.log $stateParams
          $state.go('blog.post.list').then ->
            flash.success = 'You was logged out'
        ]
      })
])

blogPost.value 'PostsPerPage', 1