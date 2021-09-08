<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DATARGET</title>
</head>
<body>
		<sec:authorize access="isAuthenticated()">
				<c:set var="authority"><sec:authentication property="details.authority" /></c:set>
				<c:if test="${authority eq 'B' }">
					<script>
						location.href="/campaign";
					</script>
				</c:if>
				<c:if test="${authority eq 'R' }">
					<script>
					location.href="/admin/admin";
					</script>
				</c:if>
		</sec:authorize>
</body>
</html>