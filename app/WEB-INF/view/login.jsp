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
<title>ASSVA</title>

<!-- Mobile Specific -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- import css and script -->
<%@ include file="include/header_script_css.jsp"%>

</head>

<body ng-app="asva" ng-controller="mainCtrl"
	style="overflow: hidden !important;">
	<div id="page">

		<!-- Header -->
		<jsp:include page="include/header.jsp"></jsp:include>
		<!-- end header -->

		<input type="hidden" id="base"
			value="${pageContext.request.contextPath}">

		<!-- Main Container -->
		<section class="main-container col1-layout bounceInUp animated">
			<div class="main container">
				<div class="account-login">
					<div class="page-title">
						<h2>Login or Create an Account</h2>
					</div>
					<fieldset class="col2-set">
						<legend>Login or Create an Account</legend>
						<div class="col-1 new-users">
							<strong>New Users</strong>
							<div class="content">
								<p>By creating an account with our store, you will be able
									to post your products for free.</p>
								<div class="buttons-set">
									<a href="${pageContext.request.contextPath}/signup">
										<button class="btn btn-default">
											<span>Create an Account</span>
										</button>
									</a>
								</div>
							</div>
						</div>
						<div class="col-2 registered-users">
							<strong>Registered Users</strong>
							<div class="content">
								<p>If you have an account with us, please log in.</p>
								<form name="userForm" ng-submit="login()">
									<ul class="form-list">
										<!-- email -->
										<li><label for="email">Email Address <span
												class="required">*</span></label> <br> <input type="email"
											title="Email Address" class="input-text" id="email" value=""
											name="email" placeholder="you@example.com"
											ng-model="user.EMAIL" ng-required="true"></li>

										<!-- password -->
										<li><label for="pass">Password <span
												class="required">*</span></label> <br> <input type="password"
											placeholder="Password" title="Password" id="pass"
											class="input-text" ng-model="user.PASSWORD" name="password"
											ng-required="true"></li>
									</ul>
									<!-- <p class="required">* Required Fields</p> -->
									<div class="buttons-set">
										<!-- <button id="send2" name="send" type="submit"
											class="button login">
											<span>Login</span>
										</button> -->
										<!-- <a class="forgot-word" href="#">Forgot Your Password?</a> -->
										<input type="submit" value="LOGIN"
											ng-disabled="userForm.$invalid" class="btn btn-default">
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
			src="${pageContext.request.contextPath}/resources/js/angular/login.js"></script>
</body>
</html>