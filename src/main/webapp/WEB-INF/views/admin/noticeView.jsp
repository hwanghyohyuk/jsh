<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<body>
	<input type="hidden" id="nNo" value="" />
	<div class="content-box-large">
		<article>
			<div class="container" role="main">
				<h2>
					<c:out value="${noticeInfo.title}" />
				</h2>
				<div class="bg-white rounded shadow-sm">
					<div class="board_content"
						style="margin-top: 20px; font-size: 25px; word-break: break-all;">
						<c:out value="${noticeInfo.content}" />
					</div>
					<%-- <div class="board_info_box" style="margin-top:50px;">
										<span class="board_author" style="font-size:18px;">작성자 : <c:out value="${noticeInfo.uNm}"/></span>
									</div> --%>
					<div class="board_date" style="font-size: 18px;">작성일 :
						${noticeInfo.writeDay}</div>
				</div>
				<div style="margin-top: 20px">
					<a class="btn btn-sm btn-primary" type="button"
						href="noticeModify?nNo=${noticeInfo.nNo }+&title=${noticeInfo.title }
											+&content=${noticeInfo.content }+&adminId=${adminId }+&adminNm=${adminNm }">수정
					</a> <a class="btn btn-sm btn-primary" type="button"
						href="noticeDelete?nNo=${noticeInfo.nNo }+&uId=${noticeInfo.uId }+&adminId=${adminId }+&adminNm=${adminNm }">삭제
					</a>
					<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
				</div>
			</div>
		</article>
	</div>
	<script src="/resources/admin/js/noticeMgmt/noticeMgmt.js"></script>
</body>
</html>