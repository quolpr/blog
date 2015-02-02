angular.module('blog.auth')
.service('AuthManager', ['$http', '$cookieStore', '$q','$rootScope', 
  class AuthManager
    constructor: (@$http, @$cookieStore, @$q, @$rootScope)->
      if @$cookieStore.get('isAuthed') == undefined
        @setIsAuthed(false)

    setIsAuthed: (flag) ->
      @$cookieStore.put('isAuthed', flag)

    isAuthed: () ->
      @$cookieStore.get('isAuthed') 

    login: (username, password) ->
      @$q (resolve, reject, notify)=>
        @$http.post("/auth", {username:username, password:password}).then(
          (data)=>
            @setIsAuthed(true)
            @$rootScope.$broadcast('auth.changed', {isAuthed: true})
            resolve(data)
          (data)->
            reject(data)
          (data)->
            notify(data)
        )
        
    logout: () ->
      @setIsAuthed(false)
      @$rootScope.$broadcast('auth.changed', {isAuthed: false})
      @$http.delete("/auth")
])