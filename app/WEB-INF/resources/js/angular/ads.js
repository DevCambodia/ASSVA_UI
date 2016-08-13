app.controller('adsCtrl', function($scope, $http){
	
	$scope.ads = [];
	
	$scope.api_url = BAES_URL;
	
	$scope.loadAds = function(){
		$http.get(BAES_URL + '/api/ads').then(function(res){
			$scope.ads = res.data.DATA;
			
			// loop and add base url to image
//			for(var i; $scope.ads.length; i++){
//				$scope.ads[i].IMAGE = BAES_URL + $scope.ads[i].IMAGE.toString(); 
//			}
		});
	}
	
	// LOAD ADS
	$scope.loadAds();
})
