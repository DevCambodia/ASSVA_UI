<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>ASVA ADMIN</title>

	<meta name="description" content="ASVA ADMIN">
	<meta name="author" content="ASVA">

	<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
	<meta name="apple-touch-fullscreen" content="yes">

	<!-- BEGIN CORE CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/admin1/css/admin1.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/globals/css/elements.css">
	<!-- END CORE CSS -->

	<!-- BEGIN PLUGINS CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/globals/plugins/rickshaw/rickshaw.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/globals/plugins/bxslider/jquery.bxslider.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/globals/css/plugins.css">
	<!-- END PLUGINS CSS -->

	<!-- BEGIN SHORTCUT AND TOUCH ICONS -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/assets/globals/img/icons/favicon.ico">
	<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/admin/assets/globals/img/icons/apple-touch-icon.png">
	<!-- END SHORTCUT AND TOUCH ICONS -->

	<script src="${pageContext.request.contextPath}/resources/admin/assets/globals/plugins/modernizr/modernizr.min.js"></script>
	<style>
		td:first-child,
		th:first-child,
		th:nth-child(4),
		td:nth-child(4),
		th:nth-child(5),
		td:nth-child(5),
		th:last-child,
		td:last-child { text-align: center }
	
	</style>
</head>
<body>

	<div class="nav-bar-container">

		<!-- BEGIN ICONS -->
		<div class="nav-menu">
			<div class="hamburger">
				<span class="patty"></span>
				<span class="patty"></span>
				<span class="patty"></span>
				<span class="patty"></span>
				<span class="patty"></span>
				<span class="patty"></span>
			</div><!--.hamburger-->
		</div><!--.nav-menu-->

		<div class="nav-bar-border"></div><!--.nav-bar-border-->

		<!-- BEGIN OVERLAY HELPERS -->
		<div class="overlay">
			<div class="starting-point">
				<span></span>
			</div><!--.starting-point-->
			<div class="logo">ASVA ADMIN</div><!--.logo-->
		</div><!--.overlay-->

		<div class="overlay-secondary"></div><!--.overlay-secondary-->
		<!-- END OF OVERLAY HELPERS -->

	</div><!--.nav-bar-container-->

	<div class="content">

		<div class="page-header full-content">
			<div class="row">
				<div class="col-sm-6">
					<h1>DASHBOARD</h1>
				</div><!--.col-->
				<div class="col-sm-6">
					<ol class="breadcrumb">
						<li><a href="#" class="active"><i class="ion-home"></i> Homepage</a></li>
					</ol>
				</div><!--.col-->
			</div><!--.row-->
		</div><!--.page-header-->

		<div class="display-animation">
			<div class="row">
				<div class="col-md-12">
					<div class="panel indigo">
						<div class="panel-heading">
							<div class="panel-title"><h4>ALL USERS</h4>
								<input type="button" class="btn btn-red btn-ripple pull-right" value="ADD COURSE" data-target="#modalAddNewCourse" data-toggle="modal"/>
							</div>
						</div><!--.panel-heading-->
						<div class="panel-body">
							<div class="row" id="FILTERING">
								
							</div>
							<div class="row" id="ACTION">
								<div class="col-md-6">
									<select class="selectpicker" style="display: none;">
										<option>All Generations</option>
										<option value="1">1st Generation</option>
										<option value="2">2nd Generation</option>
									</select>
									<select class="selectpicker" style="display: none;">
										<option>All Shifts</option>
										<option value="1">Mon-Fri</option>
										<option value="2">Sat-Sun</option>
									</select>
									<select class="selectpicker" style="display: none;">
										<option>All Times</option>
										<option value="1">08:00AM-11:00AM</option>
										<option value="2">06:00PM-08:00PM</option>
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
											<th style="text-align:center;">No</th>
											<th>Course Name</th>
											<th>Generation</th>
											<th>Shift</th>
											<th>Time</th>
											<th>Action</th>
									  	</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Android</td>
											<td>1st Generation</td>
											<td>Sat-Sun</td>
											<td>8:00AM-11:00AM</td>
											<td>
												<input type="button" class="btn btn-success btn-ripple" value="VIEW / EDIT"/>
											</td>
										</tr>
										<tr>
											<td>2</td>
											<td>IOS</td>
											<td>1st Generation</td>
											<td>Sat-Sun</td>
											<td>8:00AM-11:00AM</td>
											<td>
												<input type="button" class="btn btn-success btn-ripple" value="VIEW / EDIT"/>
											</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Java SE</td>
											<td>1st Generation</td>
											<td>Sat-Sun</td>
											<td>8:00AM-11:00AM</td>
											<td>
												<input type="button" class="btn btn-success btn-ripple" value="VIEW / EDIT"/>
											</td>
										</tr>
										<tr>
											<td>4</td>
											<td>Web Design</td>
											<td>1st Generation</td>
											<td>Sat-Sun</td>
											<td>8:00AM-11:00AM</td>
											<td>
												<input type="button" class="btn btn-success btn-ripple" value="VIEW / EDIT"/>
											</td>
										</tr>
										<tr>
											<td>5</td>
											<td>Spring Framework</td>
											<td>1st Generation</td>
											<td>Sat-Sun</td>
											<td>8:00AM-11:00AM</td>
											<td>
												<input type="button" class="btn btn-success btn-ripple" value="VIEW / EDIT"/>
											</td>
										</tr>
										<tr>
											<td>6</td>
											<td>Java EE</td>
											<td>1st Generation</td>
											<td>Sat-Sun</td>
											<td>8:00AM-11:00AM</td>
											<td>
												<input type="button" class="btn btn-success btn-ripple" value="VIEW / EDIT"/>
											</td>
										</tr>
										<tr>
											<td>7</td>
											<td>Oracle</td>
											<td>1st Generation</td>
											<td>Sat-Sun</td>
											<td>8:00AM-11:00AM</td>
											<td>
												<input type="button" class="btn btn-success btn-ripple" value="VIEW / EDIT"/>
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
										<option value="1">15</option>
										<option value="2">30</option>
										<option value="1">50</option>
										<option value="2">100</option>
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
		
		

	</div><!--.content-->
	
	

	<div class="layer-container">

		<!-- BEGIN MENU LAYER -->
		<div class="menu-layer">
			<ul>
				<li data-open-after="true">
					<a href="index.html">ASVA DASHBOARD</a>
				</li>
				<li>
					<a href="javascript:;">DASHBOARD</a>
				</li>
				<li>
					<a href="javascript:;">PRODUCT MANAGEMENT</a>
					<ul class="child-menu">
						<li><a href="ui-elements-general.html">ALL PRODUCTS</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:;">USER MANAGEMENT</a>
					<ul class="child-menu">
						<li><a href="ui-elements-general.html">ALL USERS</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:;">ADS MANAGEMENT</a>
					<ul class="child-menu">
						<li><a href="ui-elements-general.html">ALL ADS</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:;">SETTING</a>
					<ul class="child-menu">
						<li><a href="ui-elements-general.html">RPODUCT SETTING</a></li>
						<li><a href="ui-elements-general.html">USER SETTING</a></li>
						<li><a href="ui-elements-general.html">ADS SETTING</a></li>
					</ul>
				</li>
			</ul>
		</div><!--.menu-layer-->
		<!-- END OF MENU LAYER -->
		
	</div><!--.layer-container-->
	
	<!-- BEGIN ADD NEW COURSE MODAL -->
	<div class="modal fade full-height in" id="modalAddNewCourse" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">ADD NEW COURSE</h4>
				</div>
				<div class="modal-body">
					<div class="panel-body">
						<form action="#" class="form-horizontal">
							<div class="form-content">
								<div class="form-group">
									<label class="control-label col-md-3">Course Name</label>
									<div class="col-md-5">
										<div class="inputer">
											<div class="input-wrapper">
												<input type="text" name="" class="form-control">
											</div>
										</div>
									</div>
								</div><!--.form-group-->
								
								<div class="form-group">
									<label class="control-label col-md-3">Generation</label>
									<div class="col-md-5">
										<select class="selectpicker" style="display: none;">
											<option>Choose Generation</option>
											<option value="1">1st Generation</option>
											<option value="2">2nd Generation</option>
										</select>
									</div>
								</div><!--.form-group-->
								
								<div class="form-group">
									<label class="control-label col-md-3">Shift</label>
									<div class="col-md-5">
										<select class="selectpicker" style="display: none;">
											<option>Choose Shifts</option>
											<option value="1">Mon-Fri</option>
											<option value="2">Sat-Sun</option>
										</select>
									</div>
								</div><!--.form-group-->
								
								<div class="form-group">
									<label class="control-label col-md-3">Time</label>
									<div class="col-md-5">
										<select class="selectpicker" style="display: none;">
											<option>Choose Time</option>
											<option value="1">08:00AM-12:00AM</option>
											<option value="2">06:00PM-08:00PM</option>
										</select>
									</div>
								</div><!--.form-group-->

								<div class="form-group">
									<label class="control-label col-md-3">Status</label>
									<div class="col-md-5">
										<div class="radioer">
											<input type="radio" name="radioOption" id="radioColor1a" value="option1" checked="checked">
											<label for="radioColor1a">Active</label>
										</div>
										<div class="radioer">
											<input type="radio" name="radioOption" id="radioColor1b" value="option1">
											<label for="radioColor1b">Inactive</label>
										</div>
									</div>
								</div><!--.form-group-->

							</div><!--.form-content-->
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-flat btn-default btn-ripple" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-flat btn-primary btn-ripple">Save changes</button>
				</div>
			</div><!--.modal-content-->
		</div><!--.modal-dialog-->
	</div>
	<!-- END ADD NEW COURSE MODAL -->

	<!-- BEGIN GLOBAL AND THEME VENDORS -->
	<script src="${pageContext.request.contextPath}/resources/admin/assets/globals/js/global-vendors.js"></script>
	<!-- END GLOBAL AND THEME VENDORS -->

	<!-- PLEASURE -->
	<script src="${pageContext.request.contextPath}/resources/admin/assets/globals/js/pleasure.js"></script>
	<!-- ADMIN 1 -->
	<script src="${pageContext.request.contextPath}/resources/admin/assets/admin1/js/layout.js"></script>
	
	<!-- BEGIN INITIALIZATION-->
	<script>
	$(document).ready(function () {
		Pleasure.init();
		Layout.init();
	});
	</script>
	<!-- END INITIALIZATION-->
</body>
</html>