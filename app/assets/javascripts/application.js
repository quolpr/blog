// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require angular/angular
//= require angular-rails-templates
//= require angular-ui-router/release/angular-ui-router
//= require ngprogress/build/ngProgress
//= require angular-sanitize/angular-sanitize
//= require showdown/src/showdown
//= require angular-markdown-directive/markdown
//= require angular-bootstrap/ui-bootstrap
//= require angular-bootstrap/ui-bootstrap-tpls
//= require angular-cookies/angular-cookies
//= require angular-flash/dist/angular-flash
//= require ngSmoothScroll/angular-smooth-scroll

//= require blogPost/Module
//= require auth/Module
//= require common/Module
//= require progress/Module

//= require_tree .
angular.element() === jQuery() === $()