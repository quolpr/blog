blogProgress = angular.module('blog.progress', ['ngProgress'])
blogProgress.config ['$httpProvider', ($httpProvider)->
  $httpProvider.interceptors.push 'ProgressInterceptor'
]
blogProgress.run ['ProgressManager', '$rootScope', (progressManager, $rootScope)->
  complete = (data)->
    progressManager.complete() if data.useProgress
  start = (data) ->
    progressManager.start() if data.useProgress

  $rootScope.$on('$stateChangeSuccess', (event, toState, toParams, fromState, fromParams)->
    complete(toState.data) unless toState.data.dataPreload
  ) 
  $rootScope.$on('$stateChangeError', (event, toState, toParams, fromState, fromParams)->
    complete(toState.data) unless toState.data.dataPreload
  )
  $rootScope.$on('$stateChangeStart', (event, toState, toParams, fromState, fromParams)->
    firstPageLoad = fromState.name == ""
    start(toState.data) unless firstPageLoad
  )
]