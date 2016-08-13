var app = angular.module('asva', []);
app.controller('mainCtrl', function($scope, $http) {

	$scope.status = [ {
		name : 'Active',
		value : 1
	}, {
		name : 'Inactive',
		value : 0
	} ];
	$scope.type = [ {
		name : 'Main Category',
		value : true
	}, {
		name : 'Sub Category',
		value : false
	} ];

	$scope.cat = [];

	$scope.mainCat = 0;
	$scope.state = 1;
	$scope.subState = 1;
	$scope.isEdit = false;
	$scope.editObject = null;
	$scope.isEditMain = true;

	/*
	 * LOAD CATEGORY
	 */
	$scope.loadCat = function() {
		$http.get(BAES_URL + '/api/category').then(function(response) {
			$scope.cat = response.data.DATA;
		});
	}

	$scope.operation = function() {
		if ($scope.isEdit == true)
			$scope.update();
		else
			$scope.insert();
	}

	/*
	 * INSERT NEW CATEGORY
	 */
	$scope.insert = function() {
		if ($scope.mainCatModel == null)
			$scope.mainCatModel = null;

		var data = {
			"CATEGORY_IMAGE" : "url",
			"CATEGORY_NAME" : $scope.catNameModel,
			"CATEGORY_STATUS" : 1,
			"MAIN_CATEGORY_ID" : $scope.mainCatModel
		};

		// operation for insert
		$http.post(BAES_URL + '/api/category', data).then(function(response) {
			if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
				swal("Added!", "The category has been inserted.", "success");
				$scope.clearForm();
				//$('#btnCancel').click();
				location.reload();
			}
		});
	}

	$scope.update = function() {
		if ($scope.mainCatModel == null)
			$scope.mainCatModel = null;

		$http({
			url : BAES_URL + '/api/category',
			method : 'PUT',
			data : {
				"ID" : $scope.editObject.ID,
				"CATEGORY_IMAGE" : $scope.editObject.CATEGORY_IMAGE,
				"CATEGORY_NAME" : $scope.catNameModel,
				"CATEGORY_STATUS" : $scope.editObject.CATEGORY_STATUS,
				"MAIN_CATEGORY_ID" : $scope.mainCatModel
			}
		}).then(function(response) {
			if (response.data.MESSAGE == "TRANSACTION_SUCCESS") {
				swal("Updated!", "The category has been updated.", "success");
				$scope.clearForm();
				//$('#btnCancel').click();
				location.reload();
			}
		});
	}

	/*
	 * Delete Category
	 */
	$scope.deleteCat = function(id) {
		swal({
			title : "Are you sure?",
			text : "You will not be able to recover this imaginary file!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "Yes, delete it!",
			closeOnConfirm : false
		},function() {
			$http({
				url : BAES_URL + '/api/category/' + id,
				method : 'DELETE'
			}).then(function(response) {
				if (response.data.MESSAGE == "TRANSACTION_SUCCESS") {
					swal("Deleted!", "Your imaginary file has been deleted.", "success");
					$scope.loadCat();
					// location.reload();
				}
			});
		});
		
	}

	/*
	 * CHANGE CATEGORY STATUS
	 */
	$scope.changeStatus = function(obj) {
		var msg = "";
		var status = "";
		var s = null;
		if (obj.CATEGORY_STATUS == '1'){
			s = 0;
			msg = "Want to disable " + obj.CATEGORY_NAME + ' ?';
			status = "disabled";
		}else{
			s = 1;
			msg = "Want to enable " + obj.CATEGORY_NAME + ' ?';
			status = "enabled";
		}
			
		var main = null;
		if (obj.MAIN_CATEGORY != null)
			main = obj.MAIN_CATEGORY.ID;
		
		// confirm
		swal({
			title : "Are you sure?",
			text : msg,
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "Yes, change it!",
			closeOnConfirm : false
		},function() {
			$http({
				url : BAES_URL + '/api/category',
				method : 'PUT',
				data : {
					"CATEGORY_IMAGE" : obj.CATEGORY_IMAGE,
					"CATEGORY_NAME" : obj.CATEGORY_NAME,
					"CATEGORY_STATUS" : s,
					"ID" : obj.ID,
					"MAIN_CATEGORY_ID" : main
				}
			}).then(function(response) {
				if (response.data.MESSAGE == "TRANSACTION_SUCCESS") {
					swal("Success!", "The category has been " + status, "success");
					$scope.loadCat();
				}
			});
		});
	}

	$scope.edit = function(obj) {
		$scope.isEdit = true;
		$scope.catNameModel = obj.CATEGORY_NAME;
		$scope.editObject = obj;
		// set edit type
		if (obj.MAIN_CATEGORY == null) {
			$scope.isEditMain = true;
			$scope.mainCatModel = null;
		} else {
			$scope.isEditMain = false;
			$scope.mainCatModel = obj.MAIN_CATEGORY.ID;
		}

	}

	$scope.clearForm = function() {
		$scope.catNameModel = "";
		$scope.reset();
		$scope.loadCat();
	}

	$scope.reset = function() {
		$scope.mainCat = 0;
		$scope.state = 1;
		$scope.subState = 1;
		$scope.isEdit = false;
		$scope.editObject = null;
		$scope.isEditMain = true;
	}

	$scope.loadCat();

});