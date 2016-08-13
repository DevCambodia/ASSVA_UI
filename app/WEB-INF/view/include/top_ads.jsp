<div class="top-banner-section" ng-app="asva" ng-controller="adsCtrl">
	<div class="container">
		<!-- top split -->
		<!-- <div class="row ads-row">
			<div ng-repeat="ad in ads | filter:{'STATUS': 1} | orderBy:ORDER"
				ng-show="ad.ADS_DETAIL.LOCATION=='top'"
				class="col-lg-4 col-md-4 col-sm-4 col-xs-12 wow bounceup animated">
				<div class="col">
					<a href="{{ad.LINK}}" target="_new"><img width="{{ad.WIDTH}}"
						height="{{ad.HEIGHT}}" src="{{ad.IMAGE}}" alt="{{ad.NAME}}"></a>
				</div>
			</div>
		</div> -->
		<!-- top full -->
		<!-- <div class="row ads-row"
			ng-repeat="ad in ads | filter:{'STATUS': 1} | orderBy:ORDER"
			ng-show="ad.ADS_DETAIL.LOCATION=='top_full'">
			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12 wow bounceup animated">
				<div class="col">
					<a href="{{ad.LINK}}" target="_new"><img width="{{ad.WIDTH}}"
						height="{{ad.HEIGHT}}" src="{{ad.IMAGE}}" alt="{{ad.NAME}}"></a>
				</div>
			</div>
		</div> -->
		<div class="row ads-row"
			>
			<div ng-repeat="ad in ads | filter:{'STATUS': 1} | orderBy:ADS_DETAIL.TYPE"
			ng-show="ad.ADS_DETAIL.LOCATION=='top_{{ad.ADS_DETAIL.TYPE}}'"
				class="col-lg-{{ad.ADS_DETAIL.TYPE}} col-md-{{ad.ADS_DETAIL.TYPE}} col-sm-{{ad.ADS_DETAIL.TYPE}} col-xs-{{ad.ADS_DETAIL.TYPE}} wow bounceup animated">
				<div class="col">
					<a href="{{ad.LINK}}" target="_new"><img width="{{ad.WIDTH}}"
						height="{{ad.HEIGHT}}" ng-src="{{api_url}}{{ad.IMAGE}}" alt="{{ad.NAME}}"></a>
				</div>
			</div>
		</div>
		<!-- <div class="row ads-row">
			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12 wow bounceup animated">
				<div class="col">
					<a href="#"><img width="1119"
						height="254" src="" alt="Advertise Here 1119px x 254px"></a>
				</div>
			</div>
		</div> -->
	</div>
</div>