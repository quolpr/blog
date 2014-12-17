auth = angular.module('blog.auth', [
  'templates',
  'ngProgress',
  'ui.bootstrap',
  'ngCookies'
])

auth.config [ '$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider)->
    $stateProvider
      .state('blog.auth', {
        url: '/auth'

      })
      .state('blog.auth.login', {
        url: "/login",

        views: {
          'main_content@': {
            templateUrl:  'auth_login.html',
            controller: 'AuthLoginController'
          }
        }
        
        data: {
          usingAjax: false
        }
      })
      .state('blog.auth.logout', {
        url: "/logout"
      })
]

auth.run ['$state', 'AuthManager', 'flash', '$rootScope', ($state, authManager, flash, $rootScope)->
  $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams)->
    if toState.name == 'blog.auth.logout'
      event.preventDefault()
      authManager.logout()
      $state.go('blog.post.list').then ->
        flash.success = 'You was logged out'
]