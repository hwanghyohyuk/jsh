<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="header">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="logo">
					<h1>
						<a href="/admin/admin">Datarget Admin</a>
					</h1>
				</div>
			</div>
			<div class="col-md-9">
				<div class="navbar navbar-inverse" role="banner">
					<nav
						class="collapse navbar-collapse bs-navbar-collapse navbar-right"
						role="navigation">
						<ul class="nav navbar-nav">
	                      	<li><a href="#" onclick="logout();return false;">로그아웃</a></li>
						</ul>
					</nav>
				</div>
				<form id="logout" action="/logout?${_csrf.parameterName}=${_csrf.token}" method="post"> </form>
			</div>
		</div>
	</div>
</div>