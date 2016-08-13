app.controller('userCtrl', function($scope, $http) {
	$scope.user = null;
	$scope.loadUser = function() {
		$http.get(BAES_URL + '/api/user/' + USER_SESSION.ID).then(function(response) {
			console.log(response);
			$scope.user = response.data.DATA;
		});
	}

	$scope.updateUser = function() {
		$http({
			url : BAES_URL + '/api/user',
			method : 'PUT',
			data : {
				"EMAIL" : $scope.user.EMAIL,
				"FIRST_NAME" : $('#firstName').val(),
				"GENDER" : $('#gender').val(),
				"ID" : $scope.user.ID,
				"LAST_NAME" : $('#lastName').val(),
				"PASSWORD" : $scope.user.PASSWORD,
				"PHOTO" : $scope.user.PHOTO,
				"STATUS" : $scope.user.STATUS,
				"TELEPHONE" : $('#phone').val()
			}
		}).then(
				function(response) {
					console.log(response);
					if (response.data.CODE == '3000') {
						swal("Updated!",
								"You profile information has been updated.",
								"success");
						location.reload();
						//$('#btnUserClose').click();
					}
				});
	}

	$scope.loadUser();

});