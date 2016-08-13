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
<jsp:include page="../include/LTE/top_style.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<jsp:include page="../include/LTE/main_header.jsp"/>
		
		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="../include/LTE/sidebar.jsp"/>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					User Dashboard
					<!-- <small>Version 2.0</small> -->
				</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<!-- <div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-aqua"><i
								class="ion ion-ios-gear-outline"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">CPU Traffic</span> <span
									class="info-box-number">90<small>%</small></span>
							</div>
							/.info-box-content
						</div>
						/.info-box
					</div>
					/.col
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-red"><i
								class="fa fa-google-plus"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Likes</span> <span
									class="info-box-number">41,410</span>
							</div>
							/.info-box-content
						</div>
						/.info-box
					</div>
					/.col

					fix for small devices only
					<div class="clearfix visible-sm-block"></div>

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-green"><i
								class="ion ion-ios-cart-outline"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Sales</span> <span
									class="info-box-number">760</span>
							</div>
							/.info-box-content
						</div>
						/.info-box
					</div>
					/.col
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-yellow"><i
								class="ion ion-ios-people-outline"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">New Members</span> <span
									class="info-box-number">2,000</span>
							</div>
							/.info-box-content
						</div>
						/.info-box
					</div>
					/.col
				</div> -->
				<!-- /.row -->

				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<div class="col-md-8">
						<!-- TABLE: LATEST ORDERS -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Latest Sold</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin">
										<thead>
											<tr>
												<th>Item</th>
												<th>Description</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="i in items | filter:{'ITEM_IS_SOLD': true}">
												<td ng-bind="splitRec(i.ITEM_NAME, 0)"></td>
												<td>
													<div class="sparkbar" data-color="#f39c12" data-height="20" ng-bind="i.ITEM_DESCRIPTION"></div>
												</td>
												<td><span class="label label-success">$ {{i.ITEM_PRICE}}</span></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.box-body -->
							<!-- <div class="box-footer clearfix">
								<a href="javascript:void(0)"
									class="btn btn-sm btn-info btn-flat pull-left">Place New
									Order</a> <a href="javascript:void(0)"
									class="btn btn-sm btn-default btn-flat pull-right">View All
									Sold Histories</a>
							</div> -->
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->

					<div class="col-md-4">

						<!-- PRODUCT LIST -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Recently Added Products</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<ul class="products-list product-list-in-box">
									<li class="item" ng-repeat="i in items | limitTo: 5" ng-if="i.ITEM_CATEGORY.CATEGORY_STATUS==1">
										<div class="product-img">
											<img src="{{getThumbnail(i.ITEM_IMAGE, 0)}}" alt="Product Image">
										</div>
										<div class="product-info">
											<a href="javascript:void(0)" class="product-title">{{splitRec(i.ITEM_NAME, 0)}}<span class="label label-warning pull-right">$ {{i.ITEM_PRICE}}</span>
											</a> <span class="product-description" ng-bind="subDesc(i.ITEM_DESCRIPTION)"></span>
										</div>
									</li>
								</ul>
							</div>
							<!-- /.box-body -->
							<!-- <div class="box-footer text-center">
								<a href="javascript:void(0)" class="uppercase">View All
									Products</a>
							</div> -->
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Footer -->
		<jsp:include page="../include/LTE/footer.jsp"/>

		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->

	<!-- Script -->
	<jsp:include page="../include/LTE/bottom_script.jsp"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/LTE/angular/dashboard.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/LTE/angular/user.js"></script>
</body>
</html>
