auth = angular.module('blog.auth')

auth.controller('AuthLoginController', ['$scope', 'AuthManager', '$state', 'flash', ($scope, authManager, $state, flash)->
  $scope.user = {
    username: '',
    password: ''
  }

  actions = $scope.actions = {}
  actions.submit = ->
    authManager.login($scope.user.username, $scope.user.password).then(
      () ->
        $state.go('blog.post.list').then ()->
          flash.success = 'You was authed'
      ,
      () ->
    )
])