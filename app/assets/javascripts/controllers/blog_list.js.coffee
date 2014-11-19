angular.module('blogModule').controller('BlogListController',
  ["$scope",
    ($scope) ->
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
      $scope.posts = posts
      console.log("oj!")
])