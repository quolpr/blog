angular.module('blogModule').filter('to_trusted',
  ($sce)->
    (text)->
      $sce.trustAsHtml(text)
)

