angular.module('blogModule').controller('NavController',
  ["$scope", "$location",
    ($scope, $location)->
      $scope.isActive =  (viewLocation) ->
        viewLocation == $location.path()
  ]
)