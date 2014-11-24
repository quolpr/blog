describe "BlogListController", ->
  scope        = null
  ctrl         = null
  blogPost     = null
  ngProgress   = null

  setupController = (keywords,results)->
    inject((BlogPost, $rootScope, $controller, ngProgress)->
      scope       = $rootScope.$new()
      routeParams.keywords = keywords
      blogPost = BlogPost

      # capture the injected service
      httpBackend = $httpBackend 

      ctrl = $controller('BlogListController',
                         $scope:     scope
                         BlogPost:   blogPost
                         ngProgress: ngProgress
                         )
    )
