var app = angular.module('asva', []);
app.controller('mainCtrl', function($scope, $http) {
	$scope.userName = "";
	$scope.email = "";
	$scope.password = "";
	$scope.confirmPassword = "";

	$scope.signup = function() {
		var name = $scope.userName.split(" ");
		var firstName = "";
		var lastName = "";
		if (name.length > 1) {
			firstName = name[0];
			lastName = name[1];
		} else {
			firstName = name[0];
		}
		var user = {
			"FIRST_NAME" : firstName,
			"LAST_NAME" : lastName,
			"GENDER" : '',
			"ID" : 0,
			"EMAIL" : $scope.email,
			"PASSWORD" : $scope.password,
			"STATUS" : 1,
			"PHOTO" : "",
			"ROLE" : {
				"ID" : "4000",
				"NAME" : ""
			},
			"TELEPHONE" : ""
		};

		$http({
			url : BAES_URL + '/api/user',
			method : 'POST',
			data : user
		}).then(function(response) {
			if (response.data.CODE == "1000") {
				swal({
					title : "Congratulation",
					text : "You have signed up successfully!",
					timer : 2000,
					closeOnConfirm : false,
					showLoaderOnConfirm : true,
				}, function() {
					setTimeout(function() {
						location.href = "/login";
					}, 2000);
				});
			}
		});
	}

});