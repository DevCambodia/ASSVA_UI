<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
	
	<!--Spring Security Taglib  -->
	<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
	
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>${param.pageTitle }</title>

<meta name="description" content="${param.pageDescription }">
<meta name="author" content="${param.author }">

<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-touch-fullscreen" content="yes">

<!--BOOTSTRAP  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css">

<!-- BEGIN CORE CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/admin1/css/admin1.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/globals/css/elements.css">
<!-- END CORE CSS -->


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/assets/globals/css/plugins.css">
<!-- END PLUGINS CSS -->


<!-- BEGIN SHORTCUT AND TOUCH ICONS -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/assets/globals/img/icons/favicon.ico">
<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/admin/assets/globals/img/icons/apple-touch-icon.png">
<!-- END SHORTCUT AND TOUCH ICONS -->

<script src="${pageContext.request.contextPath}/resources/admin/assets/globals/plugins/modernizr/modernizr.min.js"></script>

<!-- sweet alert -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sweetalert.css" media="all"> 

<!--USER SESSION ID  -->
<script type="text/javascript">
	var USER_SESSION = {};

	USER_SESSION.ID = '<security:authentication property="principal.id" />';
	USER_SESSION.EMAIL = '<security:authentication property="principal.email" />';
	
</script>







