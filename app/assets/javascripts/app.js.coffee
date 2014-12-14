# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

blog = angular.module('blog', [
  'blog.blogPost',
  'blog.auth',
  'ui.router',
  'templates',
  'blog.common'
])    


blog.config [ '$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider)->
    $urlRouterProvider.otherwise("/");
    $stateProvider
      .state('about_me', {
        url: "/about_me",
        views: {
          'main_content': {
            templateUrl: 'about_me.html'
          }
        }

      })
]

blog.config ['$httpProvider', ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]