<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!-- BEGIN GLOBAL AND THEME VENDORS -->
<script src="${pageContext.request.contextPath}/resources/admin/assets/globals/js/global-vendors.js"></script>
<!-- END GLOBAL AND THEME VENDORS -->

<!-- PLEASURE -->
<script src="${pageContext.request.contextPath}/resources/admin/assets/globals/js/pleasure.js"></script>
<!-- ADMIN 1 -->
<script src="${pageContext.request.contextPath}/resources/admin/assets/admin1/js/layout.js"></script>

<!--BOOTPAG  -->
<script src="${pageContext.request.contextPath }/resources/admin/js/jquery.bootpag.min.js"></script>

<!--ANGULAR JS  -->
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>

<!-- BEGIN INITIALIZATION-->
<script>
	$(document).ready(function () {
		Pleasure.init();
		Layout.init();
	});
</script>
<!-- END INITIALIZATION-->

<!-- URL -->
<script src="${pageContext.request.contextPath }/resources/js/url.js"></script>


