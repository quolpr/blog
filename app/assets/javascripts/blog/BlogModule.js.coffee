blogPost = angular.module('blogPostModule', [])

blogPost.config([ '$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider)->
    $urlRouterProvider.otherwise("/");
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
      .state('read_post', {
        url: "/post/{path}_{id:[0-9]}",
        views: {
          'main_content': {
            templateUrl: 'post.html',
            controller: 'BlogPostController'
          }
          
        }
      })
])
