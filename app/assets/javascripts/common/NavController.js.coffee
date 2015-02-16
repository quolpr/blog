angular.module('blog.common')
.controller('NavController',
  ["$scope", "$state"
    ($scope, $state)->
      $scope.isCollapsed = true
      $scope.isActive =  (viewLocation) ->
        $state.current.name.indexOf(viewLocation) != -1
  ]
)