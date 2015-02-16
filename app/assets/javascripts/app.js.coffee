# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.$ = window.jQuery = angular.element

blog = angular.module('blog', [
  'blog.blogPost',
  'blog.auth',
  'ui.router',
  'templates',
  'blog.common',
  'angular-flash.service', 
  'angular-flash.flash-alert-directive',
  'blog.progress'
])    


blog.config [ '$stateProvider', '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider)->
    $urlRouterProvider.otherwise("/");
    $stateProvider
      .state('blog',
        {
          url: '',
          views: {
            'sidebar': {
              templateUrl: 'sidebar.html'
            }
          },
          data: {
            useProgress: true
            dataPreload:   true
          },
          abstract: true
        }
      )
      .state('blog.about_me', {
        url: "/about_me",
        data: {
          dataPreload: false
        }
        views: {
          'main_content@': {
            templateUrl: 'about_me.html'
          }

        }

      })
]

blog.config ['$httpProvider', ($httpProvider)->

  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $(document.querySelector('meta[name=csrf-token]')).attr('content')
]


blog.run ['$rootScope', '$timeout', ($rootScope, $timeout) ->
  $timeout(
    ()-> 
      $(document.querySelector('body .main-content')).removeClass("hide")
      $timeout(
        ()-> 
          $(document.querySelector('body .loading')).addClass("hide")
          
        ,100
      )
    ,500
  )
]