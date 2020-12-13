<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.1/angular.min.js"></script>
  <script>
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
  // email = $scope.email;
  // psw = $scope.psw;
  $http({
    method: "GET",
    url: "/JSONAJAXProject/WebContent/fetch2.jsp"
    
  }).then(function mySuccess(response) {
      // a string, or an object, carrying the response from the server.
      $scope.myRes = response.data.myArrayList;
      $scope.statuscode = response.status;
    }, function myError(response) {
      $scope.myRes = response.myArrayList;
  });
});
</script>
</head>
<body>
<div ng-app="myApp">
        <div ng-controller="myCtrl">
           {{statuscode}}
            <div ng-repeat="x in myRes">
                <h3>{{x.map.FIRST_NAME+ "    " +x.map.LAST_NAME+ "    "+x.map.SALARY}}</h3>
               
            </div>
             
            </div>
</div>
</body>
</html>