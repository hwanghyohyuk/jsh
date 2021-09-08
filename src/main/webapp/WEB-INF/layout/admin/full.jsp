<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>DATARGET</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="description" content="">
<meta name="author" content="">
<meta property="og:url" content="http://www.datarget.kr/">
<meta property="og:title" content="DATARGET">
<meta property="og:type" content="website">
<meta property="og:image" content="/resources/images/ogImage.png">
<meta property="og:description" content="옥외 매체 플래닝/집행 솔루션">

<tiles:insertAttribute name="css" />
</head>
<body>
	<input type="hidden" id="adminId" name="adminId" value="${adminId }">
	<input type="hidden" id="userList" name="userList" value="${userList }">
	<tiles:insertAttribute name="header" />
	<div class="page-content">
		<div class="row">
			<div class="col-md-2" style="width: 200px;">
				<tiles:insertAttribute name="lnb" />
			</div>
			<div class="col-md-10">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
		<tiles:insertAttribute name="footer" />
	</div>

	<tiles:insertAttribute name="js" />
</body>
</html>