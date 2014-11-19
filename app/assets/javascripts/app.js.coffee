# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
angular.module('blogModule', [])

blog = angular.module('blog', [
  'blogModule',
  'ui.router',
  'templates'
])    


blog.config([ '$stateProvider', '$urlRouterProvider',
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
      .state('about_me', {
        url: "/about_me",
        views: {
          'main_content': {
            templateUrl: 'about_me.html'
          }
        }
      })
])
