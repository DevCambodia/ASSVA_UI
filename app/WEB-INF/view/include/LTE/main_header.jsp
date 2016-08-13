<header class="main-header" ng-app="asva" ng-controller="userCtrl">

	<!-- Logo -->
	<a href="${pageContext.request.contextPath}/dashboard" class="logo">
		<!-- mini logo for sidebar mini 50x50 pixels --> <span
		class="logo-mini"><b>A</b>UD</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>ASSVA</b> User Dashboard</span>
	</a>

	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>
		<!-- Navbar Right Menu -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="{{user.PHOTO}}" class="user-image" alt="User Image"> <span
						class="hidden-xs">{{user.LAST_NAME}} {{user.FIRST_NAME}}</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img src="{{user.PHOTO}}"
							class="img-circle" alt="User Image">

							<p>
								{{user.LAST_NAME}} {{user.FIRST_NAME}} <br>
								{{user.ROLE.NAME}} <small>{{user.EMAIL}}</small>
							</p></li>
						<!-- Menu Body -->
						<!-- <li class="user-body">
							<div class="row">
								<div class="col-xs-4 text-center">
									<a href="#">Followers</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Sales</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">Friends</a>
								</div>
							</div> /.row
						</li> -->
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" data-toggle="modal" data-target="#userModal"
									class="btn btn-default btn-flat">Profile</a>
							</div>
							<div class="pull-right">
								<a href="${pageContext.request.contextPath}/admin/logout" class="btn btn-default btn-flat">Log Out</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</div>

	</nav>
</header>

<form class="modal fade" id="userModal" data-keyboard="false"
	ng-app="asva" ng-controller="userCtrl" name="userForm"
	data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					ng-click="clearForm()" aria-label="Close">
					<span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
				</button>
				<h4 class="modal-title">
					Edit User Profile
				</h4>
			</div>
			<!-- <input type="hidden" id="uID" value="{{user.ID}}"> -->
			<div class="modal-body">
				<div class="box-body">
					<div class="form-group">
						<label for="userNameModel">First Name</label> <input type="text"
							class="form-control" id="firstName" value="{{user.FIRST_NAME}}"
							required placeholder="Full Name">
					</div>
					<div class="form-group">
						<label for="userNameModel">Last Name</label> <input type="text"
							class="form-control" id="lastName" value="{{user.LAST_NAME}}"
							required placeholder="Full Name">

					</div>
					<div class="form-group">
						<label>Gender</label> <select id="gender"
							class="form-control input-sm" required>
							<option ng-value="female" value="female"
								ng-selected="(user.GENDER | lowercase) == female">Female</option>
							<option ng-value="male"
								ng-selected="(user.GENDER | lowercase) == male">Male</option>
						</select>
					</div>
					<div class="form-group">
						<label for="phone">Phone</label> <input type="text" required
							 class="form-control" id="phone"
							value="{{user.TELEPHONE}}" placeholder="Phone Number...">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left"
					data-dismiss="modal" id="btnUserClose">Close</button>
				<button type="button" class="btn btn-primary"
					ng-click="updateUser()">Save</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</form>