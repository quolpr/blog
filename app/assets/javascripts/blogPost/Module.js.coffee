blogPost = angular.module('blog.blogPost', [
  'ui.router',
  'templates',
  'ngProgress',
  'btford.markdown',
  'smoothScroll'
])

blogPost.config([ '$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider)->
    $stateProvider
      .state('blog.post', {
        url: '',
        abstract:true
      })
      .state('blog.post.list', {
        url: "/",
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
          usingAjax: false
        }
      })
])
