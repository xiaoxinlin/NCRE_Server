'use strict';


// Declare app level module which depends on filters, and services
angular.module('myApp', []).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/index/', {templateUrl: 'partials/index.html', controller: MyCtrl2});
    $routeProvider.when('/announcements/:annoPageId', {templateUrl: 'partials/announcement.html', controller: MyCtrl2});
    $routeProvider.when('/announcement/:annoId', {templateUrl: 'partials/announcement-details.html', controller: MyCtrl2});
    $routeProvider.when('/questions/:quesPageId', {templateUrl: 'partials/question.html', controller: MyCtrl2});
    $routeProvider.when('/question/:quesId', {templateUrl: 'partials/question-details.html', controller: MyCtrl2});
    $routeProvider.when('/downloads/:downPageId', {templateUrl: 'partials/download.html', controller: DownloadsCtrl});
    $routeProvider.when('/downloads/doc/:downPageId', {templateUrl: 'partials/download.html', controller: DownloadsDocCtrl});
    $routeProvider.when('/downloads/software/:downPageId', {templateUrl: 'partials/download.html', controller: DownloadsSoftwareCtrl});
    $routeProvider.when('/test/:testType', {templateUrl: 'partials/test.html', controller: MyCtrl2});
    $routeProvider.when('/exam/:examType', {templateUrl: 'partials/exam.html', controller: MyCtrl2});
    $routeProvider.otherwise({redirectTo: '/index/'});
  }]);
