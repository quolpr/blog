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
      deferred = @$q.defer()

      @$http.post("/auth", {username:username, password:password}).then(
        (data)=>
          @setIsAuthed(true)
          @$rootScope.$broadcast('auth.changed', {isAuthed: true})
          deferred.resolve(data)
        (data)->
          deferred.reject(data)
        (data)->
          deferred.notify(data)
      )
      deferred.promise

    logout: () ->
      @setIsAuthed(false)
      @$rootScope.$broadcast('auth.changed', {isAuthed: false})
      @$http.delete("/auth")
])