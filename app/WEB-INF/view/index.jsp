<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from htmldemo.magikthemes.com/ecommerce/fabia-html-template/lavender/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 14 Jul 2016 01:01:46 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<meta charset="utf-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons Icon -->
<link rel="icon"
	href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico"
	type="image/x-icon" />
<link rel="shortcut icon"
	href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico"
	type="image/x-icon" />
<title>ASSVA</title>

<!-- Mobile Specific -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- import css and script -->
<%@ include file="include/header_script_css.jsp"%>

</head>

<body class="cms-index-index cms-home-page" ng-app="asva"
	ng-controller="mainCtrl">
	<div id="page">

		<!-- top_advertise -->
		<jsp:include page="include/left_right_ads.jsp" />

		<!-- Header -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- end header -->

		<!-- banner -->
		<jsp:include page="include/top_ads.jsp" />
		<!-- end banner -->

		<!-- Navbar main categories -->
		<jsp:include page="include/nav_bar.jsp" />
		<!-- end nav -->		

		<!-- Show Item in each categories for home page just load -->
		<section class="featured-pro container wow bounceInUp animated product-box">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">{{subName}}</div>
					<div class="panel-body row v_item_container">
						<div class="new_title center">
							<h2>{{subName}}</h2>
						</div>
						<!-- item -->
						<div class="panel panel-primary v_item col-sm-3"
							ng-repeat="i in items | filter:{'ITEM_NAME': search_box}"
							ng-if="i.ITEM_STATUS==1 && i.ITEM_CATEGORY.CATEGORY_STATUS==1">
							<a href="${pageContext.request.contextPath}/detail/?id={{i.ID}}">
								<div>
									<span class="label_title" ng-bind="subDesc(splitRec(i.ITEM_NAME,0))"></span>
									<span class="label_price">{{i.ITEM_PRICE}}</span>
								</div>
								<div class="panel-body">
									<img src="{{getThumbnail(i.ITEM_IMAGE)}}" class="img-thumbnail" />
									<!-- item_status -->
									<p class="item_status">
										<span class="label label-danger"
											ng-show="i.ITEM_IS_SOLD==true">Sold</span>
									</p>
									<p class="item_status">
										<span class="label label-success"
											ng-show="i.ITEM_IS_SOLD==false">Available</span>
									</p>

									<!-- Description -->
									<!-- <p class="user_detail center">
										<span ng-bind="subDesc(i.ITEM_DESCRIPTION)"></span>
									</p> -->
									<p class="user_detail center">
										<span class="glyphicon glyphicon-earphone"></span> &nbsp; <span
											ng-bind="splitRec(i.ITEM_NAME,1)"></span>
									</p>
									<p class="user_detail center">
										<span class="glyphicon glyphicon-calendar"></span> &nbsp; <span
											ng-bind="i.ITEM_PUBLISH_DATE" datetime="yyyy-MM-dd HH:mm:ss"></span>
									</p>
								</div>
						</div>
						</a>
					</div>
					<!-- end item -->
					<!-- Panel Footer -->
					<div class="panel-footer" style="text-align: center;">
						<ul class="pagination">
							<li ng-repeat="i in totalItems track by $index"
								ng-if="$index<totalPage" ng-class="($index+1)==page?'active':''"
								ng-click="goToPage($index+1)"><a href>{{$index+1}}</a></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<!-- </div> -->

		
	
		<!-- bottom ads -->
		<jsp:include page="include/bottom_ads.jsp" />

		<!-- Footer -->
		<jsp:include page="include/footer.jsp" />
		<!-- End Footer -->

		<!-- JavaScript -->
		<%@ include file="include/footer_script.jsp"%>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/angular/index.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/angular/ads.js"></script>
</body>
</html>
