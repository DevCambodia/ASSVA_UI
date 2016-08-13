<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="userApp" ng-controller="userCtrl">
<head>

	<jsp:include page="fragment/header-component.jsp">
		<jsp:param value="ASVA USER" name="pageTitle"/>
		<jsp:param value="ASVA ADMIN" name="pageDescription"/>
		<jsp:param value="ASVA" name="author"/>
	</jsp:include>
	
	<style>
		.btn-add-fixed{
			position:fixed;
			bottom:30px;
			right:40px;
		}
		#addStyle .bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn){
			width:100%;
		}
	</style>
</head>
<body>

<%-- 	<security:authorize access="isAuthenticated()">
		<security:authentication var="userId" property="principal.id" /> 
	</security:authorize> --%>
<%-- <h1>${pageContext.request.userPrincipal.name}</h1> --%>

	<div class="nav-bar-container">
		<jsp:include page="fragment/navigation.jsp"></jsp:include>
	</div>

	<div class="content">
		
		<!--BEGIN HEADER  -->
		<div class="page-header full-content">
			<jsp:include page="fragment/header.jsp">
				<jsp:param value="USER MANAGEMENT" name="pageName"/>
			</jsp:include>
		</div><!--.full-content  -->
	

		<div class="display-animation">
			<div class="row">
				<div class="col-md-12">
					<div class="panel indigo">
						<div class="panel-heading">
							<div class="panel-title"><h4>ALL USERS</h4>
							
							</div><!--.panel-title  -->
						</div><!--.panel-heading-->
						<div class="panel-body">
							<div class="row" id="ACTION">
								<div class="col-md-6">
									<select ng-change="roleChange(role)" ng-model="role" class="selectpicker">
										<option ng-repeat="role in roles" ng-bind="role.name" ng-value="role.value"></option>
									</select>
									<select ng-change="statusChange(s)" ng-model="s" class="selectpicker">
										<option ng-repeat="s in status" ng-bind="s.text" ng-value="s.value"></option>
									</select>
								</div>
								<div class="col-md-6">
									<div class="inputer">
										<div class="input-wrapper">
											<input type="text" class="form-control" id="txtSearch" placeholder="Searching" ng-model="filter.firstName" ng-keyup="searchKeyUp()">
										</div>
									</div>
								</div>
							</div>
							<div class="flip-scroll">
								<table class="table table-bordered table-striped table-condensed cf">
									<thead class="cf">
										<tr>
											<th>#</th>
											<th>Username</th>
											<th>Email</th>
											<th>Role</th>
											<th>Status</th>
											<th>Action</th>
									  	</tr>
									</thead>
									<tbody>
										<tr ng-repeat="u in users">
											<td ng-bind="u.ID"></td>
											<td ng-bind="u.LAST_NAME + ' ' + u.FIRST_NAME"></td>
											<td ng-bind="u.EMAIL"></td>
											<td>
												<select ng-change="onRoleUpdate(u.ID, r)" ng-model="r" class="selectpicker">
													<option ng-bind="u.ROLE.NAME"></option>
													<option ng-repeat="r in addRoles" ng-bind="r.value" ng-value="r.id"></option>
												</select>
											</td>
											<td>
												<div class="switcher switcher-indigo form-inline">
													<input ng-click="statusButtonChange(u.ID)" id="{{u.ID}}" type="checkbox" hidden="hidden" ng-checked="u.STATUS">
													<label for="{{u.ID}}"></label>
												</div>
											</td>
											<td>
												<a ng-click="editClick(u.ID)" data-target="#resetPasswordModal" data-toggle="modal" class="btn btn-floating show-on-hover btn-ripple"><i class="glyphicon glyphicon-pencil"></i></a>
												<a ng-click="removeUser(u.ID)" class="btn btn-floating show-on-hover btn-ripple"><i class="glyphicon glyphicon-trash"></i></a>
											</td>
										</tr>
									</tbody>
								</table>
							</div><!--.flip-scroll-->
							<div class="row">
								<div class="col-md-6">
									<div id="INFORMATION">Showing {{paging.currentPage}} to {{paging.limit}} of {{paging.totalRecords}} entries</div>
									<select class="selectpicker" ng-change="rowChange(row)" ng-model="row">
										<option>TOTAL ROWS</option>
										<option ng-repeat="row in rows" ng-value="row" ng-bind="row"></option>
									</select>
								</div>
								<div class="col-md-6">
									<div id="PAGINATION" class="pull-right"></div>
								</div>
							</div>
							
						</div><!--.panel-body-->
					</div><!--.panel-->
				</div>
			</div><!--.row-->
		</div><!--.display-animation-->
		
		<!--BEGIN BUTTON ADD  -->		
		<div class="btn-add-fixed">
			<a ng-click="addClick()" data-target="#addUserModal" data-toggle="modal" class="btn btn-indigo btn-ripple"><i class="ion-android-add"></i></a>
		</div>
		
		<!--BEGIN ADD USER MODAL  -->
		<div class="modal scale fade" id="addUserModal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<form ng-submit="saveUser()">
						<div class="modal-header">
							<h4 class="modal-title"><i class="glyphicon glyphicon-user"></i> {{form.TITLE}}</h4><hr>
						</div>
						<div class="modal-body">
							
							<div class="row">
								<div class="col-md-12" id="addStyle">
									<select ng-change="addRoleChange(role)" ng-model="role" class="selecter" style="display: none;">
										<option ng-repeat="role in addRoles" ng-bind="role.name" ng-value="role.id"></option>
									</select>
								</div>
							</div>
							
							<div class="inputer floating-label">
								<div class="input-wrapper">
									<input ng-model="user.LAST_NAME" type="text" class="form-control" id="lastname" required>
									<label for="lastname">Last Name</label>
								</div>
							</div>
							<div class="inputer floating-label">
								<div class="input-wrapper">
									<input ng-model="user.FIRST_NAME" type="text" class="form-control" id="firstname" required>
									<label for="firstname">First Name</label>
								</div>
							</div>
							<div class="inputer floating-label">
								<div class="input-wrapper">
									<input type="email" ng-model="user.EMAIL" class="form-control" id="email" required>
									<label for="email">Email Address</label>
								</div>
							</div>
							<div class="inputer floating-label">
								<div class="input-wrapper">
									<input ng-model="user.PASSWORD" type="password" class="form-control" id="password" required>
									<label for="password">Password</label>
								</div>
							</div>
							
							<div class="row">
								<div class="switcher switcher-green form-inline">
									<input id="userAddStatus" type="checkbox" hidden="hidden" ng-checked="user.STATUS" ng-model="user.STATUS">
									<label for="userAddStatus"></label>
								</div>
							</div>
							<!-- <code>{{user | json}}</code> -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-flat btn-default btn-ripple" data-dismiss="modal">CANCEL</button>
							<button data-dismiss="modal" type="submit" class="btn btn-primary button-striped button-full-striped btn-ripple">SAVE<span class="ripple _3 animate" style="height: 96px; width: 96px; top: -28px; left: 20.9844px;"></span><span class="ripple _4 animate" style="height: 96px; width: 96px; top: -32px; left: 35.9844px;"></span></button>
						</div>
					</form>				
				</div><!--.modal-content-->
			</div><!--.modal-dialog-->
		</div>	
		<!--END ADD USER MODAL  -->
		
		<!--BEGIN ADD USER MODAL  -->
		<div class="modal scale fade" id="resetPasswordModal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<form ng-submit="resetPassword()">
						<div class="modal-header">
							<h4 class="modal-title"><i class="glyphicon glyphicon-user"></i> RESET PASSWORD</h4><hr>
						</div>
						<div class="modal-body">
							
							<div class="inputer floating-label">
								<div class="input-wrapper">
									<input ng-model="reset.PASSWORD" type="password" class="form-control" id="newpassword" required>
									<label for="newpassword">New Password</label>
								</div>
							</div>
							
							<div class="inputer floating-label">
								<div class="input-wrapper">
									<input ng-model="reset.CONFIRM_PASSWORD" type="password" class="form-control" id="confirmpassword" required>
									<label for="confirmpassword">Confirm Password</label>
								</div>
							</div>
		
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-flat btn-default btn-ripple" data-dismiss="modal">CANCEL</button>
							<button type="submit" ng-disabled="!resetStatus" class="btn btn-primary button-striped button-full-striped btn-ripple">RESET PASSWORD<span class="ripple _3 animate" style="height: 96px; width: 96px; top: -28px; left: 20.9844px;"></span><span class="ripple _4 animate" style="height: 96px; width: 96px; top: -32px; left: 35.9844px;"></span></button>
						</div>
					</form>				
				</div><!--.modal-content-->
			</div><!--.modal-dialog-->
		</div>	
		<!--END ADD USER MODAL  -->
		
		<!--BEGIN ALERT DIALOG  -->
		<button​ style="display:none" id="success-alert" data-toastr-notification="SUCCESSFULLY!" class="btn btn-default toastr-notify btn-ripple" data-toastr-close-others="true" data-toastr-position="toast-top-full-width" data-toastr-type="success">Success<span class="ripple _30 animate" style="height: 148px; width: 148px; top: -56px; left: -2px;"></span><span class="ripple _31 animate" style="height: 148px; width: 148px; top: -46px; left: -16px;"></span><span class="ripple _32 animate" style="height: 148px; width: 148px; top: -58px; left: -19px;"></span><span class="ripple _34 animate" style="height: 148px; width: 148px; top: -58px; left: -44px;"></span></button>
	</div><!--.content-->
		
	<!--MENU NAVIGATION  -->
	<div class="layer-container">
		<jsp:include page="fragment/nav-menu.jsp"></jsp:include>
	</div><!--.layer-container-->
	
	<!--FOOTER COMPONENTS  -->
	<jsp:include page="fragment/footer-component.jsp"></jsp:include>
	
	<!--SCRIPT FOR USER PAGE  -->
	<script src="${pageContext.request.contextPath }/resources/admin/angular/user.js"></script>
	
</body>
</html>