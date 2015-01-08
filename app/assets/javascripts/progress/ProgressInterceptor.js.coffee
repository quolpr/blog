blogProgress = angular.module('blog.progress')

blogProgress.factory 'ProgressInterceptor', ['$q', 'ProgressManager', ($q, progressManager)->
  htmlLoading = (response)->
    response.config.url.indexOf('html') == -1
  {
    response: (response) => 
      progressManager.complete() if htmlLoading(response)
      response  
    responseError: (rejection) =>
      progressManager.complete()
      $q.reject(rejection)
  }
]
