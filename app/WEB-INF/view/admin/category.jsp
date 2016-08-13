<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="asva" ng-controller="mainCtrl">
<head>

<jsp:include page="fragment/header-component.jsp">
	<jsp:param value="ASVA CATEGORY" name="pageTitle" />
	<jsp:param value="ASVA ADMIN" name="pageDescription" />
	<jsp:param value="ASVA" name="author" />
</jsp:include>

<style>
td:first-child, th:first-child, th:nth-child(4), td:nth-child(4), th:nth-child(5),
	td:nth-child(5), th:last-child, td:last-child {
	text-align: center
}
</style>
</head>
<body>

	<div class="nav-bar-container">
		<jsp:include page="fragment/navigation.jsp"></jsp:include>
	</div>

	<div class="content">

		<!--BEGIN HEADER  -->
		<div class="page-header full-content">
			<jsp:include page="fragment/header.jsp">
				<jsp:param value="CATEGORY MANAGEMENT" name="pageName" />
			</jsp:include>
		</div>
		<!--.full-content  -->

		<!--BEGIN BUTTON ADD  -->
		<div class="btn-add-fixed" style="margin-bottom: 10px;">
			<a data-target="#addUserModal" data-toggle="modal"
				ng-click="clearForm()" class="btn btn-indigo btn-ripple"><i
				class="ion-android-add"></i></a>
		</div>

		<div class="display-animation">
			<div class="row">
				<div class="col-md-12">
					<div class="panel indigo">
						<div class="panel-heading">
							<div class="panel-title">
								<h4>MAIN CATEGORIES</h4>

							</div>
							<!--.panel-title  -->
						</div>
						<!--.panel-heading-->
						<div class="panel-body">
							<div class="row" id="ACTION">
								<div class="col-md-6">
									<!-- Status -->
									<select ng-model="state"">
										<!-- <option ng-repeat="s in status" ng-value="c.value"
											ng-bind="s.name"></option> -->
										<option ng-value="1" ng-selected="true">Active</option>
										<option ng-value="0">Inactive</option>
									</select>
								</div>
								<div class="col-md-6">
									<div class="inputer">
										<div class="input-wrapper">
											<input type="text" class="form-control" ng-model="searchMain"
												placeholder="Search main category here...">
										</div>
									</div>
								</div>
							</div>
							<div class="flip-scroll">
								<table
									class="table table-bordered table-striped table-condensed cf">
									<thead class="cf">
										<tr>
											<th>#</th>
											<th>CATEGORY NAME</th>
											<th>CATEGORY TYPE</th>
											<th>CATEGORY STATUS</th>
											<th>ACTION</th>
										</tr>
									</thead>
									<tbody>
										<!-- MAIN CATEGORY -->
										<tr
											ng-repeat="c in cat | filter:{'MAIN_CATEGORY': null, 'CATEGORY_STATUS': state, 'CATEGORY_NAME': searchMain}"
											ng-model="c">
											<td>00{{$index}}</td>
											<td>{{c.CATEGORY_NAME}}</td>
											<td><span ng-show="c.MAIN_CATEGORY==null">MAIN
													CATEGORY</span> <span ng-show="c.MAIN_CATEGORY!=null">SUB
													CATEGORY</span></td>
											<td>
												<!-- <div class="switcher switcher-indigo form-inline">
													<input id="status_{{c.ID}}" type="checkbox" hidden="hidden"
														ng-checked="c.CATEGORY_STATUS==1"
														ng-click="changeStatus(c)"> <label
														for="status_{{c.ID}}"></label>
												</div> -->
												<div class="form-inline">
													<!-- <input id="status_{{c.ID}}" type="checkbox" hidden="hidden"
														ng-checked="c.CATEGORY_STATUS==1"
														ng-click="changeStatus(c)"> <label
														for="status_{{c.ID}}"></label> -->

													<button type="button" class="btn btn-warning"
														title="Change Category Status" ng-click="changeStatus(c)">
														<span ng-show="c.CATEGORY_STATUS==0"
															class="glyphicon glyphicon-eye-open"></span> <span
															ng-show="c.CATEGORY_STATUS==1"
															class="glyphicon glyphicon-eye-close"></span>
													</button>
												</div>
											</td>
											<td><a data-target="#addUserModal" data-toggle="modal"
												ng-click="edit(c)"
												class="btn btn-floating show-on-hover btn-ripple"><i
													class="glyphicon glyphicon-pencil"></i></a> <a
												class="btn btn-floating show-on-hover btn-ripple"
												ng-click="deleteCat(c.ID)"><i
													class="glyphicon glyphicon-trash"></i></a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--.panel-body-->
					</div>
					<!--.panel-->
				</div>
			</div>
			<!--.row-->

			<!-- sub category -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel indigo">
						<div class="panel-heading">
							<div class="panel-title">
								<h4>SUB CATEGORIES</h4>

							</div>
							<!--.panel-title  -->
						</div>
						<!--.panel-heading-->
						<div class="panel-body">
							<div class="row" id="ACTION">

								<div class="col-md-2">
									<label>Choose Main Category</label>
								</div>
								<div class="col-md-4">
									<!-- Main Category -->
									<select ng-model="mainCat" class="">
										<!-- <option value="" selected="selected">Choose Main Category</option> -->
										<option
											ng-repeat="c in cat | filter:{'MAIN_CATEGORY': null, 'CATEGORY_STATUS': 1}"
											ng-value="c.ID" ng-bind="c.CATEGORY_NAME"></option>
									</select>

									<!-- Status -->
									<select ng-model="subState"">
										<!-- <option ng-repeat="s in status" ng-value="c.value"
											ng-bind="s.name"></option> -->
										<option ng-value="1" ng-selected="true">Active</option>
										<option ng-value="0">Inactive</option>
									</select>
								</div>
								<div class="col-md-3">
									<div class="inputer">
										<div class="input-wrapper">
											<input type="text" class="form-control"
												placeholder="Search sub category here..."
												ng-model="searchSub">
										</div>
									</div>
								</div>
							</div>
							<div class="flip-scroll">
								<table
									class="table table-bordered table-striped table-condensed cf">
									<thead class="cf">
										<tr>
											<th>#</th>
											<th>CATEGORY NAME</th>
											<th>CATEGORY TYPE</th>
											<th>CATEGORY STATUS</th>
											<th>ACTION</th>
										</tr>
									</thead>
									<tbody>
										<!-- MAIN CATEGORY -->
										<tr
											ng-repeat="c in cat | filter:{'CATEGORY_STATUS': subState, 'CATEGORY_NAME': searchSub}"
											ng-model="sub" ng-show="c.MAIN_CATEGORY.ID==mainCat">
											<td>00{{$index}}</td>
											<td>{{c.CATEGORY_NAME}}</td>
											<td>
												<!-- <span ng-show="c.MAIN_CATEGORY==null">MAIN CATEGORY</span> -->
												<span>SUB CATEGORY</span>
											</td>
											<td>
												<!-- <div class="switcher switcher-indigo form-inline">
													<input id="status_{{c.ID}}" type="checkbox" hidden="hidden"
														ng-checked="c.CATEGORY_STATUS==1"
														ng-click="changeStatus(c)"> <label
														for="status_{{c.ID}}"></label>
												</div> -->
												<button type="button" class="btn btn-warning"
													title="Change Category Status" ng-click="changeStatus(c)">
													<span ng-show="c.CATEGORY_STATUS==0"
														class="glyphicon glyphicon-eye-open"></span> <span
														ng-show="c.CATEGORY_STATUS==1"
														class="glyphicon glyphicon-eye-close"></span>
												</button>
											</td>
											<td>
												<!-- edit --> <a data-target="#addUserModal"
												data-toggle="modal" ng-click="edit(c)"
												class="btn btn-floating show-on-hover btn-ripple"><i
													class="glyphicon glyphicon-pencil"></i></a> <!-- delete --> <a
												class="btn btn-floating show-on-hover btn-ripple"
												ng-click="deleteCat(c.ID)"><i
													class="glyphicon glyphicon-trash"></i></a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!--.flip-scroll-->
							<!-- <div class="row">
								<div class="col-md-6">
									<div id="INFORMATION">Showing {{paging.currentPage}} to
										{{paging.limit}} of {{paging.totalRecords}} entries</div>
									<select class="selectpicker" ng-change="rowChange(row)"
										ng-model="row">
										<option ng-repeat="row in rows" ng-value="row" ng-bind="row"></option>
									</select>
								</div>
								<div class="col-md-6">
									<div id="PAGINATION" class="pull-right"></div>
								</div>
							</div> -->

						</div>
						<!--.panel-body-->
					</div>
					<!--.panel-->
				</div>
			</div>
			<!--.row-->
		</div>
		<!--.display-animation-->


		<!--BEGIN ADD USER MODAL  -->
		<div class="modal scale fade" id="addUserModal" tabindex="-1"
			data-keyboard="false" data-backdrop="static" role="dialog"
			aria-hidden="true" style="display: none;">
			<form action="" name="addForm">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 ng-show="isEdit==false" class="modal-title">
								<i class="glyphicon glyphicon-th-large"></i> ADD CATEGORY
							</h4>
							<h4 ng-show="isEdit==true" class="modal-title">
								<i class="glyphicon glyphicon-th-large"></i> EDIT CATEGORY
							</h4>
							<hr>
						</div>
						<div class="modal-body">

							<div class="row">
								<div class="col-md-12" id="addStyle">
									<p>Choose Main Category:</p>
									<select ng-model="mainCatModel" class="">
										<option value=""></option>
										<option ng-repeat="c in cat | filter:{'MAIN_CATEGORY': null}"
											ng-value="c.ID" ng-show="c.CATEGORY_STATUS==1"
											ng-bind="c.CATEGORY_NAME"
											ng-selected="isEditMain==false && editObject.MAIN_CATEGORY.ID==c.ID"></option>
									</select>
								</div>
							</div>

							<div class="inputer floating-label">
								<div class="input-wrapper">
									<input type="text" class="form-control" id="name"
										ng-required="true" ng-model="catNameModel"
										placeholder="Category Name">
									<!-- <label for="lastname">Category Name</label> -->
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-flat btn-default btn-ripple"
								data-dismiss="modal" id="btnCancel" ng-click="clearForm()">CANCEL</button>
							<button type="button" ng-disabled="addForm.$invalid"
								ng-click="operation()" class="btn btn-primary">
								SAVE<span class="ripple_3 animate"
									style="height: 96px; width: 96px; top: -28px; left: 20.9844px;"></span><span
									class=""
									style="height: 96px; width: 96px; top: -32px; left: 35.9844px;"></span>
							</button>
							<!-- <button type="button"
								class="btn btn-primary button-striped button-full-striped btn-ripple"
								data-dismiss="modal">
								SAVE<span class="ripple _3 animate" ng-disabled="true"
									style="height: 96px; width: 96px; top: -28px; left: 20.9844px;"></span><span
									class="ripple _4 animate"
									style="height: 96px; width: 96px; top: -32px; left: 35.9844px;"></span>
							</button> -->
						</div>
					</div>
					<!--.modal-content-->
				</div>
				<!--.modal-dialog-->
			</form>
		</div>
		<!--END ADD USER MODAL  -->

		<!--BEGIN ALERT DIALOG  -->
		<button ​ style="display: none" id="success-alert"
			data-toastr-notification="USER HAS BEEN SAVE SUCCESSFULLY!"
			class="btn btn-default toastr-notify btn-ripple"
			data-toastr-close-others="true"
			data-toastr-position="toast-top-full-width"
			data-toastr-type="success">
			Success<span class="ripple _30 animate"
				style="height: 148px; width: 148px; top: -56px; left: -2px;"></span><span
				class="ripple _31 animate"
				style="height: 148px; width: 148px; top: -46px; left: -16px;"></span><span
				class="ripple _32 animate"
				style="height: 148px; width: 148px; top: -58px; left: -19px;"></span><span
				class="ripple _34 animate"
				style="height: 148px; width: 148px; top: -58px; left: -44px;"></span>
		</button>

	</div>
	<!--.content-->


	<!--MENU NAVIGATION  -->
	<div class="layer-container">
		<jsp:include page="fragment/nav-menu.jsp"></jsp:include>
	</div>
	<!--.layer-container-->

	<!--FOOTER COMPONENTS  -->
	<jsp:include page="fragment/footer-component.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath }/resources/admin/angular/category.js"></script>

</body>
</html>