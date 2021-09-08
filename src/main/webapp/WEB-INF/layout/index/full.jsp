<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="description" content="">
<meta name="author" content="">
<meta property="og:url" content="">
<meta property="og:title" content="">
<meta property="og:type" content="">
<meta property="og:image" content="">
<meta property="og:description" content="">

<tiles:insertAttribute name="css" />
<tiles:insertAttribute name="js" />
</head>
<body>
	<tiles:insertAttribute name="header" />
	
	<tiles:insertAttribute name="body" />
	
	<tiles:insertAttribute name="footer" />

</body>
</html>