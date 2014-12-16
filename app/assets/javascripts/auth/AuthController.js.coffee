auth = angular.module('blog.auth')

auth.controller('AuthController', ['AuthManager', '$scope', (authManager, $scope)->
  $scope.isAuthed = authManager.isAuthed
])