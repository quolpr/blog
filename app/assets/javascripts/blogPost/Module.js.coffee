blogPost = angular.module('blog.blogPost', [
  'ui.router',
  'templates',
  'ngProgress',
  'ngCkeditor'
])

blogPost.config([ '$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider)->
    $stateProvider
      .state('post_list', {
        url: "/",
        views: {
          'main_content': {
            templateUrl:  'post_list.html',
            controller:   'BlogListController'
          },
          'sidebar': {
            templateUrl: 'sidebar.html'
          }
        }
      })
      .state('show_post', {
        url: "/post/{path}_{id:[0-9]}",
        views: {
          'main_content': {
            templateUrl: 'post.html',
            controller: 'BlogShowController'
          }
          
        }
      })
      .state('create_post', {
        url: "/post/create",
        views: {
          'main_content': {
            templateUrl: 'create_post.html',
            controller:  'BlogCreateController'
          }
        }
      })
])
