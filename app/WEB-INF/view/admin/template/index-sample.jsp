<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="../fragment/header-component.jsp">
		<jsp:param value="ASVA DASHBOARD" name="pageTitle"/>
		<jsp:param value="ASVA ADMIN" name="pageDescription"/>
		<jsp:param value="ASVA" name="author"/>
	</jsp:include>
	
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
		<jsp:include page="../fragment/navigation.jsp"></jsp:include>
	</div>

	<div class="content">
	
		<!--BEGIN HEADER  -->
		<div class="page-header full-content">
			<jsp:include page="../fragment/header.jsp">
				<jsp:param value="DASHBOARD" name="pageName"/>
			</jsp:include>
		</div><!--.full-content  -->


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
	
	
	<!--MENU NAVIGATION  -->
	<div class="layer-container">
		<jsp:include page="../fragment/nav-menu.jsp"></jsp:include>
	</div><!--.layer-container-->
	
	<!--FOOTER COMPONENTS  -->
	<jsp:include page="../fragment/footer-component.jsp"></jsp:include>

</body>
</html>