blog = angular.module('blog.common')

blog.directive 'loading', ['$timeout', ($timeout)->
  ($scope,element,attrs)->
    $timeout ->
      $(document.querySelector(attrs.loading)).removeClass("hide")
      $timeout(->
        element.addClass("load-hide")
      , 300)
]

