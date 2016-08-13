<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from htmldemo.magikthemes.com/ecommerce/fabia-html-template/lavender/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 14 Jul 2016 01:03:57 GMT -->
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
<title>ASVA</title>

<!-- Mobile Specific -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- import css and script -->
<%@ include file="include/header_script_css.jsp"%>

</head>

<body ng-app="asva" ng-controller="mainCtrl">
	<div id="page">
		<!-- top_advertise -->
		<%-- <jsp:include page="include/top_ads.jsp" /> --%>

		<!-- Header -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- end header -->


		<!-- Main Container -->
		<section class="main-container col1-layout bounceInUp animated">
			<div class="main container">
				<div class="account-login">
					<div class="page-title">
						<h2>Create an Account</h2>
					</div>
					<fieldset class="col2-set">
						<legend>Create an Account</legend>
						<div class="col-1 new-users">
							<strong>New Users</strong>
							<div class="content">
								<p>By creating an account with our store, you will be able
									to post your products for free.</p>
								<%-- <div class="buttons-set">
									<button class="button create-account">
										<a href="${pageContext.request.contextPath}/signup"><span>Create an Account</span></a>
									</button>
								</div> --%>
								<img class="img-thumbnail" alt="Post free product"
									src="http://www.bizbilla.com/articles/articlesimage/How-to-post-my-products-online-for-free--681.jpg">
							</div>
						</div>
						<div class="col-2 registered-users">
							<strong>Create an Account</strong>
							<div class="content">
								<p>Please fill the information below to create an account.</p>
								<form name="userForm" ng-submit="signup()">
									<ul class="form-list">
										<!-- username -->
										<li><label for="userName">Name <span
												class="required">*</span></label> <br> <input type="text"
											title="Full Name" class="input-text" id="userName" name="username" value=""
											placeholder="Full Name" ng-model="userName" ng-minlength="5"
											ng-maxlength="20" ng-required="true"> <!-- show an error if username is too short -->
											<p ng-show="userForm.username.$error.minlength" class="red">Username is too short.</p> <!-- show an error if username is too long -->
											<p ng-show="userForm.username.$error.maxlength" class="red">Username is too long.</p> <!-- show an error if this isn't filled in -->
											<p ng-show="userForm.username.$error.required" class="red">Username is required.</p></li>
										
										<!-- email -->
										<li><label for="email">Email Address <span
												class="required">*</span></label> <br> <input type="email"
											title="Email Address" class="input-text" id="email" value="" name="email"
											placeholder="you@example.com" ng-model="email" ng-required="true">
										<p ng-show="userForm.email.$invalid" class="help-block red">Enter a valid email.</p>
										</li>
										
										<!-- password -->
										<li>
										<label for="pass">Password <span
												class="required">*</span></label> <br> <input type="password"
											placeholder="Password" title="Password" id="pass"
											class="input-text" ng-model="password" name="password" ng-minlength="8"
											ng-maxlength="20" ng-required="true">
											<p ng-show="userForm.password.$error.minlength" class="red">Password
												is too short, at least 8 characters.</p> <!-- show an error if username is too long -->
											<p ng-show="userForm.password.$error.maxlength" class="red">Password
												is too long, only 20 characters.</p> <!-- show an error if this isn't filled in -->
											<p ng-show="userForm.password.$error.required" class="red">Password is required.</p>
										</li>
										<li>
											<label for="pass">Confirm Password <span
												class="required">*</span></label> <br> <input type="password"
											placeholder="Your password again" title="Confirm Password"
											id="pass" class="input-text" ng-model="confirmPassword" name="confirmPassword" ng-minlength="8"
											ng-maxlength="20" ng-required="true">
											<p ng-show="userForm.confirmPassword.$error.minlength" class="red">Password
												is too short, at least 8 characters.</p> <!-- show an error if username is too long -->
											<p ng-show="userForm.confirmPassword.$error.maxlength" class="red">Password
												is too long, only 20 characters.</p> <!-- show an error if this isn't filled in -->
											<p ng-show="userForm.confirmPassword.$error.required" class="red">Password is required.</p>
											<p ng-show="password!=confirmPassword" class="red">Password is not matched.</p>
											<p ng-show="password==confirmPassword && !userForm.confirmPassword.$error.required" style="color: #27AE60;">Password is matched.</p>
										</li>
									</ul>
									<!-- <p class="required">* Required Fields</p> -->
									<div class="buttons-set">
										<!-- <button id="send2" name="send" type="button" ng-disabled="true"
											ng-click="signup()" class="button create-account">
											<span>Signup</span>
										</button> -->
										<!-- <a class="forgot-word" href="#">Forgot Your Password?</a> -->
										<input type="submit"  value="SIGNUP" ng-disabled="userForm.$invalid" 
										class="btn btn-default">
									</div>
								</form>
							</div>
						</div>
					</fieldset>
				</div>
				<br> <br> <br> <br> <br>
			</div>
		</section>
		<!-- Main Container End -->

		<!-- Footer -->
		<jsp:include page="include/footer.jsp" />
		<!-- End Footer -->

		<!-- JavaScript -->
		<%@ include file="include/footer_script.jsp"%>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/angular/signup.js"></script>
</body>
</html>