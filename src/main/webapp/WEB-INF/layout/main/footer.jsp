<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 	
	

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- Modal -->
<div class="modal fade" id="inquireModal" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content no-border-radius">
			<div class="modal-header no-border-bottom">
				<h2 class="modal-title mx-auto fw-bold" id="inquireModalLabel">문의하기</h2>
			</div>
			<div class="modal-body">
				<form action="/inquire?_csrf=${_csrf.token }" method="post" name="inquireForm">
				<div class="container-fluid">
					<div class="row">
						<div class="col-1 no-padding-right">
							<p class="inquire-p">e-mail</p>
						</div>
						<div class="col-11 form-group">
							<sec:authorize access="isAuthenticated()">
								<input type="email" class="form-control no-border-radius border-color-primary" id="inq-email" name="email" aria-describedby="emailHelp" value="<sec:authentication property="details.user_id"/>">
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<input type="email" class="form-control no-border-radius border-color-primary" id="inq-email" name="email" aria-describedby="emailHelp">
							</sec:authorize>
						</div>
					</div>
					<div class="row">
						<div class="col-1 no-padding-right">
							<p class="inquire-p">제목</p>
						</div>
						<div class="col-11 form-group">
							<input type="text" class="form-control no-border-radius border-color-primary" id="inq-title" name="title" aria-describedby="titleHelp">
						</div>
					</div>
					<div class="row">
						<div class="col-1 no-padding-right">
							<p class="inquire-p">내용</p>
						</div>
						<div class="col-11 form-group">
							<textarea class="form-control no-border-radius border-color-primary" id="inq-contents" name="contents" rows="5"></textarea>
						</div>
					</div>
				</div>
				</form>
			</div>
			<div class="modal-footer no-border-top">
				<div class="w-50 mx-auto">
					<button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-secondary bg-secondary w-49 border-radius-100 float-left">닫기</button>
					<button type="button" id="inquireSubmit" class="btn btn-primary bg-primary w-49 border-radius-100 float-right">보내기</button>
				</div>
			</div>
		</div>
	</div>
</div>
