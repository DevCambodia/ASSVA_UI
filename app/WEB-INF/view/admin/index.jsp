<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="fragment/header-component.jsp">
		<jsp:param value="ASVA DASHBOARD" name="pageTitle"/>
		<jsp:param value="ASVA ADMIN" name="pageDescription"/>
		<jsp:param value="ASVA" name="author"/>
	</jsp:include>
	
	<style>
		td:first-child,
		th:first-child,
		th:nth-child(4),
		td:nth-child(4),
		th:nth-child(5),
		td:nth-child(5),
		th:last-child,
		td:last-child { text-align: center }
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
				<jsp:param value="DASHBOARD" name="pageName"/>
			</jsp:include>
		</div><!--.full-content  -->


		<div class="display-animation">
			
		</div><!--.display-animation-->
		
	</div><!--.content-->
	
	
	<!--MENU NAVIGATION  -->
	<div class="layer-container">
		<jsp:include page="fragment/nav-menu.jsp"></jsp:include>
	</div>
	
	<!--FOOTER COMPONENTS  -->
	<jsp:include page="fragment/footer-component.jsp"></jsp:include>

</body>
</html>