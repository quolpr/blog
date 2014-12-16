angular.module('blog.auth')
.factory('AuthManager', ['$http',($http) ->
  BlogPost = (blogPostData)->
    #some methods

  BlogPost.prototype = {
    login: (username, password) ->
      $http.post("/auth", {username:username, password:password})
    logout: () ->
      $http.delete("/auth")
  }
  new BlogPost
])