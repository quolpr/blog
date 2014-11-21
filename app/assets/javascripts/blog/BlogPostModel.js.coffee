angular.module('blogModule').factory('BlogPost', ['$resource',($resource) ->
  $resource('/blog_posts/:id', { id: "@id", format: 'json' })
])