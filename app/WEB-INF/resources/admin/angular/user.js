/***
 * @Author: Rath Phearun 
 * @Email : rathphearun123@gmail.com
 */
var app = angular.module('userApp', []);
app.controller('userCtrl', function($scope, $http){
	
	$scope.resetStatus = false;
	$scope.reset = {
			"USER_ID": 0,
			"PASSWORD":'',
			"CONFIRM_PASSWORD": ''
	};
	
	console.log(USER_SESSION);
	$scope.$watch('reset.CONFIRM_PASSWORD', function(newValue, oldValue){
		$scope.resetStatus = ($scope.reset.PASSWORD === $scope.reset.CONFIRM_PASSWORD)?true:false;
	});
	$scope.$watch('reset.PASSWORD', function(newValue, oldValue){
		$scope.resetStatus = ($scope.reset.PASSWORD === $scope.reset.CONFIRM_PASSWORD)?true:false;
	});
	
	$scope.resetPassword = function(){
		USER.resetPassword($scope.reset);
	};
	
	
    $scope.form = {
    	"ADD_STATUS": true,
    	"TITLE": "ADD USER"
    };
    $scope.alert = {};
	
	//TODO: Define user object for creating functions 
	var USER = {};
	
	//TODO: 
	var PAGINATION = angular.element('#PAGINATION'); 
	
	//TODO: default user object 
	$scope.user = {
		  "EMAIL": "",
		  "FIRST_NAME": "",
		  "GENDER": "",
		  "ID": 0,
		  "LAST_NAME": "",
		  "PASSWORD": "",
		  "PHOTO": "",
		  "ROLE": {
		    "ID": 1000,
		    "NAME": ""
		  },
		  "STATUS": true,
		  "TELEPHONE": ""
	};
	
	//TODO: Clear text box
	$scope.addClick = function(){
		$scope.form.ADD_STATUS = true;
		$scope.form.TITLE = "ADD USER";
		
		$scope.user = {
			  "EMAIL": "",
			  "FIRST_NAME": "",
			  "GENDER": "",
			  "ID": 0,
			  "LAST_NAME": "",
			  "PASSWORD": "",
			  "PHOTO": "",
			  "ROLE": {
			    "ID": 4000,
			    "NAME": ""
			  },
			  "STATUS": 1,
			  "TELEPHONE": ""
		};
	};
	
	//TODO: Define array of user object
	$scope.users = [];
	
	//TODO: 
	$scope.paging = {};
	
	//TODO: 
	$scope.rows = [5, 10, 20, 50];
	
	//TODO:
	$scope.addRoles = [{id: '4000', name: 'MEMBER', value: 'Member'},
	                   {id: '3000', name: 'ADS MANAGER', value: 'Ads'},
	                   {id: '2000', name: 'PRODUCT MANAGER', value: 'Product'},
	                   {id: '1000', name: 'ADMINISTRATOR', value: 'Admin'}];
	
	//TODO:
	$scope.roles = [{id: '0000', name: 'ALL ROLES', value: ''},
	                {id: '4000', name: 'MEMBER', value: 'member'},
	                {id: '3000', name: 'ADS MANAGER', value: 'ads'},
	                {id: '2000', name: 'PRODUCT MANAGER', value: 'product'},
	                {id: '1000', name: 'ADMINISTRATOR', value: 'admin'}];
	
	//TODO:
	$scope.status = [{text: 'ALL STATUS', value: ""},
	                 {text: 'ACTIVE', value: "1"},
	                 {text: 'INACTIVE', value: "0"}];

	//TODO: Default filter
	$scope.filter = {
		page: 1,
		limit: 5,
		firstName: '',
		lastName: '',
		status: '',
		roleName: ''
	};
	
	
	//TODO: when row changed
	$scope.rowChange = function(limit){
		USER.reload( {
			page: 1,
			limit: limit,
			firstName: $scope.filter.firstName,
			lastName: $scope.filter.lastName,
			status: $scope.filter.status,
			roleName: $scope.filter.roleName
		});
	};
	
	//TODO: when role changed
	$scope.roleChange = function(role){
		USER.reload( {
			page: 1,
			limit: $scope.filter.limit,
			firstName: $scope.filter.firstName,
			lastName: $scope.filter.lastName,
			status: $scope.filter.status,
			roleName: role
		});
	};
	
	//TODO: 
	$scope.saveUser = function(){
		$scope.user.STATUS = $scope.user.STATUS==true?"1":"0";
		USER.save($scope.user);
	};
	
	//TODO: when status changed
	$scope.statusChange = function(status){
		USER.reload({
			page: 1,
			limit: $scope.filter.limit,
			firstName: $scope.filter.firstName,
			lastName: $scope.filter.lastName,
			status: status,
			roleName: $scope.filter.roleName
		});
	};

	//TODO: when search key changed
	$scope.searchKeyUp = function(){
		USER.reload( {
			page: 1,
			limit: $scope.filter.limit,
			firstName: $scope.filter.firstName,
			lastName: $scope.filter.lastName,
			status: $scope.filter.status,
			roleName: $scope.filter.roleName
		});
	};

	//TODO: form user change role
	$scope.addRoleChange = function(roleId){
		$scope.user.ROLE.ID = roleId;
	};
	
	$scope.onRoleUpdate = function(userId, roleId){
		if(userId=='' || userId==null)
			return;
		console.log("roleId"+roleId + ", " + userId);
		USER.updateRole(roleId, userId);
	};
	
	//TODO: edit button click
	$scope.editClick = function(userId){
		$scope.reset = {};
		$scope.form.ADD_STATUS = false;
		$scope.form.TITLE = "UPDATE USER";
		USER.find(userId);
		$scope.reset.USER_ID = userId;
	};

	//TODO: remove user
	$scope.removeUser = function(userId){
		USER.remove(userId);
	};
	
	$scope.statusButtonChange = function(userId){
		USER.updateStatus(userId);
	};
	
	/***
	 * Define User Service
	 */
	
	//TODO: Define method for load all records
	USER.findAll = function(){
		$http({
			url: BAES_URL + '/api/user',
			method: 'GET',
			params: {
				page: $scope.filter.page,
				limit: $scope.filter.limit,
				firstName: $scope.filter.firstName,
				lastName: $scope.filter.lastName,
				status: $scope.filter.status,
				roleName: $scope.filter.roleName
			}
		}).then(function(success){
			var response = success.data;
			//TODO: put data to array of users object to display to view
			$scope.users = response.DATA;
			//TODO: Initialize pagination
			USER.loadPagination(response);
			console.log($scope.users);
		}, function(error){
			console.log(error);
		});
	};

	//TODO: Load Pagination
	USER.loadPagination = function(response){
		
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
		USER.reload({
			page: pageNumber,
			limit: $scope.filter.limit,
			firstName: $scope.filter.firstName,
			lastName: $scope.filter.lastName,
			status: $scope.filter.status,
			roleName: $scope.filter.roleName
		});
	});
	
	//TODO:
	USER.save = function(user){
		var REQUEST_METHOD = "POST";
		if(!$scope.form.ADD_STATUS)
			REQUEST_METHOD = "PUT";
		
		$http({
			url: BAES_URL + '/api/user',
			method: REQUEST_METHOD,
			data: user
		}).then(function(response){
			USER.reload({
				page: 1,
				limit: $scope.filter.limit,
				firstName: $scope.filter.firstName,
				lastName: $scope.filter.lastName,
				status: $scope.filter.status,
				roleName: $scope.filter.roleName
			});
			angular.element("#success-alert").trigger('click');
		}, function(response){
			console.log(response);
		});
	};
	
	//TODO:
	USER.remove = function(id){
		$http({
			url: BAES_URL + '/api/user/' + id,
			method: 'DELETE'
		}).then(function(response){
			USER.reload({
				page: $scope.paging.currentPage,
				limit: $scope.filter.limit,
				firstName: $scope.filter.firstName,
				lastName: $scope.filter.lastName,
				status: $scope.filter.status,
				roleName: $scope.filter.roleName
			});
			angular.element("#delete-alert").trigger('click');
		},function(response){
			console.log();
		});
	};
	
	//TODO:
	USER.update = function(user){
		$http({
			url: BAES_URL + '/api/user',
			method: 'PUT',
			data: user
		}).then(function(response){
			USER.reload({
				page: $scope.paging.currentPage,
				limit: $scope.filter.limit,
				firstName: $scope.filter.firstName,
				lastName: $scope.filter.lastName,
				status: $scope.filter.status,
				roleName: $scope.filter.roleName
			});
		},function(error){
			console.log(error);
		});
	};
	
	//TODO: 
	USER.find = function(id){
		$http({
			url: BAES_URL + '/api/user/' + id,
			method: 'GET'
		}).then(function(response){
			$scope.user = response.data.DATA;
			$scope.user.STATUS = response.data.DATA.STATUS==1?true:false;
			$scope.user.ROLE.ID = response.data.DATA.ROLE.ID;
		},function(response){
			console.log();
		});
	};
	
	//TODO: Reload data again
	USER.reload = function(filter){
		$scope.filter = filter;
		USER.findAll();
	};
	
	
	//TODO:
	USER.updateRole = function(roleId, userId){
		$http({
			url: BAES_URL + '/api/user/role/' + userId + "/" + roleId,
			method: 'PUT'
		}).then(function(response){
			console.log(response);
			USER.reload({
				page: $scope.filter.page,
				limit: $scope.filter.limit,
				firstName: $scope.filter.firstName,
				lastName: $scope.filter.lastName,
				status: $scope.filter.status,
				roleName: $scope.filter.roleName
			});
			angular.element("#success-alert").trigger('click');
		},function(response){
			console.log();
		});
	};
	
	//TODO:
	USER.updateStatus = function(userId){
		$http({
			url: BAES_URL + '/api/user/' + userId,
			method: 'PUT'
		}).then(function(response){
			console.log(response);
			USER.reload({
				page: $scope.filter.page,
				limit: $scope.filter.limit,
				firstName: $scope.filter.firstName,
				lastName: $scope.filter.lastName,
				status: $scope.filter.status,
				roleName: $scope.filter.roleName
			});
			angular.element("#success-alert").trigger('click');
		},function(response){
			console.log();
		});
	};
	//TODO:
	USER.resetPassword = function(reset){
		$http({
			url: BAES_URL + '/api/user/reset',
			method: 'PUT',
			data: reset
		}).then(function(response){
			USER.reload({
				page: $scope.filter.page,
				limit: $scope.filter.limit,
				firstName: $scope.filter.firstName,
				lastName: $scope.filter.lastName,
				status: $scope.filter.status,
				roleName: $scope.filter.roleName
			});
			angular.element("#success-alert").trigger('click');
		},function(response){
			console.log();
		});
	};
	//TODO: Initialize records
	USER.findAll();
	
});





















