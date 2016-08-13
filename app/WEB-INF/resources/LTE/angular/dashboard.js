var app = angular.module('asva', []);
app.controller('mainCtrl', function($scope, $http){
	
	$scope.loadItem = function(){
//		$http.get(BAES_URL + '/item/user/' + user_id).then(function(response){
//			$scope.items = response.data.DATA;
//		});
		//alert(USER_SESSION.ID);
		$http({
			url: BAES_URL + '/api/item/user?userId=' + USER_SESSION.ID + '&page=1&limit=10',
			method: 'GET'
		}).then(function(response){
			$scope.items = response.data.DATA;
		});
	}
	
	$scope.loadItem();
	
	// sub string
	$scope.subDesc = function(s) {
		if (s.length > 40) {
			return s.substring(0, 40) + '...';
		} else {
			return s;
		}
	}
	
	// get thumbnail
	$scope.getThumbnail = function(img, index){
		var image = null;
		if(img!=null)
			image = img.split('#')[index];
		return BAES_URL + image;
	}
	
	$scope.splitRec = function(s, i){
		return s.split('!@#$%')[i];
	}
	
});