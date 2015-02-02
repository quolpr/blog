blogProgress = angular.module('blog.progress')

blogProgress.service 'ProgressManager', ['$injector', 
  class ProgressManager
    constructor: (@$injector)->

    start: ->
      @ngProgress().start() unless @progressLoading() 

    complete: ->
      @ngProgress().complete() if @progressLoading()

    ngProgress: ->
      @$injector.get('ngProgress') #avoid circular dependency error

    progressLoading: ->
      @ngProgress().status != 0 #avoid fast click
]