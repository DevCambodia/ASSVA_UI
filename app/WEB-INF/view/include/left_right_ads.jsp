<div class="sale-offer-box left-right-ads" ng-app="asva"
	ng-controller="adsCtrl">
	<div class="sale-offer-left">
		<a ng-repeat="ad in ads | filter:{'STATUS': 1} | orderBy:ORDER"
			ng-show="ad.ADS_DETAIL.LOCATION=='left'" href="{{ad.LINK}}" target="_new"> <img
			class="img-responsive" ng-src="{{api_url}}{{ad.IMAGE}}" alt="{{ad.NAME}}" width="{{ad.WIDTH}}" height="{{ad.HEIGHT}}"></a>
	</div>

	<div class="sale-offer-right">
		<a ng-repeat="ad in ads | filter:{'STATUS': 1} | orderBy:ORDER"
			ng-show="ad.ADS_DETAIL.LOCATION=='right'" href="{{ad.LINK}}" target="_new"> <img
			class="img-responsive" ng-src="{{api_url}}{{ad.IMAGE}}" alt="{{ad.NAME}}" width="{{ad.WIDTH}}" height="{{ad.HEIGHT}}"></a>
	</div>
</div>