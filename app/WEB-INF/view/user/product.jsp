<!DOCTYPE html>
<html ng-app="asva" ng-controller="mainCtrl">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>User Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<jsp:include page="../include/LTE/top_style.jsp" />
<style type="text/css">
.file-chooser {
	display: none !important;
}

.item-img {
	width: 130px;
	height: 130px;
}
</style>
<!-- <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script>
	tinymce.init({
		selector : '#proDescModel',
		menubar : false,
		plugin : 'a_tinymce_plugin',
		a_plugin_option : true,
		a_configuration_option : 400,
		theme: 'modern',
	});
</script> -->
<script src="//cdn.ckeditor.com/4.5.10/standard/ckeditor.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<jsp:include page="../include/LTE/main_header.jsp" />

		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="../include/LTE/sidebar.jsp" />

		<!-- Content Wrapper. Contains page content -->
		
		<input type="hidden" id="context-path" value="${pageContext.request.contextPath}">
		
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Products
					<!-- <small>Version 2.0</small> -->
				</h1>
			</section>

			<!-- Main content -->
			<section class="content">

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<!-- <h3 class="box-title"></h3>

								<div class="box-tools">
									<div class="input-group input-group-sm" style="width: 150px;">
										<input type="text" name="table_search"
											class="form-control pull-right" placeholder="Search">

										<div class="input-group-btn">
											<button type="submit" class="btn btn-default">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div> -->

								<!-- Limit -->
								<div class="row">
									<div class="col-sm-1">
										<div class="dataTables_length" id="example1_length">
											<select name="example1_length" ng-model="lim"
												ng-change="limitClick(lim)" aria-controls="example1"
												class="form-control input-sm">
												<option value="10" ng-selected="true">10</option>
												<option value="25">25</option>
												<option value="50">50</option>
												<option value="100">100</option>
											</select>
										</div>
									</div>
									<!-- Category -->
									<div class="col-sm-2">
										<div class="dataTables_length" id="example1_length">
											<select ng-model="catFilter" aria-controls="example1"
												ng-change="mainChange(catFilter)"
												class="form-control input-sm">
												<option ng-selected="true" value="">All</option>
												<option
													ng-repeat="c in cats | filter:{'MAIN_CATEGORY': null, 'CATEGORY_STATUS': 1}"
													ng-value="c.ID" ng-bind="c.CATEGORY_NAME"></option>
											</select>
										</div>
									</div>
									<!-- sub category -->
									<div class="col-sm-2" ng-show="showSub">
										<div class="dataTables_length">
											<select ng-model="subFilter" aria-controls="example1"
												class="form-control input-sm">
												<option ng-repeat="c in cats"
													ng-if="c.MAIN_CATEGORY.ID==catFilter" ng-value="c.ID"
													ng-bind="c.CATEGORY_NAME"></option>
											</select>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="input-group input-group-sm" style="width: 150px;">
											<input type="text" name="table_search" ng-model="s"
												ng-change="searchItem(s)" class="form-control pull-right"
												placeholder="Search">

											<div class="input-group-btn">
												<button type="button" class="btn btn-default">
													<i class="fa fa-search"></i>
												</button>
											</div>
										</div>
									</div>
									<!-- btn add -->
									<div class="col-sm-1">
										<div class="input-group input-group-sm" style="width: 150px;">

											<button type="button" class="btn btn-block btn-primary"
												data-toggle="modal" data-target="#myModal">
												<span class="glyphicon glyphicon-plus"></span>
											</button>

										</div>
									</div>
								</div>
							</div>

							<div class="box-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Item</th>
											<th>Price</th>
											<th>Telephone</th>
											<th>Date</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="i in items" ng-show="i.ITEM_STATUS!=3"
											ng-if="i.ITEM_CATEGORY.ID==subFilter || all==true && i.ITEM_CATEGORY.CATEGORY_STATUS==1">
											<td>{{splitRec(i.ITEM_NAME,0)}}</td>
											<td>{{i.ITEM_PRICE}}</td>
											<td>{{splitRec(i.ITEM_NAME,1)}}</td>
											<td>{{i.ITEM_PUBLISH_DATE}}</td>
											<td style="text-align: center;"><span
												ng-show="i.ITEM_IS_SOLD==false" class="label label-success">Available</span>
												<span ng-show="i.ITEM_IS_SOLD==true"
												class="label label-danger">Sold</span> <span
												ng-show="i.ITEM_STATUS==0" class="label label-warning">Hidden</span>
											</td>
											<td style="text-align: center;">
												<div class="btn-group">
													<!-- Change Product Status -->
													<button type="button" class="btn btn-warning"
														title="Change product to show or hide."
														ng-click="changeState(i)">
														<span ng-show="i.ITEM_STATUS==0"
															class="glyphicon glyphicon-eye-open"></span> <span
															ng-show="i.ITEM_STATUS==1"
															class="glyphicon glyphicon-eye-close"></span>
													</button>
													<!-- Change Product to Sold -->
													<button type="button" class="btn btn-info"
														ng-click="updateProSold(i)"
														title="Change product to sold or not.">
														<span ng-show="i.ITEM_IS_SOLD==true"
															class="glyphicon glyphicon-ok-circle"></span> <span
															ng-show="i.ITEM_IS_SOLD==false"
															class="glyphicon glyphicon-remove-circle"></span>
													</button>
													<!-- Edit Product -->
													<button type="button" class="btn btn-success"
														ng-click="edit(i)" title="Update product information."
														data-toggle="modal" data-target="#myModal">
														<span class="glyphicon glyphicon-pencil"></span>
													</button>
													<!-- Delete Product -->
													<button type="button" class="btn btn-danger"
														ng-click="deletePro(i)" title="Delete product">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.box-b						
	
							<!-- Panel Footer -->
							<div class="panel-footer" style="text-align: center;">
								<ul class="pagination">
									<li ng-repeat="i in totalItems track by $index"
										ng-if="$index<totalPage"
										ng-class="($index+1)==page?'active':''"
										ng-click="goToPage($index+1)"><a href>{{$index+1}}</a></li>
								</ul>
							</div>
						</div>
						<!-- /.box -->
					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<form class="modal fade" id="myModal" data-keyboard="false"
			name="proForm" data-backdrop="static">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							ng-click="clearForm()" aria-label="Close">
							<span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
						</button>
						<h4 class="modal-title">
							<span ng-show="isEdit==false">Add Product</span> <span
								ng-show="isEdit==true">Update Product</span>
						</h4>
					</div>
					<div class="modal-body">
						<div class="box-body">
							<div class="form-group">
								<label for="catModel">Category</label> <select
									class="form-control input-sm" ng-model="catModel" id="catModel">
									<option value="">-- Select Category --</option>
									<option ng-repeat="c in cats"
										ng-if="c.MAIN_CATEGORY!=null && c.CATEGORY_STATUS==1"
										ng-value="c.ID" ng-bind="c.CATEGORY_NAME"
										ng-selected="editObject.ITEM_CATEGORY.ID==c.ID"></option>
								</select>
							</div>
							<div class="form-group">
								<label for="proNameModel">Name</label> <input type="text"
									class="form-control" id="proNameModel" ng-model="proNameModel"
									ng-required="true" placeholder="Enter product name">
								<p ng-show="proForm.proNameModel.$error.required">Product
									name is required.</p>
							</div>
							<div class="form-group">
								<label id="proDescModels">Description</label>
								<textarea type="text" class="form-control" id="proDescModel"
									name="proDescModel" ng-model="proDescModel"
									placeholder="Product Description"></textarea>
							</div>
							<div class="form-group">
								<label for="proPriceModel">Price</label> <input type="text"
									ng-required="true" class="form-control"
									id="proPriceModel" ng-model="proPriceModel"
									placeholder="Price ($)">
								<p ng-show="proForm.proPriceModel.$error.required">Product
									price is required.</p>
							</div>
							<div class="form-group">
								<label for="proTelModel">Telephone</label> <input type="text"
									class="form-control" id="proTelModel" ng-model="proTelModel"
									ng-required="true" placeholder="Enter telephone">
							</div>
							<div class="form-group">
								<label>Product Image</label> <input type="file"
									id="proImageModel0" class="file-chooser">
								<!-- <p class="help-block">Please choose thumbnail of product.</p> -->
							</div>
							<!-- image display -->
							<div class="form-group">
								<div class="row">
									<div class="col-sm-4"></div>
									<div class="col-sm-4">
										<img style="min-width: 200px; min-height: 200px;" width="200"
											height="200" class="img-thumbnail" id="proImg0"
											src="${pageContext.request.contextPath}/resources/images/thumbnail-default.jpg"
											ng-click="browseImage(0)" />
									</div>
									<div class="col-sm-4"></div>
								</div>

							</div>

							<!-- item image  -->
							<div class="form-group">

								<input type="file" id="proImageModel1" class="file-chooser">
								<input type="file" id="proImageModel2" class="file-chooser">
								<input type="file" id="proImageModel3" class="file-chooser">
								<input type="file" id="proImageModel4" class="file-chooser">
								<div class="row">
									<div class="col-sm-3">
										<img height="200" class="form-control img-thumbnail item-img"
											id="proImg1" ng-click="browseImage(1)"
											src="${pageContext.request.contextPath}/resources/images/thumbnail-default.jpg" />
									</div>
									<div class="col-sm-3">
										<img height="200" class="form-control img-thumbnail item-img"
											id="proImg2" ng-click="browseImage(2)"
											src="${pageContext.request.contextPath}/resources/images/thumbnail-default.jpg" />
									</div>
									<div class="col-sm-3">
										<img height="200"
											class="col-sm-3 form-control img-thumbnail item-img"
											id="proImg3" ng-click="browseImage(3)"
											src="${pageContext.request.contextPath}/resources/images/thumbnail-default.jpg" />
									</div>
									<div class="col-sm-3">
										<img height="200"
											class="col-sm-3 form-control img-thumbnail item-img"
											id="proImg4" ng-click="browseImage(4)"
											src="${pageContext.request.contextPath}/resources/images/thumbnail-default.jpg" />
									</div>
								</div>

							</div>
							<!-- <div class="form-group">
								<label for="proImages">Product Images</label> 
								<input type="file"
									id="proImages" multiple="multiple">
								<p class="help-block">Please choose image of product.</p>
							</div> -->

							<!-- <div class="form-group">
								<label for="proImage">Image From URL</label> <input type="text"
									class="form-control" ng-model="proImage" id="proImage"
									placeholder="Image Url..." ng-change="setImage()">

							</div> -->

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left"
							data-dismiss="modal" id="btnClose">Close</button>
						<button type="button" class="btn btn-primary"
							ng-click="operation()" ng-disabled="proForm.$invalid">Save</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</form>

		<!-- Footer -->
		<jsp:include page="../include/LTE/footer.jsp" />

		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->


	<!-- Script -->
	<jsp:include page="../include/LTE/bottom_script.jsp" />
	
	<script>
		//CKEDITOR.replace('proDescModel');
		CKEDITOR.replace('proDescModel');
		
	</script>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/LTE/angular/product.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/LTE/angular/user.js"></script>
</body>
</html>
