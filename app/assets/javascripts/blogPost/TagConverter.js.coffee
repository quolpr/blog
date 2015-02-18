angular.module('blog.blogPost')
.factory('TagConverter', ()->
  {
    convert: (tags)->
      tags = tags.split(',')
      tags.map (el)-> {name: el.trim()}
  }
)