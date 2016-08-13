<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="../fragment/header-component.jsp">
		<jsp:param value="ASVA USER" name="pageTitle"/>
		<jsp:param value="ASVA ADMIN" name="pageDescription"/>
		<jsp:param value="ASVA" name="author"/>
	</jsp:include>
	
	<style>
		.btn-add-fixed{
			position:fixed;
			bottom:30px;
			right:30px;
		}
		#addStyle .bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn){
			width:100%;
		}
	</style>
</head>
<body>

	<div class="nav-bar-container">
		<jsp:include page="../fragment/navigation.jsp"></jsp:include>
	</div>

	<div class="content">
	
		<!--BEGIN HEADER  -->
		<div class="page-header full-content">
			<jsp:include page="../fragment/header.jsp">
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
									<select class="selectpicker" style="display: none;">
										<option>All Roles</option>
										<option value="1">Administrator</option>
										<option value="2">Product Manager</option>
										<option value="3">Ads Manager</option>
										<option value="4">Member</option>
									</select>
									<select class="selectpicker" style="display: none;">
										<option>All Status</option>
										<option value="1">Active</option>
										<option value="0">Inactive</option>
									</select>
								</div>
								<div class="col-md-6">
									<div class="inputer">
										<div class="input-wrapper">
											<input type="text" class="form-control" id="txtSearch" placeholder="Searching">
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
										<tr>
											<td>001</td>
											<td>Rath Phearun</td>
											<td>rathphearun123@gmail.com</td>
											<td>Admin</td>
											<td>
												<div class="switcher switcher-green form-inline">
													<input id="status" type="checkbox" hidden="hidden" checked="checked">
													<label for="status"></label>
												</div>
											</td>
											<td>
												<a class="btn btn-floating show-on-hover btn-ripple"><i class="glyphicon glyphicon-pencil"></i></a>
												<a class="btn btn-floating show-on-hover btn-ripple"><i class="glyphicon glyphicon-trash"></i></a>
											</td>
										</tr>
										<tr>
											<td>002</td>
											<td>Dara Penhchet</td>
											<td>darapenhchet@gmail.com</td>
											<td>Admin</td>
											<td>
												<div class="switcher switcher-green form-inline">
													<input id="status1" type="checkbox" hidden="hidden" checked="checked">
													<label for="status1"></label>
												</div>
											</td>
											<td>
												<a class="btn btn-floating show-on-hover btn-ripple"><i class="glyphicon glyphicon-pencil"></i></a>
												<a class="btn btn-floating show-on-hover btn-ripple"><i class="glyphicon glyphicon-trash"></i></a>
											</td>
										</tr>
									</tbody>
								</table>
							</div><!--.flip-scroll-->
							<div class="row">
								<div class="col-md-6">
									<div id="INFORMATION">Showing 1 to 10 of 57 entries</div>
									<select class="selectpicker" style="display: none;">
										<option>Total Rows</option>
										<option value="15">15</option>
										<option value="30">30</option>
										<option value="50">50</option>
										<option value="100">100</option>
									</select>
								</div>
								<div class="col-md-6">
									<!-- BEGIN PAGINATION -->
									<div id="PAGINATION" class="pull-right">
										<ul class="pagination">
											<li class="prev disabled"><a href="#">← Previous</a></li>
											<li class="active"><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li class="next"><a href="#">Next → </a></li>
										</ul>
									</div>
									<!-- END PAGINATION -->
								</div>
							</div>
							
						</div><!--.panel-body-->
					</div><!--.panel-->
				</div>
			</div><!--.row-->
		</div><!--.display-animation-->
		
		<!--BEGIN BUTTON ADD  -->		
		<div class="btn-add-fixed">
			<a data-target="#addUserModal" data-toggle="modal" class="btn btn-floating btn-deep-purple btn-ripple"><i class="ion-android-add"></i></a>
		</div><!--.btn-add-fixed  -->
		
		<!--BEGIN ADD USER MODAL  -->
		<div class="modal scale fade" id="addUserModal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title"><i class="glyphicon glyphicon-user"></i> ADD USER</h4><hr>
					</div>
					<div class="modal-body">
						
						<div class="row">
							<div class="col-md-12" id="addStyle">
								<select class="selecter" style="display: none; width:100%">
									<option value="1">Administrator</option>
									<option value="2">Product Manager</option>
									<option value="3">Ads Manager</option>
									<option value="4">Member</option>
								</select>
							</div>
						</div>
						
						<div class="inputer floating-label">
							<div class="input-wrapper">
								<input type="text" class="form-control" id="lastname" required>
								<label for="lastname">Last Name</label>
							</div>
						</div>
						<div class="inputer floating-label">
							<div class="input-wrapper">
								<input type="text" class="form-control" id="firstname" required>
								<label for="firstname">First Name</label>
							</div>
						</div>
						<div class="inputer floating-label">
							<div class="input-wrapper">
								<input type="email" class="form-control" id="email" required>
								<label for="email">Email Address</label>
							</div>
						</div>
						<div class="inputer floating-label">
							<div class="input-wrapper">
								<input type="password" class="form-control" id="password" required>
								<label for="password">Password</label>
							</div>
						</div>
						
						<div class="inputer floating-label">
							<div class="input-wrapper">
								<input type="password" class="form-control" id="confirmPassword" required>
								<label for="confirmPassword">Confirm Password</label>
							</div>
						</div>
						
						<div class="row">
							<div class="switcher switcher-green form-inline">
								<input id="userAddStatus" type="checkbox" hidden="hidden" checked="checked">
								<label for="userAddStatus"></label><span> ACTIVE</span>
							</div>
						</div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-flat btn-default btn-ripple" data-dismiss="modal">CANCEL<span class="ripple _5 animate" style="height: 80px; width: 80px; top: -20.736px; left: -1.45313px;"></span><span class="ripple _7 animate" style="height: 80px; width: 80px; top: -21.736px; left: -6.45313px;"></span><span class="ripple _9 animate" style="height: 80px; width: 80px; top: -22.736px; left: -12.4531px;"></span></button>
						<button type="button" class="btn btn-flat btn-primary btn-ripple">SAVE</button>
					</div>
				</div><!--.modal-content-->
			</div><!--.modal-dialog-->
		</div>	
		<!--END ADD USER MODAL  -->
		
	</div><!--.content-->
		
	<!--MENU NAVIGATION  -->
	<div class="layer-container">
		<jsp:include page="../fragment/nav-menu.jsp"></jsp:include>
	</div><!--.layer-container-->
	
	<!--FOOTER COMPONENTS  -->
	<jsp:include page="../fragment/footer-component.jsp"></jsp:include>

</body>
</html>
