<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="container-fluid fixed-top min-vh-100 bgi-a" id="bg-image"></div>
<div class="container-fluid bg-intro fixed-top top-contents">
	<nav class="navbar navbar-dark navbar-expand">
		<a class="navbar-brand ml-5 mt-3 mb-3 d-logo" href="/"></a>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto mr-auto underline silkabold description">
				<li class="nav-item mr-3">
					<a class="nav-link smthcroll tech" onclick="smthcroll('before-tech')">Tech</a>
				</li>
				<li class="nav-item mr-3">
					<a class="nav-link smthcroll protocol" onclick="smthcroll('protocol')">Protocol</a>
				</li>
				<li class="nav-item">
					<a class="nav-link smthcroll contact" onclick="smthcroll('contact')">Contact</a>
				</li>
			</ul>
			<ul class="navbar-nav mr-5 mt-3 mb-3 silkamedium user-action">
				<sec:authorize access="isAuthenticated()">
				<c:set var="authority"><sec:authentication property="details.authority" /></c:set>
				<%-- <li class="nav-item">
					<c:if test="${authority eq 'B'}">
						<a class="nav-link" href="/campaign" id="MAIN">Main</a>
					</c:if>
					<c:if test="${authority eq 'R'}">
						<a class="nav-link" href="/admin" id="MAIN">Main</a>
					</c:if>
				</li> --%>
				<li class="nav-item">
					<a class="nav-link" onclick="logout();return false;" id="LOGOUT">Logout</a>
				</li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
				<li class="nav-item">
					<a class="nav-link" id="LOGIN">Login</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="JOIN">Join</a>
				</li>
				</sec:authorize>
			</ul>
		</div>
	</nav>
	<form id="logout" action="/logout?${_csrf.parameterName}=${_csrf.token}" method="post">
	</form>
	<script>
	function logout() {
		if(confirm("로그아웃 하시겠습니까?")){
			var pageUrl = location.href;
			var referUid = '<sec:authorize access="isAuthenticated()"><sec:authentication property="details.user_id"/></sec:authorize>';
			localStorage.setItem("referUrl",pageUrl);
			localStorage.setItem("referUid",referUid);
			$("#logout").submit();					
		}
	}
	</script>
</div>