angular.module('blogModule').filter('to_trusted',[ '$sce',
  ($sce)->
    (text)->
      $sce.trustAsHtml(text)
  ]
)

