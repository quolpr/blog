# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

blog = angular.module('blog', [
  'blog.blogPost',
  'blog.auth',
  'ui.router',
  'templates',
  'blog.common',
  'ngProgress',
  'angular-flash.service', 
  'angular-flash.flash-alert-directive'
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
blog.value 'progressStatus', {isLoading: false}

blog.config ['$httpProvider', ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

  $httpProvider.interceptors.push 'ProgressInterceptor'
]

blog.factory 'ProgressInterceptor', ['$injector', '$q', 'progressStatus', ($injector, $q, progressStatus)->
  {
    response: (response) => 
      console.log progressStatus.isLoading
      if response.config.url.indexOf('html') == -1 && progressStatus.isLoading
        progressStatus.isLoading = false
        $injector.get('ngProgress').complete()
      response  
    responseError: (rejection) =>
      if progressStatus.isLoading
        progressStatus.isLoading = false
        $injector.get('ngProgress').complete()
      $q.reject(rejection)
  }
]

blog.run ['$rootScope', 'ngProgress', 'progressStatus', ($rootScope, ngProgress, progressStatus) ->
  $('body .loading').hide()
  $('body .main-content').show()
  complete = (data)->
    if data.useProgress
      progressStatus.isLoading = false
      ngProgress.complete()
  start = (data) ->
    if data.useProgress
      progressStatus.isLoading = true
      ngProgress.start()

  $rootScope.$on('$stateChangeSuccess', (event, toState, toParams, fromState, fromParams)->
    complete(toState.data) unless toState.data.usingAjax
  ) 
  $rootScope.$on('$stateChangeError', (event, toState, toParams, fromState, fromParams)->
    complete(toState.data) unless toState.data.usingAjax
  )
  $rootScope.$on('$stateChangeStart', (event, toState, toParams, fromState, fromParams)->
    start(toState.data)
  )

  
]