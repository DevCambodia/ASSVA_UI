<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="row">
	<div class="col-sm-6">
		<h1>${param.pageName }</h1>
	</div>
	<div class="col-sm-6">
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/admin/logout" class="active"><i class="ion-home"></i> Logout</a></li>
		</ol>
	</div>
</div>