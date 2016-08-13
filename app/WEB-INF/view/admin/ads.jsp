<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="adsApp" ng-controller="adsCtrl">
<head>

	<jsp:include page="fragment/header-component.jsp">
		<jsp:param value="ASSVA ADS" name="pageTitle"/>
		<jsp:param value="ASSVA ADMIN" name="pageDescription"/>
		<jsp:param value="ASSVA" name="author"/>
	</jsp:include>
	
	<style>
		.btn-add-fixed{
			position:fixed;
			bottom:30px;
			right:40px;
		}
		#addStyle .bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn){
			width:100%;
		}
		td > img{
			width: 200px;
			height:100px;
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
				<jsp:param value="ADS MANAGEMENT" name="pageName"/>
			</jsp:include>
		</div><!--.full-content  -->
		<div class="display-animation">
			<div class="row">
				<div class="col-md-12">
					<div class="panel indigo">
						<div class="panel-heading">
							<div class="panel-title"><h4>ALL ADVERTISES</h4>
							</div><!--.panel-title  -->
						</div><!--.panel-heading-->
						<div class="panel-body">
							<div class="row" id="ACTION">
								<div class="col-md-6">
									<select ng-change="locationChange(location)" ng-model="location" class="selectpicker">
										<option ng-repeat="location in locations" ng-bind="location.text" ng-value="location.value"></option>
									</select>
									<select ng-change="statusChange(s)" ng-model="s" class="selectpicker">
										<option ng-repeat="s in status" ng-bind="s.text" ng-value="s.value"></option>
									</select>
								</div>
								<div class="col-md-6">
									<div class="inputer">
										<div class="input-wrapper">
											<input type="text" class="form-control" id="txtSearch" placeholder="Searching" ng-model="filter.byOwner" ng-keyup="searchKeyUp()">
										</div>
									</div>
								</div>
							</div>
							<div class="flip-scroll">
								<table class="table table-bordered table-striped table-condensed cf">
									<thead class="cf">
										<tr>
											<th>Ads Image</th>
											<th>Ads Name</th>
											<th>Owner</th>
											<th>Location</th>
											<th>Order</th>
											<th>Width</th>
											<th>Height</th>
											<th>Status</th>
											<th>Action</th>
									  	</tr>
									</thead>
									<tbody>
										<tr ng-repeat="ads in adss">
											<td>
												<img ng-src="{{base_url}}{{ads.IMAGE}}" >
											</td>
											<td ng-bind="ads.OWNER"></td>
											<td ng-bind="ads.NAME"></td>
											<td><span ng-bind="ads.ADS_DETAIL.LOCATION"></span></td>
											<td><span ng-bind="ads.ORDER"></span></td>
											<td><span ng-bind="ads.WIDTH"></span> PX</td>
											<td><span ng-bind="ads.HEIGHT"></span> PX</td>
											<td>
												<div class="switcher switcher-indigo form-inline">
													<input ng-click="toggleAds(ads.ID)" id="{{ads.ID}}" type="checkbox" hidden="hidden" ng-checked="ads.STATUS">
													<label for="{{ads.ID}}"></label>
												</div>
											</td>
											<td>
												<a ng-click="editClick(ads.ID)" data-target="#addAdsModal" data-toggle="modal" class="btn btn-floating show-on-hover btn-ripple"><i class="glyphicon glyphicon-pencil"></i></a>
												<a ng-click="removeAds(ads.ID)" class="btn btn-floating show-on-hover btn-ripple"><i class="glyphicon glyphicon-trash"></i></a>
											</td>
										</tr>
									</tbody>
								</table>
							</div><!--.flip-scroll-->
							<div class="row">
								<div class="col-md-6">
									<div id="INFORMATION">Showing <span ng-bind="paging.currentPage"></span> to <span ng-bind="paging.limit"></span> of <span ng-bind="paging.totalRecords"></span> entries</div>
									<select class="selectpicker" ng-change="rowChange(row)" ng-model="row">
										<option>TOTAL ROWS</option>
										<option ng-repeat="row in rows" ng-value="row" ng-bind="row"></option>
									</select>
								</div>
								<div class="col-md-6">
									<div id="PAGINATION" class="pull-right"></div>
								</div>
							</div>
							
						</div><!--.panel-body-->
					</div><!--.panel-->
				</div>
				
				<!--BEGIN BUTTON ADD  -->		
				<div class="btn-add-fixed">
					<a ng-click="adsAddClick()" data-target="#addAdsModal" data-toggle="modal" class="btn btn-indigo btn-ripple"><i class="ion-android-add"></i></a>
				</div>
				<form ng-submit="saveAds()" name="modalForm">
					<div class="modal fade full-height" id="addAdsModal" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" ng-bind="form.TITLE"></h4>
								</div>	
								<div class="modal-body">
									<div class="form-group">
											<label class="control-label col-md-3">OWNER</label>
											<div class="col-md-9">
												<div class="inputer">
													<div class="input-wrapper">
														<input type="text" ng-model="ads.OWNER" placeholder="Ads Owner" class="form-control" required>
													</div>
												</div>
											</div>
										</div><!-- .form-group -->
										
										<div class="form-group">
											<label class="control-label col-md-3">LOCATION</label>
											<div class="col-md-9" id="addStyle">
												<select ng-change="addLocationChange(loc)" ng-model="loc" class="form-control">
													<option ng-repeat="loc in addLocations" ng-bind="loc.text" ng-value="loc.id" ng-selected="ads.ADS_DETAIL.ID==loc.id"></option>
												</select>
												
												<!-- <select ng-change="addLocationChange(loc)" ng-model="loc" class="form-control" ng-options="loc.text for loc in addLocations" ng-selected="ads.ADS_DETAIL.ID==loc.id"></select> -->
											</div>
										</div><!-- .form-group -->
										
										<div class="form-group">
											<label class="control-label col-md-3">WIDTH</label>
											<div class="col-md-9">
												<div class="inputer">
													<div class="input-wrapper">
														<input type="number" ng-model="ads.WIDTH" max="{{adsDetail.MAX_WIDTH}}" placeholder="Max {{adsDetail.MAX_WIDTH}}px" class="form-control" ng-required="true">
													</div>
												</div>
											</div>
										</div><!-- .form-group -->
										
										<div class="form-group">
											<label class="control-label col-md-3">HEIGHT</label>
											<div class="col-md-9">
												<div class="inputer">
													<div class="input-wrapper">
														<input type="number" ng-model="ads.HEIGHT" max="{{adsDetail.MAX_HEIGHT}}" placeholder="Max {{adsDetail.MAX_HEIGHT}}px" class="form-control" ng-required="true">
													</div>
												</div>
											</div>
										</div><!-- .form-group -->
										
										<div class="form-group">
											<label class="control-label col-md-3">LINK</label>
											<div class="col-md-9">
												<div class="inputer">
													<div class="input-wrapper">
														<input type="text" ng-model="ads.LINK" placeholder="Ads link" class="form-control" ng-required="true">
													</div>
												</div>
											</div>
										</div><!-- .form-group -->
										
										<div class="form-group">
											<label class="control-label col-md-3">BANNER</label>
											<div class="col-md-9">
												<div class="inputer">
													<div class="input-wrapper">
														<input id="fileName" type="hidden" value="{{ads.IMAGE}}"/>
														<input id="banner" name="file" type="file" class="form-control">
													</div>
												</div>
											</div>
										</div><!-- .form-group -->
										<div class="form-group">
											<label class="control-label col-md-3">BANNER PREVIEW</label>
											<div class="col-md-9">
												<div class="">
													<img src="http://getuikit.com/docs/images/placeholder_600x400.svg" id="banner-preview" class="img-thumbnail" width="304" height="236"/>
												</div>
											</div>
										</div><!-- .form-group -->
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-flat-primary btn-ripple" data-dismiss="modal" id="cancel">CANCEL<span class="ripple _3 animate" style="height: 117px; width: 117px; top: -43.5px; left: 21.2344px;"></span></button>
									<button type="submit" class="btn btn-primary button-striped button-full-striped btn-ripple">SAVE<span class="ripple _3 animate" style="height: 96px; width: 96px; top: -28px; left: 20.9844px;"></span><span class="ripple _4 animate" style="height: 96px; width: 96px; top: -32px; left: 35.9844px;"></span></button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div><!--.row-->
			
			<!--BEGIN ALERT DIALOG  -->
		<button​ style="display:none" id="success-alert" data-toastr-notification="SUCCESSFULLY!" class="btn btn-default toastr-notify btn-ripple" data-toastr-close-others="true" data-toastr-position="toast-top-full-width" data-toastr-type="success">Success<span class="ripple _30 animate" style="height: 148px; width: 148px; top: -56px; left: -2px;"></span><span class="ripple _31 animate" style="height: 148px; width: 148px; top: -46px; left: -16px;"></span><span class="ripple _32 animate" style="height: 148px; width: 148px; top: -58px; left: -19px;"></span><span class="ripple _34 animate" style="height: 148px; width: 148px; top: -58px; left: -44px;"></span></button>
				
		</div><!--.display-animation-->
	</div><!--.content-->
	
	
	<!--MENU NAVIGATION  -->
	<div class="layer-container">
		<jsp:include page="fragment/nav-menu.jsp"></jsp:include>
	</div><!--.layer-container-->
	
	<!--FOOTER COMPONENTS  -->
	<jsp:include page="fragment/footer-component.jsp"></jsp:include>
	
	<!--SCRIPT FOR ADS PAGE  -->
	<script src="${pageContext.request.contextPath }/resources/admin/angular/ads.js"></script>
</body>
</html>