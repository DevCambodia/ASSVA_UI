<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="loginApp" ng-controller="loginCtrl">
<head>

	<jsp:include page="fragment/header-component.jsp">
		<jsp:param value="ASVA LOGIN" name="pageTitle"/>
		<jsp:param value="ASVA LOGIN" name="pageDescription"/>
		<jsp:param value="ASVA" name="author"/>
	</jsp:include>
	
	<style>
		.page-header.full-content{
			margin-right: 30px;
			margin-top:20px;
		}
	</style>
</head>
<body>
		<div class="content">
			<!--BEGIN HEADER  -->
			<div class="page-header full-content">
					<center><h1 style="color:#fff">ASVA LOGIN</h1></center>
			</div><!--.full-content  -->
	
			<div class="display-animation">
			<input type="hidden" id="base" value="${pageContext.request.contextPath}">
				<center>
					<form ng-submit="login($event)">
						<table>
							<tr>
								<td>Email</td>
								<td>
									<div class="col-md-12">
										<div class="inputer">
											<div class="input-wrapper">
												<input type="email" ng-model="user.EMAIL" class="form-control">
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>Password</td>
								<td>
									<div class="col-md-12">
										<div class="inputer">
											<div class="input-wrapper">
												<input type="password" ng-model="user.PASSWORD" class="form-control">
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr><td></td>
								<td>
									<button type="submit" class="pull-right btn btn-primary button-striped button-full-striped btn-ripple">LOGIN<span class="ripple _3 animate" style="height: 96px; width: 96px; top: -28px; left: 20.9844px;"></span><span class="ripple _4 animate" style="height: 96px; width: 96px; top: -32px; left: 35.9844px;"></span></button>
								</td>
							</tr>
						</table>
					</form>
				</center>				
			</div><!--.display-animation-->
		
	</div><!--.content-->
	
	<!--FOOTER COMPONENTS  -->
	<jsp:include page="fragment/footer-component.jsp"></jsp:include>

	<script>
			var app = angular.module('loginApp', []);
			
			app.controller('loginCtrl', function($scope, $http){
				$scope.user = {
						"EMAIL": '',
						"PASSWORD": ''
				};
				$scope.login = function($event){
					$event.preventDefault();
					$http({
						url: $('#base').val() + '/loginaction',
						method: 'POST',
						data: $scope.user
					}).then(function(response){
						console.log(response);
						if(response.data.CODE=='9000')
							location.href= response.data.REDIRECT_URL;
						else
							alert(response.data.MESSAGE);
					}, function(error){
						console.log(error);
					});
				};
	
			});
		</script>
</body>
</html>