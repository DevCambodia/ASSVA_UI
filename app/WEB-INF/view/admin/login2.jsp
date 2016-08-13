<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ASVA LOGIN</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<style>
	*{
		margin:0px auto;
		padding:0px;
		
	}
	.login-form{
		margin-top:200px;
		background-color:gray;
		width: 400px;
	}
</style>

</head>
<body ng-app="loginApp" ng-controller="loginCtrl">

	<div class="login-form">
		<center>
			<form ng-submit="login()" method="POST">
				<label>Email:</label><input type="email" name="EMAIL" ng-model="user.EMAIL"/><br>
				<label>Password:</label><input type="password" name="PASSWORD" ng-model="user.PASSWORD"/><br>
				<input type="submit" value="login">
			</form>
		</center>
	</div>
	<script>
		var app = angular.module('loginApp', []);
		
		app.controller('loginCtrl', function($scope, $http){
			$scope.user = {
					"EMAIL": '',
					"PASSWORD": ''
			};
			$scope.login = function(){
				$http({
					url:'http://localhost:8888/login',
					method: 'POST',
					data: $scope.user
				}).then(function(response){
					console.log(response);
					if(response.data.CODE=='9000')
						location.href="/admin/dashboard";
					else
						location.href="";
				}, function(error){
					console.log(error);
				});
			};

		});
	</script>
</body>
</html>