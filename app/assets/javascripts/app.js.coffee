# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
            usingAjax:   true
          },
          abstract: true
        }
      )
      .state('blog.about_me', {
        url: "/about_me",
        data: {
          usingAjax: false
        }
        views: {
          'main_content@': {
            templateUrl: 'about_me.html'
          }

        }

      })
]

blog.config ['$httpProvider', ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]


blog.run ['$rootScope', '$timeout', ($rootScope, $timeout) ->
  $timeout(
    ()-> 
      $('body .loading').slideUp(1000)
      $('body .main-content').show()
    ,1000
  )
]