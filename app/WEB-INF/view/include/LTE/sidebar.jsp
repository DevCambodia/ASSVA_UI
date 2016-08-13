<aside class="main-sidebar" ng-app="asva" ng-controller="userCtrl">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img
					src="{{user.PHOTO}}"
					class="img-circle" alt="User Image" width="50px" height="50px">
			</div>
			<div class="pull-left info">
				<p>{{user.LAST_NAME}} {{user.FIRST_NAME}}</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- search form -->
		<!-- <form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="Search..."> <span class="input-group-btn">
							<button type="submit" name="search" id="search-btn"
								class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form> -->
		<!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">MAIN NAVIGATION</li>
			
			<!-- Dashboard -->
			<li><a href="${pageContext.request.contextPath}/user/dashboard"> <i class="fa fa-dashboard"></i> <span>Dashboard</span> <span class="pull-right-container">
				</span>
			</a></li>
			
			<!-- Product -->
			<li><a href="${pageContext.request.contextPath}/user/product"> <i class="fa fa-th"></i> <span>Products</span>
					<span class="pull-right-container"> <!-- <small
						class="label pull-right bg-green">new</small> -->
				</span>
			</a></li>			
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>