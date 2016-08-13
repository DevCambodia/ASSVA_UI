var app = angular.module('asva', []);
app.controller('mainCtrl', function($scope, $http) {

	$scope.user = {
		"EMAIL" : '',
		"PASSWORD" : ''
	};

	// var login_url = '/ASSVAUI/login';
	var login_url = $('#base').val() + '/loginaction';
	// alert(login_url);

	$scope.login = function() {
		swal({
			title : "Logging In...",
			// text : "Please wait",
			imageUrl : "/resources/images/spinner.gif",
			showCancelButton : false,
			showConfirmButton : false,
			closeOnConfirm : false,
			showLoaderOnConfirm : false,
		}, function() {

		});

		$http({
			url : login_url,
			method : 'POST',
			data : $scope.user
		}).then(function(response) {
			// console.log(response);
			if (response.data.CODE == '9000')
				location.href = response.data.REDIRECT_URL;
			else
				sweetAlert("Fail", response.data.MESSAGE, "error");
		}, function(error) {
			// console.log(error);
		});
	};
});