angular.module('caac.shared.navbar.directive', [
  'caac.shared.jquery.service'
]).directive('navbar', ['$rootScope', '$location', 'jQueryService', function($rootScope, $location, jQueryService) {
  return {
    restrict: 'E',
    templateUrl: 'shared/navbar/NavbarView.html',
    link: function(scope, elem) {
      scope.setActivePage = function() {

      };
 
      //allows for <navbar search="false"></navbar>
      var setSearchBarVisibility = function() {
        var attr = jQueryService(elem[0]).attr('search');
        if (attr && attr.bool() === false) {
          jQueryService('.search').hide();
        }
      };

      scope.textSearch = function(term) {
        if ($location.path().indexOf('explore') === -1 && term) {
          $location.path('explore/' + term);
          return;
        }

        $rootScope.$broadcast('explore-search', term || '');
      };

      var init = function() {
        setSearchBarVisibility();
      };

      init();
    }
  };
}]);