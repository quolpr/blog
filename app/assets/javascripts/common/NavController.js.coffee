angular.module('blog.common')
.controller('NavController',
  ["$scope", "$location",
    ($scope, $location)->
      $scope.isActive =  (viewLocation) ->
        viewLocation == $location.path()
  ]
)