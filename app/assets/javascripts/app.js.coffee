# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

blog = angular.module('blog', [
  'blog.blogPost',
  'ui.router',
  'templates',
  'blog.common'
])    


blog.config([ '$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider)->
    $urlRouterProvider.otherwise("/");
    $stateProvider
      .state('about_me', {
        url: "/about_me",
        views: {
          'main_content': {
            templateUrl: 'about_me.html'
          }
        }
      })
])
was_animated = false
blog.run(['$rootScope', '$urlRouter', '$location', '$state', ($rootScope, $urlRouter, $location, $state)->
  $rootScope.$on('$stateChangeStart',
    (event, toState, toParams, fromState, fromParams) =>
      firstVisit = fromState.name.length == 0
      sideBarShown = toState.views.sidebar == undefined and fromState.views.sidebar
      return if was_animated || firstVisit || sideBarShown
      event.preventDefault()

      $('div[ui-view="sidebar"] > div').hide('slow')
      $('div[ui-view="main_content"] > div').animate({
        width: $('.container').width()
      }, 1000, =>
        was_animated = true
        $state.go(toState, toParams)
        was_animated = false
      )
      #$('div[ui-view="sidebar"] > div').animate({width:'toggle'},350);

  )
])