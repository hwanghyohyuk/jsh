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
			<div class="panel-title" style="font-size: 30px;">공지사항</div>
		</div>
		<div class="panel-body">
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered" id="example">
				<thead>
					<tr>
						<th>제목</th>
						<th>내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="noticeList" items="${noticeList}">
						<tr class="odd gradeX">
							<td><a
								href="noticeView?adminId=${adminId }+&nNo=${noticeList.nNo}+&adminNm=${adminNm }">${noticeList.title}</a></td>
							<td><a
								href="noticeView?adminId=${adminId }+&nNo=${noticeList.nNo}+&adminNm=${adminNm }">${noticeList.content}</a></td>
							<td>${noticeList.writeDay}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="noticeWrite?adminNm=${adminNm}+&adminId=${adminId}"
				class="btn btn-primary" style="float: right;"> <i
				class="glyphicon glyphicon-pencil"></i>&nbsp글쓰기
			</a>
		</div>
	</div>
	<script src="/resources/admin/js/noticeMgmt/noticeMgmt.js"></script>
</body>
</html>