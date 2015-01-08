blogProgress = angular.module('blog.progress')

blogProgress.factory 'ProgressManager', ['$injector', ($injector)->
  ngProgress = ->
    $injector.get('ngProgress') #avoid circular dependency error
  progressLoading = ->
    ngProgress.status != 0 #avoid fast click
  {
    start: ->
      ngProgress().start() unless progressLoading() 
    complete: ->
      ngProgress().complete() if progressLoading()
  }
]