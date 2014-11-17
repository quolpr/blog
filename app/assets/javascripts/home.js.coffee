# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
blog = angular.module('blog',[
  'templates',
  'ngRoute',
  'controllers',
  'filters'
])    


blog.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'BlogController'
      )
])


filters = angular.module('filters', [])
filters.filter('to_trusted',
  ($sce)->
    (text)->
      $sce.trustAsHtml(text)
)

controllers = angular.module('controllers',[])
controllers.controller("BlogController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.posts = posts.posts
])

blogController = ($scope) ->
  posts = {
    posts: [
      {
        id:     1,
        title: 'Blog title',
        post:  'Hello world!<br/><br/>test :)',
        path:  'blog_title',
        date:  'date',
        tags: [
          {id:1, name:'first'},
          {id:2, name:'tag'}
        ]
      },
      {
        id:     2,
        title: 'Blog tittle',
        post:  'Hello world!',
        path:  'blog_title',
        date:  'date',
        tags: [
          {id:1, name:'first', path:'first'},
          {id:2, name:'tag', path:'tag'}
        ]
      },
    ],
    count: 2
  }
  $scope.posts = posts.posts
