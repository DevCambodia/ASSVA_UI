var app = angular.module('adsApp', []);
app.controller('adsCtrl', function($scope, $http){

	var ADS = {};
	var ADS_DETAIL = {};
	
	$scope.form = {
	    	"ADD_STATUS": true,
	    	"TITLE": "ADD ADVERTISE"
	 };
	
	//TODO:
	$scope.base_url = BAES_URL;
	
	//TODO: 
	var PAGINATION = angular.element('#PAGINATION');
	
	$scope.locations = [{text: "ALL LOCATIONS", value: ''},
	                    {text: "LEFT", value: 'left'},
	                    {text: "RIGHT", value: 'right'},
	                    {text: "TOP 25%", value: 'top_3'},
	                    {text: "TOP 33%", value: 'top_4'},
	                    {text: "TOP 50%", value: 'top_6'},
	                    {text: "TOP 100%", value: 'top_12'},
	                    {text: "BOTTOM 25%", value: 'bottom_3'},
	                    {text: "BOTTOM 33%", value: 'bottom_4'},
	                    {text: "BOTTOM 50%", value: 'bottom_6'},
	                    {text: "BOTTOM 100%", value: 'bottom_12'},
	                    {text: "BOTTOM SMALL", value: 'bottom_small'}];

	$scope.addLocations = [{id: '2', text: 'LEFT', value: 'left', w: '95', h: '150'},
	                       {id: '4', text: 'RIGHT', value: 'right', w: '95', h: '150'},
	                       {id: '7', text: 'TOP 25%', value: 'top_3', w: '279', h: '150'},
	                       {id: '8', text: 'TOP 33%', value: 'top_4', w: '373', h: '150'},
	                       {id: '9', text: 'TOP 50%', value: 'top_6', w: '559', h: '150'},
	                       {id: '10', text: 'TOP 100%', value: 'top_12', w: '1119', h: '150'},
	                       {id: '12', text: 'BOTTOM 25%', value: 'bottom_3', w: '279', h: '150'},
	                       {id: '13', text: 'BOTTOM 33%', value: 'bottom_4', w: '373', h: '150'},
	                       {id: '14', text: 'BOTTOM 50%', value: 'bottom_6', w: '559', h: '150'},
	                       {id: '15', text: 'BOTTOM 100%', value: 'bottom_12', w: '1119', h: '150'},
	                       {id: '5', text: 'BOTTOM SMALL', value: 'bottom_small', w: '130', h: '50'}];
	
	$scope.status = [{text:"ALL STATUS", value: ''}, 
	                 {text:"ACTIVE", value: '1'},
	                 {text:"INACTIVE", value: '0'}]; 
	$scope.adsDetail = {
		"LOCATION": 'TOP',
		"MAX_WIDTH": 200,
		"MAX_HEIGHT": 400
	};
	
	$scope.rows = [5, 10, 20, 50];
	
	$scope.adss = [];
	
	$scope.ads = {
		  "ADS_DETAIL": {
		    "ID": 1,
		    "LOCATION": "TOP",
		    "MAX_HEIGHT": 0,
		    "MAX_WIDTH": 0,
		    "TYPE": 0
		  },
		  "HEIGHT": 0,
		  "ID": 0,
		  "IMAGE": "default.jpg",
		  "LINK": "#",
		  "NAME": "default",
		  "ORDER": 0,
		  "OWNER": "",
		  "STATUS": "",
		  "WIDTH": 0
	};
	
	$scope.filter = {
		"byOwner": '',
		"status" : '',
		"byLocation": '',
		"page" : 1,
		"limit": 5
	};
	
	$scope.reset = function(){
		$scope.ads = {
				  "ADS_DETAIL": {
				    "ID": 1,
				    "LOCATION": "TOP",
				    "MAX_HEIGHT": 0,
				    "MAX_WIDTH": 0,
				    "TYPE": 0
				  },
				  "HEIGHT": 0,
				  "ID": 0,
				  "IMAGE": "default.jpg",
				  "LINK": "#",
				  "NAME": "default",
				  "ORDER": 0,
				  "OWNER": "",
				  "STATUS": "",
				  "WIDTH": 0
			};
	}
	
	$('#cancel').click(function(){
		$scope.reset();
	});
	
	$scope.adsAddClick = function(){
		$scope.form.TITLE = 'ADD ADVERTISE';
		$scope.form.ADD_STATUS = true;
	};
	
	$scope.editClick = function(id){
		$scope.form.TITLE = 'UPDATE ADVERTISE';
		$scope.form.ADD_STATUS = false;
		ADS.findOne(id);
	};
	
	$scope.locationChange = function(location){
		$scope.filter.byLocation = location;
		ADS.findAll();
	};
	
	$scope.statusChange = function(status){
		$scope.filter.status = status;
		ADS.findAll();
	};
	
	$scope.searchKeyUp = function(){
		ADS.findAll();
	};
	
	$scope.rowChange = function(limit){
		$scope.filter.limit = limit;
		ADS.reload({
			"status" : $scope.filter.status,
			"byOwner" : $scope.filter.byOwner,
			"byLocation": $scope.filter.byLocation,
			"page" : 1,
			"limit": $scope.filter.limit
		});
	};
	
	$scope.saveAds = function(){
		ADS.save($scope.ads);
	};
	
	$scope.toggleAds = function(adsId){
		console.log(adsId);
		ADS.toggleStatus(adsId);
	};
	
	document.getElementById('banner').onchange = function(){
		var frmData = new FormData();
		var file = $('#banner')[0].files[0];
		frmData.append("file", file);
		console.log(frmData);
		ADS.upload(frmData);
	};
	
	$scope.removeAds = function(id){
		ADS.remove(id);
	};
	
	$scope.addLocationChange = function(id){
		$scope.ads.ADS_DETAIL.ID = id;
		//ADS_DETAIL.findOne(id);
		// find adsDetail and set max-width max-height
		for(var i=0; i<$scope.addLocations.length; i++){
			if(id==$scope.addLocations[i].id){
				$scope.adsDetail.MAX_WIDTH = $scope.addLocations[i].w;
				$scope.adsDetail.MAX_HEIGHT = $scope.addLocations[i].h;
			}
		}
		
	};
	
	//TODO: Load Pagination
	ADS.loadPagination = function(response){
		//TODO: Initialize pagination setting
		$scope.paging = {
			totalPages: response.PAGING.TOTAL_PAGES,
			totalRecords: response.PAGING.TOTAL_COUNT,
			currentPage: response.PAGING.PAGE,
			limit: response.PAGING.LIMIT
		};
		
		PAGINATION.bootpag({
	        total: $scope.paging.totalPages,
	        page: $scope.paging.currentPage,
	        leaps: true,
	        firstLastUse: true,
	        first: '←',
	        last: '→',
	        next: 'Next',
	        prev: 'Prev',
	        maxVisible: 5
	    });	    
	};
	
	//TODO: Add listener to page click
	PAGINATION.on("page", function(event, pageNumber){
		ADS.reload({
			"status" : $scope.filter.status,
			"byOwner" : $scope.filter.byOwner,
			"byLocation": $scope.filter.byLocation,
			"page" : pageNumber,
			"limit": $scope.filter.limit
		});
	});
	
	
	//TODO: Save Ads
	ADS.save = function(ads){
		console.log('saving...');
		var REQUEST_METHOD = 'POST';
		if(!$scope.form.ADD_STATUS){
			$scope.ads.IMAGE = $('#fileName').val();
			console.log($('#fileName').val());
			REQUEST_METHOD = 'PUT';
		}
		
		$http({
			url: $scope.base_url + '/api/ads',
			method: REQUEST_METHOD,
			data: ads
		}).then(function(response){
			console.log(response);
			ADS.reload({
				"status" : $scope.filter.status,
				"byOwner" : $scope.filter.byOwner,
				"byLocation": $scope.filter.byLocation,
				"page" : $scope.filter.page,
				"limit": $scope.filter.limit
			});
			
			angular.element("#success-alert").trigger('click');
			$('#cancel').click();
			$scope.form.ADD_STATUS = true;
		}, function(error){
			console.log(error);
		});
	};
	//TODO:
	ADS.remove = function(id){
		$http({
			url: $scope.base_url + '/api/ads/' + id,
			method: 'DELETE'
		}).then(function(response){
			console.log(response);
			ADS.reload({
				"status" : $scope.filter.status,
				"byOwner" : $scope.filter.byOwner,
				"byLocation": $scope.filter.byLocation,
				"page" : $scope.filter.page,
				"limit": $scope.filter.limit
			});
		}, function(error){
			console.log(error);
		});
	};
	//TODO:
	ADS.findOne = function(id){
		$http({
			url: $scope.base_url + '/api/ads/' + id,
			method: 'GET'
		}).then(function(response){
			//console.log(response);
			$scope.ads = response.data.DATA;
			$('#banner-preview').attr('src', BAES_URL + $scope.ads.IMAGE);
		}, function(error){
			console.log(error);
		});
	};
	//TODO:
	ADS.findAll = function(){
		$http({
			url: $scope.base_url + '/api/ads',
			method: 'GET',
			params: $scope.filter
		}).then(function(success){
			console.log(success);
			var response = success.data;
			
			$scope.adss = response.DATA;
			console.log($scope.adss);
			ADS.loadPagination(response);
			
		}, function(error){
			console.log(error);
		});
	};
	
	//TODO: upload file, get file name
	ADS.upload = function(frmData){
		$http({
			url: $scope.base_url + '/api/upload',
			method: 'POST',
			data: frmData,
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
		}).then(function(response){
			//console.log(response);
			$scope.ads.IMAGE = response.data.DATA.PATH;
			//console.log("IMAGE: " + $scope.ads.IMAGE);
			$('#banner-preview').attr('src', BAES_URL + $scope.ads.IMAGE);
		}, function(error){
			console.log(error);
		});
	};

	//TODO: Reload data again
	ADS.reload = function(filter){
		$scope.filter = filter;
		ADS.findAll();
	};
	
	ADS.findAll();

	//TODO: get all ads detail
	ADS_DETAIL.findAll = function(){
		$http({
			url: $scope.base_url + '/api/adsdetail',
			method: 'GET'
		}).then(function(response){
			console.log(response);
		},function(error){
			console.log(response);
		});
	};
	
	//TODO: get one ads detail
	ADS_DETAIL.findOne = function(id){
		$http({
			url: $scope.base_url + '/api/adsdetail/' + id,
			method: 'GET'
		}).then(function(response){
			console.log(response);
			$scope.adsDetail = response.data.DATA;
		}, function(error){
			console.log(error);
		});
	};
	
	ADS.toggleStatus = function(id){
		console.log("id: " + id);
		$http({
			url: $scope.base_url + '/api/ads/' + id,
			method: 'PUT'
		}).then(function(response){
			console.log(response);
			ADS.reload({
				"status" : $scope.filter.status,
				"byOwner" : $scope.filter.byOwner,
				"byLocation": $scope.filter.byLocation,
				"page" : $scope.filter.page,
				"limit": $scope.filter.limit
			});
			
			angular.element("#success-alert").trigger('click');
			
		}, function(error){
			console.log(error);
		});
	};
	
});