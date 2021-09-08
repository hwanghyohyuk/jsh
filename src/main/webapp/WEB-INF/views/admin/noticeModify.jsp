<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<body>
	<div class="content-box-large">
		<div class="panel-heading">
			<div class="panel-title" style="font-size: 30px;">공지사항 수정</div>
		</div>
		<div class="panel-body">
			<article>
				<div class="container" role="main">
					<form name="noticeModify" id="noticeModify" method="get"
						action="/admin/noticeModifySave">
						<input type="hidden" id="nNo" name="nNo" value="${nNo }">
						<input type="hidden" id="adminId" name="adminId"
							value="${adminId }"> <input type="hidden" id="adminNm"
							name="adminNm" value="${adminNm }">
						<div class="mb-3" style="margin-bottom: 20px;">
							<label for="title">제목</label> <input type="text"
								class="form-control" name="title" id="title" value="${title }">
						</div>
						<div class="mb-3" style="margin-bottom: 20px;">
							<label for="content">내용</label>
							<textarea class="form-control" rows="5" name="content"
								id="content">${content }</textarea>
						</div>
					</form>
					<div style="margin-bottom: 20px;">
						<button type="button" class="btn btn-sm btn-primary"
							onclick='modify_btnSave()'>등록</button>
						<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
					</div>
				</div>
			</article>
		</div>
	</div>
	<script src="/resources/admin/js/noticeMgmt/noticeMgmt.js"></script>
</body>
</html>