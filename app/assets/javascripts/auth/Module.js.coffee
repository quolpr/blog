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
            templateUrl:  'auth_login.html',
            controller: 'AuthLoginController'
          }
        }

      })
      .state('auth.logout', {
        url: "/logout"
      })
]

auth.run ['$state', 'AuthManager', 'flash', '$rootScope', ($state, authManager, flash, $rootScope)->
  $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams)->
    if toState.name == 'auth.logout'
      event.preventDefault()
      authManager.logout()
      $state.go('post_list').then ->
        flash.success = 'You was logged out'
]