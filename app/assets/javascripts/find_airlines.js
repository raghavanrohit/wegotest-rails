var wegoApp = angular.module('wegotest', ['ngRoute', 'ngResource']);

wegoApp.factory('FindAirlines', ['$resource', function ($resource) {
        return $resource('/find_airlines',
                {},
                {get: {method: 'GET'}}
        )
    }]);

wegoApp.controller('FindAirlinesCtrl', ['FindAirlines', '$scope', function (FindAirlines, $scope) {

        $scope.findAirlines = function () {
            var airlineOperators = FindAirlines.get({from: $scope.from, to: $scope.to});

            airlineOperators.$promise.then(function (data) {
                $scope.airlineOperators = data.airlines;
            }, function (data) {
            });
        }
    }]); 