<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DevOps Tool</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/DevOpsLogo.png"
	type="image/png">
<%@include file="include-css.jsp"%>
</head>
<body>
	<header class="navbar-fixed-top" style="background: white">
		<div class="container-fluid ">
			<div class="row">
				<div class="col-sm-6" style="padding-top: 20px;">
					<img
						src="${pageContext.request.contextPath}/resources/images/logo2.png"
						alt="Nagarro Intranet" />
				</div>
				<div class="col-sm-6 text-right">
					<img height="15%" width="15%"
						src="${pageContext.request.contextPath}/resources/images/DevOpsCOE_Logo.png"
						alt="Nagarro DevOps" />
				</div>
			</div>
		</div>
		<div class="page-dashboard page-dashboard-custom">
			<div class="container"
				style="background-image:url(${pageContext.request.contextPath}/resources/images/bg1.png);">
				<h1>DevOps Sample Application version 1</h1>
			</div>
		</div>
	</header>
	<div style="margin-top: 180px;"></div>
	<div class="container">

	<div class="row">

	<div class="col-md-6">
	<h3>Config Properties</h3>
	<p>Env: <%= System.getenv("Environment") %></p>
	<p>API_URL: <%= System.getenv("API_URL") %></p>
	<p>Language <%= System.getenv("Language") %></p><br />
	<p>Name: <%= System.getenv("name") %></p>
    <p>employeeid: <%= System.getenv("employeeid") %></p>
    <p>emailid <%= System.getenv("emailid") %></p>
    <p>type: <%= System.getenv("type") %></p>
	</div>
	<div class="col-md-6">
    	<h3>kubectl secret</h3>
    	<p>Username: <%= System.getenv("username") %></p>
    	<p>Password: <%= System.getenv("password") %></p>
    	</div>


	</div>
	<img height="100%" width="100%"
    			src="${pageContext.request.contextPath}/resources/images/helloWorld.jpg"
    			alt="Nagarro DevOps" />
	</div>


	<div class="container-fluid">
		<div style="margin-top: 50px;"></div>
		<%@include file="footer.jsp"%>
	</div>
</body>
<%@include file="include-js.jsp"%>
</html>
