auth = angular.module('blog.auth', [
  'templates',
  'ngProgress',
  'ui.bootstrap',
  'ngCookies'
])

auth.config [ '$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider)->
    $stateProvider
      .state('auth', {
        url: '/auth',
        views: {
          'sidebar': {
            templateUrl: 'sidebar.html'
          }
        }
      })
      .state('auth.login', {
        url: "/login",
        views: {
          'main_content@': {
            templateUrl:  'auth_login.html'
          }
        }

      })
]

