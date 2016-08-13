<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		<!--Spring Security Taglib  -->
	<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<div class="menu-layer">
	<ul>
		
		<!-- <li data-open-after="true"><a href="index.html">ASVA ADMIN</a></li> -->
		<!-- <li>
			<a href="dashboard">DASHBOARD</a>
		</li> -->
		
		<security:authorize access="hasRole('Admin')">
			<li>
				<a href="javascript:;">PRODUCT MANAGEMENT</a>
				<ul class="child-menu">
					<li><a href="product">ALL PRODUCTS</a></li>
				</ul>
			</li>
			
			<li>
				<a href="javascript:;">USER MANAGEMENT</a>
				<ul class="child-menu">
					<li><a href="user">ALL USERS</a></li>
				</ul>
			</li>
				
			<li>
				<a href="javascript:;">CATEGORY MANAGEMENT</a>
				<ul class="child-menu">
					<li><a href="category">ALL CATEGORIES</a></li>
				</ul>
			</li>
			
			<li>
				<a href="javascript:;">ADS MANAGEMENT</a>
				<ul class="child-menu">
					<li><a href="ads">ALL ADS</a></li>
				</ul>
			</li>	
		</security:authorize>
		
		<security:authorize access="hasRole('Editor')">
			<li>
				<a href="javascript:;">PRODUCT MANAGEMENT</a>
				<ul class="child-menu">
					<li><a href="product">ALL PRODUCTS</a></li>
				</ul>
			</li>
			<li>
				<a href="javascript:;">CATEGORY MANAGEMENT</a>
				<ul class="child-menu">
					<li><a href="category">ALL CATEGORIES</a></li>
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="hasRole('Ads')">
			<li>
				<a href="javascript:;">ADS MANAGEMENT</a>
				<ul class="child-menu">
					<li><a href="ads">ALL ADS</a></li>
				</ul>
			</li>	
		</security:authorize>
		
	</ul>
</div>