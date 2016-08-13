<!--Spring Security Taglib  -->
	<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!-- jQuery 2.2.3 -->
<script
	src="${pageContext.request.contextPath}/resources/LTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script
	src="${pageContext.request.contextPath}/resources/LTE/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script
	src="${pageContext.request.contextPath}/resources/LTE/plugins/datatables/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/LTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- FastClick -->
<script
	src="${pageContext.request.contextPath}/resources/LTE/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script
	src="${pageContext.request.contextPath}/resources/LTE/dist/js/app.min.js"></script>
<!-- Sparkline -->
<script
	src="${pageContext.request.contextPath}/resources/LTE/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script
	src="${pageContext.request.contextPath}/resources/LTE/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/LTE/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script
	src="${pageContext.request.contextPath}/resources/LTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>

<!-- URL -->
<script src="${pageContext.request.contextPath }/resources/js/url.js"></script>

<!--USER SESSION ID  -->
<script type="text/javascript">
	var USER_SESSION = {};

	USER_SESSION.ID = '<security:authentication property="principal.id" />';
	USER_SESSION.EMAIL = '<security:authentication property="principal.email" />';
	
</script>

