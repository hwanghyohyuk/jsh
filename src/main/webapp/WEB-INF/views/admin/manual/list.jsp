<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
  <body>
	<div class="content-box-large">
		<div class="panel-heading">
			<div class="panel-title" style="font-size: 30px;">매뉴얼 목록</div>
		</div>
		<div class="panel-body">
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered" id="example">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${manualList}">
						<tr class="odd gradeX">
							<td>${i.no }</td>
							<td><a href="/admin/manual/view?&mid=${i.mid}">${i.title}</a></td>
							<td>${i.readCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="/admin/manual/write" class="btn btn-primary" style="float: right;"> <i class="glyphicon glyphicon-pencil"></i>&nbsp;글쓰기</a>
		</div>
	</div>	
	<script src="/resources/admin/js/manual/manual.js"></script>
</body>
</html>