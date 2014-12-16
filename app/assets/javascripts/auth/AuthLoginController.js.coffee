auth = angular.module('blog.auth')

auth.controller('AuthLoginController', ['$scope', 'AuthManager',($scope, authManager)->
  $scope.user = {
    username: '',
    password: ''
  }

  actions = $scope.actions = {}
  actions.submit = ->
    authManager.login $scope.user.username, $scope.user.password
])