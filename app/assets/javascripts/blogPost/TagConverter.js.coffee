angular.module('blog.blogPost')
.factory('TagConverter', ()->
  {
    convert: (tags)->
      i = -1
      converted = {}
      angular.forEach tags.split(','), (el)->
        i++
        converted[i] = {name: el, tag_id: i}
      converted
  }
)