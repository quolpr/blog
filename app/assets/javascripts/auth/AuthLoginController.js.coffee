auth = angular.module('blog.auth')

auth.controller('AuthLoginController', ['$scope', 'AuthManager', '$state', 'flash', ($scope, authManager, $state, flash)->
  $scope.user = {
    username: '',
    password: ''
  }
  addError = ()->
    
  actions = $scope.actions = {}
  actions.submit = (form)-> 
    return if form.$invalid
    authManager.login($scope.user.username, $scope.user.password).then(
      () ->
        $state.go('blog.post.list').then ()->
          flash.success = 'You was authed'
      ,
      () ->
        form.password.$invalid = true
        form.username.$invalid = true
    )
  

])