angular.module('blog.auth')
.factory('AuthManager', ['$http', '$cookieStore', '$q', ($http, $cookieStore, $q) ->

  class AuthManager
    constructor: ()->
      if $cookieStore.get('isAuthed') == undefined
        this.setIsAuthed(false)

    setIsAuthed: (flag) ->
      $cookieStore.put('isAuthed', flag)

    isAuthed: () ->
      $cookieStore.get('isAuthed') 

    login: (username, password) ->
      $q (resolve, reject, notify)=>
        $http.post("/auth", {username:username, password:password}).then(
          (data)=>
            this.setIsAuthed(true)
            resolve(data)
          (data)->
            reject(data)
          (data)->
            notify(data)
        )
        
    logout: () ->
      this.setIsAuthed(false)
      $http.delete("/auth")

  new AuthManager()
])