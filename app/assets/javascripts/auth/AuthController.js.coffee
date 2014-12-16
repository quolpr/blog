auth = angular.module('blog.auth')

auth.controller('AuthController', ['AuthManager', '$scope', (authManager, $scope)->
  $scope.isAuthed = authManager.isAuthed()

  $scope.$on('auth.changed', (event, data)->
    console.log data
    $scope.isAuthed = data['isAuthed']
  )
])