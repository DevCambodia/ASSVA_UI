<div class="brand-logo wow bounceInUp animated" ng-app="asva" ng-controller="adsCtrl">
	<div class="container">
		<div class="new_title center">
			<h2>Advertise</h2>
		</div>
		<div class="slider-items-products">
			<div id="brand-logo-slider" class="product-flexslider hidden-buttons">
				<div class="slider-items slider-width-col6">

					<!-- Item -->
					<div class="item" ng-repeat="ad in ads | filter:{'STATUS': 1} | orderBy:ORDER"
					ng-show="ad.ADS_DETAIL.LOCATION=='bottom_small'">
						<a href="{{ad.LINK}}" target="_news"><img width="{{ad.WIDTH}}" height="{{ad.HEIGHT}}"
							ng-src="{{api_url}}{{ad.IMAGE}}"
							alt="{{ad.NAME}}"></a>
					</div>
					<!-- End Item -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Latest Blog -->
<section class="latest-blog wow bounceInUp animated" ng-app="asva" ng-controller="adsCtrl">
	<div class="container">
		<div class="new_title center">
			<h2>Advertise</h2>
		</div>
		<!-- <div class="row">
			<div class="col-lg-4 col-md-4 col-xs-12 col-sm-4" ng-repeat="ad in ads | filter:{'STATUS': 1} | orderBy:ORDER"
					ng-show="ad.ADS_DETAIL.LOCATION=='bottom_big'">
				<div class="blog_inner">
					<div class="blog-img">
						<img width="{{ad.WIDTH}}" height="{{ad.HEIGHT}}"
							src="{{ad.IMAGE}}"
							alt="{{ad.NAME}}">
						<div class="mask">
							<a class="info" href="{{ad.LINK}}">View</a>
						</div>
					</div>
				</div>
			</div>
		</div> -->
		<div class="row">
			<div class="col-lg-{{ad.ADS_DETAIL.TYPE}} col-md-{{ad.ADS_DETAIL.TYPE}} col-xs-{{ad.ADS_DETAIL.TYPE}} col-sm-{{ad.ADS_DETAIL.TYPE}}" ng-repeat="ad in ads | filter:{'STATUS': 1} | orderBy:ADS_DETAIL.TYPE"
					ng-show="ad.ADS_DETAIL.LOCATION=='bottom_{{ad.ADS_DETAIL.TYPE}}'">
				<!-- <div class="blog_inner"> -->
					<div class="blog-img">
						<img width="{{ad.WIDTH}}" height="{{ad.HEIGHT}}"
							ng-src="{{api_url}}{{ad.IMAGE}}"
							alt="{{ad.NAME}}">
						<div class="mask">
							<a class="info" href="{{ad.LINK}}">View</a>
						</div>
					</div>
				<!-- </div> -->
			</div>
		</div>
	</div>
</section>
<!-- End Latest Blog -->
<!-- <div class="header-banner mobile-show">
	<div class="our-features-box">
		<ul>
			<li>
				<div class="feature-box">
					<div class="icon-truck"></div>
					<div class="content">FREE SHIPPING on order over $99</div>
				</div>
			</li>
		</ul>
	</div>
</div> -->