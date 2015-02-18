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
          dataPreload:false
        }
      })
      .state('blog.auth.logout', {
        url: "/logout"
        onEnter: ['AuthManager', 'flash', '$rootScope', '$state', (authManager, flash, $rootScope, $state)->
          authManager.logout()
          $state.go('blog.post.list').then ->
            flash.success = 'You was logged out'
        ]
      })
]
