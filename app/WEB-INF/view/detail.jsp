<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from htmldemo.magikthemes.com/ecommerce/fabia-html-template/lavender/product_detail.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 14 Jul 2016 01:03:58 GMT -->
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
<style type="text/css">
#prev-img{
	width: 469px !important;
	height: 416px !important;
}

.flexslider{
	padding: 0px !important; 
}

.item-img {
	width: 80px !important;
	height: 80px !important;
}
</style>
<title>ASSVA</title>

<!-- Mobile Specific -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- import css and script -->
<%@ include file="include/header_script_css.jsp"%>
<body ng-app="asva" ng-controller="mainCtrl"
	ng-init="loadItem(${param.id})">
	<div id="page">
		<!-- Header -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- end header -->

		<!-- top_advertise -->
		<jsp:include page="include/top_ads.jsp" />

		<!-- Navbar main categories -->
		<%-- <jsp:include page="include/nav_bar.jsp" /> --%>
		<!-- end nav -->

		<!-- Breadcrumbs End -->
		<!-- Main Container -->
		<section class="main-container col1-layout wow bounceInUp animated">
			<div class="main container">
				<div class="col-main">
					<div class="row">
						<div class="product-view">
							<div class="product-next-prev">
								<a class="product-next" href="#"><span></span></a> <a
									class="product-prev" href="#"><span></span></a>
							</div>
							<div class="product-essential">
								<form action="#" method="post" id="product_addtocart_form">
									<input name="form_key" value="6UbXroakyQlbfQzK" type="hidden">
									<div class="product-img-box col-sm-5 col-xs-12">
										<div class="new-label new-top-left">New</div>
										<div class="product-image">
											<div class="large-image">
												<a id="item-url" href="{{getThumbnail(item.ITEM_IMAGE, 0)}}"
													class="cloud-zoom" id="zoom1"
													rel="useWrapper: false, adjustY:0, adjustX:20"> <img id="prev-img"
													src="{{getThumbnail(item.ITEM_IMAGE, 0)}}"
													class="img-thumbnail" alt="">
												</a>
											</div>
											<div class="flexslider flexslider-thumb">
												<ul class="previews-list slides">
													<li ng-repeat="i in IMAGE" ng-show="i.PATH!=0"><a class='cloud-zoom-gallery'
														rel="useZoom: 'zoom1', smallImage: '{{i.PATH}}' "><img
															src="{{i.PATH}}" ng-click="setPrevImg(i.PATH)"
															class="item-img" alt="Thumbnail 1" /></a></li>
															
													<!-- <li><a class='cloud-zoom-gallery'
														rel="useZoom: 'zoom1', smallImage: '{{getThumbnail(item.ITEM_IMAGE,0)}}' "><img
															src="{{getThumbnail(item.ITEM_IMAGE,0)}}" ng-click="setPrevImg(getThumbnail(item.ITEM_IMAGE,0))"
															class="item-img" alt="Thumbnail 1" /></a></li>
													<li><a rel="useZoom: 'zoom1', smallImage: '{{getThumbnail(item.ITEM_IMAGE,1)}}' "><img
															src="{{getThumbnail(item.ITEM_IMAGE,1)}}" ng-click="setPrevImg(getThumbnail(item.ITEM_IMAGE,1))"
															class="item-img" alt="Thumbnail 1" /></a></li>
													<li><a class='cloud-zoom-gallery'
														rel="useZoom: 'zoom1', smallImage: '{{getThumbnail(item.ITEM_IMAGE,2)}}' "><img
															src="{{getThumbnail(item.ITEM_IMAGE,2)}}" ng-click="setPrevImg(getThumbnail(item.ITEM_IMAGE,2))"
															class="item-img" alt="Thumbnail 2" /></a></li>
													<li><a class='cloud-zoom-gallery'
														rel="useZoom: 'zoom1', smallImage: '{{getThumbnail(item.ITEM_IMAGE,3)}}' "><img
															src="{{getThumbnail(item.ITEM_IMAGE,3)}}" ng-click="setPrevImg(getThumbnail(item.ITEM_IMAGE,3))"
															class="item-img" alt="Thumbnail 1" /></a></li>
													<li><a class='cloud-zoom-gallery'
														rel="useZoom: 'zoom1', smallImage: '{{getThumbnail(item.ITEM_IMAGE,4)}}' "><img
															src="{{getThumbnail(item.ITEM_IMAGE,4)}}" ng-click="setPrevImg(getThumbnail(item.ITEM_IMAGE,4))"
															class="item-img" alt="Thumbnail 2" /></a></li> -->
												</ul>
											</div>
										</div>
										<!-- end: more-images -->
									</div>
									<div class="product-shop col-sm-7 col-xs-12">
										<div class="product-name">
											<h1 ng-bind="splitRec(item.ITEM_NAME, 0)"></h1>
										</div>

										<!-- <div class="ratings">
											<div class="rating-box">
												<div class="rating"></div>
											</div>
											<p class="rating-links">
												<a href="#">1 Review(s)</a> <span class="separator">|</span>
												<a href="#">Add Your Review</a>
											</p>
										</div> -->

										<div class="price-block">
											<div class="price-box">
												<p class="special-price">
													<span class="price-label">Special Price</span> <span
														id="product-price-48" class="price">$
														{{item.ITEM_PRICE}}</span>
												</p>
												<!-- <p class="old-price">
													<span class="price-label">Regular Price:</span> <span
														class="price"> $315.99 </span>
												</p> -->



												<p class="item_status pull-right">
													<span class="label label-success"
														ng-show="item.ITEM_IS_SOLD==false">Available</span> <span
														class="label label-success"
														ng-show="item.ITEM_IS_SOLD==true">Sold</span>
												</p>
											</div>
										</div>

										<div class="short-description">
											<h2>Product Category</h2>
											<p ng-bind="item.ITEM_CATEGORY.CATEGORY_NAME"></p>
										</div>

										<!-- Description -->
										<div class="short-description">
											<h2>Description</h2>
											<p ng-bind-html="item.ITEM_DESCRIPTION | to_trusted"></p>
										</div>



										<div class="add-to-box">
											<!-- <div class="add-to-cart">
												<div class="pull-left">
													<div class="custom pull-left">
														<button
															onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 0 ) result.value--;return false;"
															class="reduced items-count" type="button">
															<i class="icon-minus">&nbsp;</i>
														</button>
														<input type="text" class="input-text qty" title="Qty"
															value="1" maxlength="12" id="qty" name="qty">
														<button
															onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;"
															class="increase items-count" type="button">
															<i class="icon-plus">&nbsp;</i>
														</button>
													</div>
												</div>

												<button onClick="productAddToCartForm.submit(this)"
													class="button btn-cart" title="Add to Cart" type="button">
													<span><i class="icon-basket"></i> Add to Cart</span>
												</button>

											</div> -->
											<div class="email-addto-box">
												<!-- <p class="email-friend">
													<a href="#" class=""><span ng-bind="item.ITEM_USER.USER_EMAIL"></span></a>
												</p> -->
												<p class="user_detail">
													<span class="glyphicon glyphicon-user"></span> &nbsp; <span
														ng-bind="item.ITEM_USER.USER_FIRST_NAME"></span> <span
														ng-bind="item.ITEM_USER.USER_LAST_NAME"></span>
												</p>

												<p class="user_detail">
													<span class="glyphicon glyphicon-envelope"></span> &nbsp; <span
														ng-bind="item.ITEM_USER.USER_EMAIL"></span>
												</p>
												<p class="user_detail">
													<span class="glyphicon glyphicon-earphone"></span> &nbsp; <span
														ng-bind="splitRec(item.ITEM_NAME, 1)"></span>
												</p>
												<p class="user_detail">
													<span class="glyphicon glyphicon-calendar"></span> &nbsp; <span
														ng-bind="item.ITEM_PUBLISH_DATE"
														datetime="yyyy-MM-dd HH:mm:ss"></span>
												</p>
												<!-- <ul class="add-to-links">
													<li><a class="" href="#"><span class="glyphicon glyphicon-phone"></span><span ng-bind="item.ITEM_USER.USER_TELEPHONE"></span></a></li>
													<li><span class="separator">|</span> <a
														class="link-compare" href="#"><span>Add to
																Compare</span></a></li>
												</ul> -->
											</div>
										</div>

										<!-- <div class="social">
											<ul class="link">
												<li class="fb"><a href="#"></a></li>
												<li class="tw"><a href="#"></a></li>
												<li class="googleplus"><a href="#"></a></li>
												<li class="rss"><a href="#"></a></li>
												<li class="pintrest"><a href="#"></a></li>
												<li class="linkedin"><a href="#"></a></li>
												<li class="youtube"><a href="#"></a></li>
											</ul>
										</div> -->
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Related Product -->
		<section class="featured-pro container wow bounceInUp animated" ng-show="relatedItems.length>1">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading">{{item.ITEM_CATEGORY.CATEGORY_NAME}}</div>
					<div class="panel-body row v_item_container">
						<div class="new_title center">
							<h2>Related Products</h2>
						</div>

						<!-- start item -->
						<div class="panel panel-primary v_item col-sm-3"
							ng-repeat="i in relatedItems" ng-show="i.ID!=item.ID">
							<a href="${pageContext.request.contextPath}/detail/?id={{i.ID}}">
								<div>
									<span class="label_title">{{splitRec(i.ITEM_NAME, 0)}}</span> <span
										class="label_price">{{i.ITEM_PRICE}}</span>
								</div>
								<div class="panel-body">
									<img src="{{getThumbnail(i.ITEM_IMAGE, 0)}}"
										class="img-thumbnail" alt="Cinque Terre" />
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
											ng-bind="splitRec(i.ITEM_NAME, 1)"></span>
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
								ng-class="($index+1)==page?'active':''" ng-if="$index<totalPage"
								ng-click="goToPage($index+1)"><a href>{{$index+1}}</a></li>
						</ul>
					</div>
				</div>
			</div>
	</div>
	</section>

	<!-- bottom ads -->
	<jsp:include page="include/bottom_ads.jsp" />


	<!-- Footer -->
	<jsp:include page="include/footer.jsp" />
	<!-- End Footer -->

	<!-- JavaScript -->
	<%@ include file="include/footer_script.jsp"%>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/angular/detail.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/angular/ads.js"></script>
</body>

<!-- Mirrored from htmldemo.magikthemes.com/ecommerce/fabia-html-template/lavender/product_detail.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 14 Jul 2016 01:04:59 GMT -->
</html>