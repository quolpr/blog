blog = angular.module('blog.common')

blog.directive 'confirm', ['$timeout', ($timeout)->
  {
    restrict: "A"
    link: (scope, element, attrs) ->
      element.on "click", =>
        console.log scope
        setTimeout("scope."+attrs.confirm, 1)
  }
]

