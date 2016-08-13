var app = angular.module('asva', []);

// controller
app.controller('mainCtrl', function($scope, $http) {
	// mainId
	$scope.catFilter = 0;
	$scope.subFilter = 0;
	$scope.search_box = "";

	// pagination
	$scope.page = 1;
	$scope.limit = 20;
	$scope.totalCount = 0;
	$scope.totalPage = 1;
	$scope.totalItems = [];
	
	$scope.setTotalItems = function(x){
		$scope.totalItems[x - 1] = '';
	}
	
	/*
	 * Request Data
	 * */
	$scope.getCategories = function(){
		
		$http.get(BAES_URL + "/api/category").then(function(res){
			$scope.categories = res.data.DATA;
		});
	}
	
	$scope.splitRec = function(s, i){
		return s.split('!@#$%')[i];
	}
	
	/*
	 * Get Item Without Cat Id
	 * */
	$scope.getItemsWithoutCatId = function(){
		$http.get(BAES_URL + '/api/item/paging/noCatId?&page='+ $scope.page +'&limit=' + $scope.limit).then(function(res){
			$scope.items = res.data.DATA;
			$scope.page = res.data.PAGING.PAGE;
			$scope.limit = res.data.PAGING.LIMIT;
			$scope.totalCount = res.data.PAGING.TOTAL_COUNT;
			$scope.totalPage = res.data.PAGING.TOTAL_PAGES;
			common();
			// set item
			$scope.setTotalItems($scope.totalCount);
		});
	}
	
	/*
	 * Get Item
	 * */
	$scope.getItems = function(p){
		// reset when sub category click
		$scope.page = p;
		$scope.limit = 20;
		$scope.totalCount = 0;
		$scope.totalPage = 1;
		
		$http.get(BAES_URL + '/api/item/paging?mainCategoryId='+ $scope.subFilter +'&page='+ $scope.page +'&limit=' + $scope.limit).then(function(res){
			$scope.items = res.data.DATA;
			$scope.page = res.data.PAGING.PAGE;
			$scope.limit = res.data.PAGING.LIMIT;
			$scope.totalCount = res.data.PAGING.TOTAL_COUNT;
			$scope.totalPage = res.data.PAGING.TOTAL_PAGES;
			// set item
			$scope.setTotalItems($scope.totalCount);
		});
	}

	// sub string
	$scope.subDesc = function(s) {
		if (s.length > 40) {
			return s.substring(0, 40) + '...';
		} else {
			return s;
		}
	}
	
	// go to page
	$scope.goToPage = function(p){
		$scope.page = p;
		if($scope.subFilter==0){
			$scope.getItemsWithoutCatId();
		}else{
			$scope.getItems(p);
		}
	}
	
	// split image url
	$scope.getThumbnail = function(img){
		return BAES_URL + img.split('#')[0];
	}

	// retrieve item
	// load data when document is ready
	//angular.element(document).ready(function() {
		$scope.getCategories();
		$scope.getItemsWithoutCatId();
		//$scope.getItems();
	//});

})