var app = angular.module('asva', []);
app.controller('mainCtrl', function($scope, $http){
	$scope.itemId = 0;
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
	
	$scope.IMAGE = [{'PATH': ''}, {'PATH': ''}, {'PATH': ''}, {'PATH': ''}, {'PATH': ''}];
	
	$scope.setTotalItems = function(x){
		$scope.totalItems[x - 1] = '';
	}
	
	$scope.loadItem = function(id){
		if(!isNaN(id)){
			// set itemId
			$scope.itemId = id;
			// request
			$http({
				url: BAES_URL + '/api/item/' + id,
				method: 'GET'
			}).then(function(response){
				$scope.item = response.data.DATA;
				// load related item
				$scope.loadRelatedItem($scope.item.ITEM_CATEGORY.ID);
				// load related item in main category
				$scope.loadRelatedItemByUserId($scope.item.ITEM_USER.ID);
				
				// add product image to $scope.IMAGE
				var img = $scope.item.ITEM_IMAGE.split('#');
				for(var i=0; i<img.length; i++)
					if(img[i] != '/resources/images/thumbnail-default.jpg')
						$scope.IMAGE[i].PATH = BAES_URL + img[i];
					else
						$scope.IMAGE[i].PATH = '0'
			});
		}
	}
	
	// get all related items
	$scope.loadRelatedItem = function(catId){
		$scope.itemId = catId;
		$scope.limit = 20;
		$scope.totalCount = 0;
		$scope.totalPage = 1;
		$http({
			url: BAES_URL + '/api/item/paging?mainCategoryId='+ catId +'&page='+ $scope.page +'&limit=' + $scope.limit,
			method: 'GET'
		}).then(function(res){
			$scope.relatedItems = res.data.DATA;
			$scope.page = res.data.PAGING.PAGE;
			$scope.limit = res.data.PAGING.LIMIT;
			$scope.totalCount = res.data.PAGING.TOTAL_COUNT;
			$scope.totalPage = res.data.PAGING.TOTAL_PAGES;
			common();
			// set item
			$scope.setTotalItems($scope.totalCount);
		});
	}
	
	// get all related items in main category
	$scope.loadRelatedItemByUserId = function(userId){
		$http({
			url: BAES_URL + '/api/item/user/' + userId,
			method: 'GET'
		}).then(function(response){
			$scope.relatedItemsByUser = response.data.DATA;
		});
	}
	
	// sub string
	$scope.subDesc = function(s){
		if(s.length>40){
			return s.substring(0, 40) + '...';
		}else{
			return s;
		}
	}
	
	// go to page
	$scope.goToPage = function(p){
		$scope.page = p;
		$scope.loadRelatedItem($scope.itemId);
	}
	
	// get thumbnail
	$scope.getThumbnail = function(img, index){
		var image = null;
		if(img!=null)
			image = img.split('#')[index];
		return BAES_URL + image;
	}
	
	$scope.setPrevImg = function(img){
		$('#prev-img').attr('src', img);
		$('#item-url').attr('href', img);
	}
	
	$scope.splitRec = function(s, i){
		return s.split('!@#$%')[i].toString();
	}

	// LOAD ON START UP
	$scope.loadItem();
	
	
});

// convert html tag to text
app.filter('to_trusted', [ '$sce', function($sce) {
	return function(text) {
		return $sce.trustAsHtml(text);
	};
} ]);