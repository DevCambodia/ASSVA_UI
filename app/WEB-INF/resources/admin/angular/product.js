var app = angular.module('asva', []);
app.controller('mainCtrl', function($scope, $http) {

//	$scope.catFilter = 0;
//	$scope.subFilter = 0;
//	// show all product
//	$scope.all = true;
//	$scope.isEdit = false;
//	$scope.proImage = "";
//	$scope.editObject = null;
//
//	// pagination
//	$scope.page = 1;
//	$scope.limit = 10;
//	$scope.totalCount = 0;
//	$scope.totalPage = 1;
//	$scope.totalItems = [];
//	$scope.itemName = "";
//
//	$scope.setTotalItems = function(x) {
//		$scope.totalItems[x - 1] = '';
//	}
//
//	$scope.loadCat = function() {
//		$http.get(BAES_URL + '/api/category').then(function(response) {
//			$scope.cats = response.data.DATA;
//		});
//	}
	
	$scope.catFilter = 0;
	$scope.subFilter = 0;
	// show all product
	$scope.all = true;
	$scope.isEdit = false;
	$scope.proImage = "";
	$scope.editObject = null;

	// pagination
	$scope.page = 1;
	$scope.limit = 10;
	$scope.totalCount = 0;
	$scope.totalPage = 1;
	$scope.totalItems = [];
	$scope.itemName = "";

	$scope.ID = null;

	$scope.IMAGE = [ {
		'URL' : '',
		'PATH' : '/resources/images/thumbnail-default.jpg'
	}, {
		'URL' : '',
		'PATH' : '/resources/images/thumbnail-default.jpg'
	}, {
		'URL' : '',
		'PATH' : '/resources/images/thumbnail-default.jpg'
	}, {
		'URL' : '',
		'PATH' : '/resources/images/thumbnail-default.jpg'
	}, {
		'URL' : '',
		'PATH' : '/resources/images/thumbnail-default.jpg'
	} ];

	// reset image
	$scope.reset = function(){
		
		var contextPath = $('#context-path').val();
		
		$scope.IMAGE = [ {
			'URL' : '',
			'PATH' : '/resources/images/thumbnail-default.jpg'
		}, {
			'URL' : '',
			'PATH' : '/resources/images/thumbnail-default.jpg'
		}, {
			'URL' : '',
			'PATH' : '/resources/images/thumbnail-default.jpg'
		}, {
			'URL' : '',
			'PATH' : '/resources/images/thumbnail-default.jpg'
		}, {
			'URL' : '',
			'PATH' : '/resources/images/thumbnail-default.jpg'
		} ];
		
		// reset display image
		for (var i = 0; i < $scope.IMAGE.length; i++) {
			$('#proImg' + i).attr('src', contextPath + $scope.IMAGE[i].PATH);
		}
		
		// reset value
		//$('#catModel')[1].attr('selected', 'selected');
		$('#catModel option')[0].selected = true;
		$scope.proNameModel = '';
		$scope.proPriceModel = '';
		$scope.proTelModel = '';
		CKEDITOR.instances['proDescModel'].setData('');
		$scope.isEdit = false;
		$scope.editObject = null;
		
	}
	
	$('#myModal').on('hidden.bs.modal', function () {
		 $scope.reset();
	})
	
	$scope.splitRec = function(s, i){
		return s.split('!@#$%')[i];
	}
	
	$scope.setTotalItems = function(x) {
		$scope.totalItems[x - 1] = '';
	}

	$scope.loadCat = function() {
		$http.get(BAES_URL + '/api/category').then(function(response) {
			$scope.cats = response.data.DATA;
		});
	}

	$scope.loadItem = function() {
		$http.get(
				BAES_URL + '/api/item/paging/noCatId?page='+$scope.page+'&limit=' + $scope.limit + '&itemName=' + $scope.itemName).then(function(res) {
			$scope.items = res.data.DATA;
			$scope.page = res.data.PAGING.PAGE;
			$scope.limit = res.data.PAGING.LIMIT;
			$scope.totalCount = res.data.PAGING.TOTAL_COUNT;
			$scope.totalPage = res.data.PAGING.TOTAL_PAGES;
			// set item
			$scope.setTotalItems($scope.totalCount);
		});
	}

//	// go to page
//	$scope.goToPage = function(p) {
//		$scope.page = p;
//		$scope.loadItem();
//	}
//
//	$scope.limitClick = function(l) {
//		$scope.page = 1;
//		$scope.limit = l;
//		$scope.loadItem();
//	}
//
//	// search
//	$scope.searchItem = function(s) {
//		$scope.itemName = s;
//		$scope.page = 1;
//		$scope.loadItem();
//	}
//
//	// sub string
//	$scope.subDesc = function(s) {
//		if (s.length > 40) {
//			return s.substring(0, 40) + '...';
//		} else {
//			return s;
//		}
//	}	
//
//	// main change
//	$scope.mainChange = function(v) {
//		$scope.showSub = true;
//		if (v === '')
//			$scope.all = true;
//		else
//			$scope.all = false;
//	}
//
//	/*
//	 * Change
//	 */
//	$scope.changeState = function(obj) {
//		var msg = "";
//		if (obj.ITEM_STATUS == 0) {
//			obj.ITEM_STATUS = 1;
//			msg = "This product has chnaged to show.";
//		} else {
//			obj.ITEM_STATUS = 0;
//			msg = "This product has chnaged to hide.";
//		}
//
//		$http({
//			url : BAES_URL + '/api/item',
//			method : 'PUT',
//			data : {
//				"ID" : obj.ID,
//				"ITEM_CATEGORY_ID" : obj.ITEM_CATEGORY.ID,
//				"ITEM_DESCRIPTION" : obj.ITEM_DESCRIPTION,
//				"ITEM_IMAGE" : obj.ITEM_IMAGE,
//				"ITEM_IS_SOLD" : obj.ITEM_IS_SOLD,
//				"ITEM_NAME" : obj.ITEM_NAME,
//				"ITEM_PRICE" : obj.ITEM_PRICE,
//				"ITEM_PUBLISH_DATE" : obj.ITEM_PUBLISH_DATE,
//				"ITEM_STATUS" : obj.ITEM_STATUS,
//				"ITEM_USER_ID" : obj.ITEM_USER.ID
//			}
//		}).then(function(response) {
//			if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
//				swal("Updated!", msg, "success");
//				$scope.loadItem();
//			}
//		});
//	}
//
//	$scope.operation = function(){
//		if($scope.isEdit){
//			$scope.update();
//		}else{
//			$scope.insert();
//		}
//			
//	}
//	
//	/*
//	 * Insert Product
//	 * 
//	 */
//	$scope.insert = function() {
//		var data = {
//			"ITEM_CATEGORY_ID" : $scope.catModel,
//			"ITEM_DESCRIPTION" : $scope.proDescModel,
//			"ITEM_IMAGE" : $scope.proImage,
//			"ITEM_IS_SOLD" : false,
//			"ITEM_NAME" : $scope.proNameModel,
//			"ITEM_PRICE" : $scope.proPriceModel,
//			"ITEM_STATUS" : 1,
//			"ITEM_USER_ID" : user_id
//		}
//
//		$http.post(BAES_URL + '/api/item', data).then(function(response) {
//			if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
//				swal("Inserted!", "You have added new product.", "success");
//				$scope.loadItem();
//				$scope.clearForm();
//				$('#btnClose').click();
//			}
//		});
//	}
//
//	/*
//	 * Edit Product
//	 */
//	$scope.edit = function(obj) {
//		$scope.isEdit = true;
//		$scope.editObject = obj;
//		$scope.catModel = obj.ITEM_CATEGORY.ID;
//		$scope.proDescModel = obj.ITEM_DESCRIPTION;
//		$scope.proImage = obj.ITEM_IMAGE;
//		$scope.proNameModel = obj.ITEM_NAME;
//		$scope.proPriceModel = obj.ITEM_PRICE;
//		$('#proImg').attr('src', obj.ITEM_IMAGE);
//	}
//
//	/*
//	 * Update Product
//	 */
//	$scope.update = function() {
//		$http({
//			url: BAES_URL + '/api/item',
//			method: 'PUT',
//			data: {
//				 "ID": $scope.editObject.ID,
//				  "ITEM_CATEGORY_ID": $scope.catModel,
//				  "ITEM_DESCRIPTION": $scope.proDescModel,
//				  "ITEM_IMAGE": $scope.proImage,
//				  "ITEM_IS_SOLD": $scope.editObject.ITEM_IS_SOLD,
//				  "ITEM_NAME": $scope.proNameModel,
//				  "ITEM_PRICE": $scope.proPriceModel,
//				  "ITEM_PUBLISH_DATE": $scope.editObject.ITEM_PUBLISH_DATE,
//				  "ITEM_STATUS": $scope.editObject.ITEM_STATUS,
//				  "ITEM_USER_ID": $scope.editObject.ITEM_USER.ID
//			}
//		}).then(function(response){
//			if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
//				swal("Updated!", "You product has been updated.", "success");
//				$scope.loadItem();
//				$scope.clearForm();
//				$('#btnClose').click();
//			}
//		});
//	}
//
//	/*
//	 * Update Product to sold.
//	 */
//	$scope.updateProSold = function(obj) {
//		var msg = "";
//		if (obj.ITEM_IS_SOLD == true) {
//			obj.ITEM_IS_SOLD = false;
//			msg = "This product has chnaged to available.";
//		} else {
//			obj.ITEM_IS_SOLD = true;
//			msg = "This product has chnaged to sold.";
//		}
//
//		$http({
//			url : BAES_URL + '/api/item/' + obj.ID + '/' + obj.ITEM_IS_SOLD,
//			method : 'PUT'
//		}).then(function(response) {
//			if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
//				swal("Updated!", msg, "success");
//				$scope.loadItem();
//			}
//		});
//	}
//
//	$scope.deletePro = function(obj) {
//
//		swal({
//			title : "Are you sure want to delete " + obj.ITEM_NAME + "?",
//			text : "You will not be able to recover this product!",
//			type : "warning",
//			showCancelButton : true,
//			confirmButtonColor : "#DD6B55",
//			confirmButtonText : "Yes, delete it!",
//			closeOnConfirm : false
//		}, function() {
//			$http({
//				url : BAES_URL + '/api/item/' + obj.ID,
//				method : 'DELETE'
//			}).then(
//					function(response) {
//						if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
//							swal("Deleted!", "This product has been deleted.",
//									"success");
//							$scope.loadItem();
//						}
//					});
//		});
//	}
//
//	/*
//	 * Show product image when file change
//	 */
//	document.getElementById('proImageModel').onchange = function() {
//		var frmData = new FormData();
//		var file = $('#proImageModel')[0].files[0];
//		frmData.append("file", file);
//		// start uploading
//		$scope.upload(frmData);
//	};
//
//	// TODO: upload file, get file name
//	$scope.upload = function(frmData) {
//		$http({
//			url : BAES_URL + '/api/upload',
//			method : 'POST',
//			data : frmData,
//			transformRequest : angular.identity,
//			headers : {
//				'Content-Type' : undefined
//			}
//		}).then(
//				function(response) {
//
//					$scope.proImage = BAES_URL;
//							+ response.data.DATA.PATH;
//					// show image to img tag
//					$('#proImg').attr('src', $scope.proImage);
//				}, function(error) {
//					console.log(error);
//				});
//	};
//
//	/*
//	 * Set Image to img tag
//	 */
//	$scope.setImage = function() {
//		$('#proImg').attr('src', $scope.proImage);
//	}
//
//	$scope.clearForm = function() {
//		$scope.catFilter = 0;
//		$scope.subFilter = 0;
//		$scope.all = true;
//		$scope.catModel = "";
//		$scope.proDescModel = "";
//		$scope.proImage = "";
//		$scope.proNameModel = "";
//		$scope.proPriceModel = "";
//		$('#proImg').attr('src', '');
//		$scope.editObject = null;
//		$scope.isEdit = false;
//	}
	
	// go to page
	$scope.goToPage = function(p) {
		$scope.page = p;
		$scope.loadItem();
	}

	$scope.limitClick = function(l) {
		$scope.page = 1;
		$scope.limit = l;
		$scope.loadItem();
	}

	// search
	$scope.searchItem = function(s) {
		$scope.itemName = s;
		$scope.page = 1;
		$scope.loadItem();
	}

	// sub string
	$scope.subDesc = function(s) {
		if (s.length > 40) {
			return s.substring(0, 40) + '...';
		} else {
			return s;
		}
	}

	// main change
	$scope.mainChange = function(v) {
		$scope.showSub = true;
		if (v === '')
			$scope.all = true;
		else
			$scope.all = false;
	}

	/*
	 * Change
	 */
	$scope.changeState = function(obj) {
		var msg = "";
		if (obj.ITEM_STATUS == 0) {
			obj.ITEM_STATUS = 1;
			msg = "This product has chnaged to show.";
		} else if(obj.ITEM_STATUS == 1){
			obj.ITEM_STATUS = 0;
			msg = "This product has chnaged to hide.";
		}

		$http({
			url : BAES_URL + '/api/item',
			method : 'PUT',
			data : {
				"ID" : obj.ID,
				"ITEM_CATEGORY_ID" : obj.ITEM_CATEGORY.ID,
				"ITEM_DESCRIPTION" : obj.ITEM_DESCRIPTION,
				"ITEM_IMAGE" : obj.ITEM_IMAGE,
				"ITEM_IS_SOLD" : obj.ITEM_IS_SOLD,
				"ITEM_NAME" : obj.ITEM_NAME,
				"ITEM_PRICE" : obj.ITEM_PRICE,
				"ITEM_PUBLISH_DATE" : obj.ITEM_PUBLISH_DATE,
				"ITEM_STATUS" : obj.ITEM_STATUS,
				"ITEM_USER_ID" : obj.ITEM_USER.ID
			}
		}).then(function(response) {
			if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
				swal("Updated!", msg, "success");
				$scope.loadItem();
			}
		});
	}

	$scope.operation = function() {
		if ($scope.isEdit) {
			$scope.update();
		} else {
			$scope.insert();
		}

	}

	/*
	 * Insert Product
	 * 
	 */
	$scope.insert = function() {
		var desc = CKEDITOR.instances['proDescModel'].getData();
		var img = '';
		for (var i = 0; i < $scope.IMAGE.length; i++) {
			img += $scope.IMAGE[i].PATH + '#';
		}
		var data = {
			"ITEM_CATEGORY_ID" : $scope.catModel,
			"ITEM_DESCRIPTION" : desc,
			"ITEM_IMAGE" : img,
			"ITEM_IS_SOLD" : false,
			"ITEM_NAME" : $scope.proNameModel + '!@#$%' + $scope.proTelModel,
			"ITEM_PRICE" : $scope.proPriceModel,
			"ITEM_STATUS" : 1,
			"ITEM_USER_ID" : USER_SESSION.ID
		}

		$http.post(BAES_URL + '/api/item', data).then(function(response) {
			if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
				swal("Inserted!", "You have added new product.", "success");
				$scope.loadItem();
				$scope.clearForm();
				$('#btnClose').click();
				$scope.reset();
			}
		});
	}

	/*
	 * Edit Product
	 */
	$scope.edit = function(obj) {
		$scope.isEdit = true;
		$scope.editObject = obj;
		$scope.catModel = obj.ITEM_CATEGORY.ID;
		CKEDITOR.instances['proDescModel'].setData(obj.ITEM_DESCRIPTION);
		$scope.proNameModel = obj.ITEM_NAME.split('!@#$%')[0];
		$scope.proTelModel = obj.ITEM_NAME.split('!@#$%')[1];
		$scope.proPriceModel = obj.ITEM_PRICE;
		var img = obj.ITEM_IMAGE.split('#');
		for (var i = 0; i < img.length; i++) {
			$('#proImg' + i).attr('src', BAES_URL + img[i]);
			// set image to IMAGE object
			$scope.IMAGE[i].PATH = img[i];
		}
	}

	/*
	 * Update Product
	 */
	$scope.update = function() {
		var desc = CKEDITOR.instances['proDescModel'].getData();
		var img = '';
		for (var i = 0; i < $scope.IMAGE.length; i++) {
			img += $scope.IMAGE[i].PATH + '#';
		}
		$http({
			url : BAES_URL + '/api/item',
			method : 'PUT',
			data : {
				"ID" : $scope.editObject.ID,
				"ITEM_CATEGORY_ID" : $scope.catModel,
				"ITEM_DESCRIPTION" : desc,
				"ITEM_IMAGE" : img,
				"ITEM_IS_SOLD" : $scope.editObject.ITEM_IS_SOLD,
				"ITEM_NAME" : $scope.proNameModel + '!@#$%' + $scope.proTelModel,
				"ITEM_PRICE" : $scope.proPriceModel,
				"ITEM_PUBLISH_DATE" : $scope.editObject.ITEM_PUBLISH_DATE,
				"ITEM_STATUS" : $scope.editObject.ITEM_STATUS,
				"ITEM_USER_ID" : $scope.editObject.ITEM_USER.ID
			}
		}).then(function(response) {
			if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
				swal("Updated!", "You product has been updated.", "success");
				$scope.loadItem();
				$scope.clearForm();
				$('#btnClose').click();
				$scope.reset();
			}
		});
	}

	/*
	 * Update Product to sold.
	 */
	$scope.updateProSold = function(obj) {
		var msg = "";
		if (obj.ITEM_IS_SOLD == true) {
			obj.ITEM_IS_SOLD = false;
			msg = "This product has chnaged to available.";
		} else {
			obj.ITEM_IS_SOLD = true;
			msg = "This product has chnaged to sold.";
		}

		$http({
			url : BAES_URL + '/api/item/' + obj.ID + '/' + obj.ITEM_IS_SOLD,
			method : 'PUT'
		}).then(function(response) {
			if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
				swal("Updated!", msg, "success");
				$scope.loadItem();
			}
		});
	}

	$scope.deletePro = function(obj) {

		swal({
			title : "Are you sure want to delete " + obj.ITEM_NAME + "?",
			text : "You will not be able to recover this product!",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "Yes, delete it!",
			closeOnConfirm : false
		}, function() {
			$http({
				url : BAES_URL + '/api/item/' + obj.ID,
				method : 'DELETE'
			}).then(
					function(response) {
						if (response.data.MESSAGE == 'TRANSACTION_SUCCESS') {
							swal("Deleted!", "This product has been deleted.",
									"success");
							$scope.loadItem();
						}
					});
		});
	}

	/*
	 * Show product image when file change
	 */
	$scope.browseImage = function(id) {
		$('#proImageModel' + id).click();
		$scope.ID = id;
	}

	// input file change
	document.getElementById('proImageModel0').onchange = function() {
		var frmData = new FormData();
		var file = $('#proImageModel0')[0].files[0];
		// console.log(file);
		frmData.append("file", file);
		// start uploading
		$scope.upload(frmData, 0);
	};

	document.getElementById('proImageModel1').onchange = function() {
		var frmData = new FormData();
		var file = $('#proImageModel1')[0].files[0];
		// console.log(file);
		frmData.append("file", file);
		// start uploading
		$scope.upload(frmData, 1);
	};

	document.getElementById('proImageModel2').onchange = function() {
		var frmData = new FormData();
		var file = $('#proImageModel2')[0].files[0];
		// console.log(file);
		frmData.append("file", file);
		// start uploading
		$scope.upload(frmData, 2);
	};

	document.getElementById('proImageModel3').onchange = function() {
		var frmData = new FormData();
		var file = $('#proImageModel3')[0].files[0];
		// console.log(file);
		frmData.append("file", file);
		// start uploading
		$scope.upload(frmData, 3);
	};

	document.getElementById('proImageModel4').onchange = function() {
		var frmData = new FormData();
		var file = $('#proImageModel4')[0].files[0];
		// console.log(file);
		frmData.append("file", file);
		// start uploading
		$scope.upload(frmData, 4);
	};

	// TODO: upload file, get file name
	$scope.upload = function(frmData, id) {
		$http({
			url : BAES_URL + '/api/upload',
			method : 'POST',
			data : frmData,
			transformRequest : angular.identity,
			headers : {
				'Content-Type' : undefined
			}
		}).then(function(response) {
			$scope.IMAGE[id].URL = BAES_URL + response.data.DATA.PATH;
			$scope.IMAGE[id].PATH = response.data.DATA.PATH;
			// show image to img tag
			$('#proImg' + id).attr('src', BAES_URL + response.data.DATA.PATH);

		}, function(error) {
			console.log(error);
		});
	};
	
	/*
	 * Set Image to img tag
	 */
	// $scope.setImage = function() {
	// $('#proImg').attr('src', $scope.proImage);
	// }
	$scope.clearForm = function() {
		$scope.catFilter = 0;
		$scope.subFilter = 0;
		$scope.all = true;
		$scope.catModel = "";
		$scope.proDescModel = "";
		$scope.proImage = "";
		$scope.proNameModel = "";
		$scope.proPriceModel = "";
		// $('#proImg').attr('src', '');
		$scope.editObject = null;
		$scope.isEdit = false;
	}

	$scope.loadItem();
	$scope.loadCat();

});

app.directive('onlyDigits', function () {

    return {
        restrict: 'A',
        require: '?ngModel',
        link: function (scope, element, attrs, modelCtrl) {
            modelCtrl.$parsers.push(function (inputValue) {
                if (inputValue == undefined) return '';
                var transformedInput = inputValue.replace(/[^0-9]/g, '');
                if (transformedInput !== inputValue) {
                    modelCtrl.$setViewValue(transformedInput);
                    modelCtrl.$render();
                }
                return transformedInput;
            });
        }
}});

// $(document).ready(function() {
// $('#proImageModel').change(function() {
// alert($('#proImageModel').val());
// });
// });
