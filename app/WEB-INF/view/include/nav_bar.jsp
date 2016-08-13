
<!-- main category -->
<nav>
	<div class="container">
		<div class="row">
			<!-- <div class="mm-toggle-wrap">
				<div class="mm-toggle">
					<i class="icon-reorder"></i><span class="mm-label">Menu</span>
				</div>
			</div> -->
			<div class="nav-inner col-lg-12">
				<!-- Search-col -->
				<!-- <div class="option-container"> -->
					<form class="form-inline" role="form">
						<div class="form-group">
							<label for="cat">CATEGORY:</label> <select class="form-control"
								ng-model="catFilter" ng-change="showSub=true" id="catFilter">
								<option value="0" selected>All Categories</option>
								<option
									ng-repeat="c in categories | filter:{'MAIN_CATEGORY': null, 'CATEGORY_STATUS': 1}"
									value="{{c.ID}}">{{c.CATEGORY_NAME}}</option>
							</select>
						</div>
						<!-- &nbsp; -->
						<div class="form-group" ng-show="showSub">
							<label for="sub">SUB CATEGORY:</label> <select ng-change="getItems(page)"
								class="form-control" ng-model="subFilter" id="subFilter">
								<option value="" selected>ALL Sub Category</option>
								<option ng-repeat="s in categories "
									ng-if="s.MAIN_CATEGORY.ID==catFilter && s.CATEGORY_STATUS==1"
									value="{{s.ID}}">{{s.CATEGORY_NAME}}</option>
							</select>
						</div>
						<!-- &nbsp; -->
						<!-- limit entry -->
						<!-- <div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-th-list"></span>
								</div>
								<select id="entryLimit" class="form-control"
									ng-model="entryLimit">
									<option selected>20</option>
									<option>30</option>
									<option>40</option>
									<option>50</option>
								</select>
							</div>
							/.input group
						</div> -->
						<!-- &nbsp; -->
						<div class="form-group">
							<label for="SEARCH">SEARCH:</label> <input type="text" width="250px"
								class="form-control" id="SEARCH" ng-model="search_box"
								ng-change="filter()" placeholder="Search all products...">
						</div>
					</form>
				<!-- </div> -->
				<!-- End Search-col -->

			</div>
		</div>
	</div>
</nav>

<!-- sub categories -->
<!-- <div class="header-banner">
	<div class="our-features-box">
		<div class="container">
			<ul>
          sub category
          <li ng-repeat="sub in categories" ng-show="sub.MAIN_CATEGORY.ID==mainId && sub.CATEGORY_STATUS==1">
            show if not active
            <div class="feature-box" ng-show="sub.ID!=subId">
              <div class="content" ng-click="setSub(sub.ID, sub.CATEGORY_NAME)">{{sub.CATEGORY_NAME}}</div>
            </div>
            
            show if active
            <div class="feature-box sub-menu-active" ng-show="sub.ID==subId">
              <div class="content" ng-click="setSub(sub.ID, sub.CATEGORY_NAME)">{{sub.CATEGORY_NAME}}</div>
            </div>
          </li>
			</ul>
		</div>
	</div>
</div> -->