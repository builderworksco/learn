angular.module('caac', [
  'caac.explore.controller',
  'caac.home.controller',
  'caac.opportunity-instances.controller',
  'ngRoute',
  'angular.filter'
]).config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/explore', {
    controller: 'ExploreController',
    templateUrl: 'explore/ExploreView.html'
  }).when('/explore/:term', {
    controller: 'ExploreController',
    templateUrl: 'explore/ExploreView.html'
  }).when('/opportunity-instances/:uid', {
    controller: 'OpportunityInstancesController',
    templateUrl: 'opportunity-instances/OpportunityInstancesView.html'
  }).when('/', {
    controller: 'HomeController',
    templateUrl: 'home/HomeView.html'
  });
}]).run(['$log',
  function($log) {
    $log.getInstance = function(context) {
      return {
        info: enhanceLogging('INFO', $log.info, context),
        warn: enhanceLogging('WARN', $log.warn, context),
        debug: enhanceLogging('DEBUG', $log.debug, context),
        error: enhanceLogging('ERROR', $log.error, context)
      };
    };

    function enhanceLogging(type, loggingFunc, context) {
      return function() {
        if (['localhost', '127.0.0.1'].indexOf(window.document.location.hostname) !== -1) {
          var modifiedArguments = [].slice.call(arguments);
          modifiedArguments[0] = ['[' + type + '] ' + moment().format('YYYY-MM-DD HH:mm:ss') + ' - ' + context + ' - '] + modifiedArguments[0];
          loggingFunc.apply(null, modifiedArguments);
        }

        //otherwise, we're on production (don't show any logs)
      };
    }
  }
]);
