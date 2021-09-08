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
			<div class="panel-title" style="font-size: 30px;">회원 목록</div>
		</div>
		<div class="panel-body">
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered" id="example">
				<thead>
					<tr>
						<th>사용자 ID</th>
						<th>이름</th>
						<th>회사명</th>
						<th>사용자 전화번호</th>
						<th>사용자 권환</th>
						<th>가입일</th>
						<th>회원삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="userList" items="${userList}" varStatus="status">
						<tr>
							<td><span><a href="#"
									style="color: slateblue; cursor: pointer;"
									onclick="userCampaign(<c:out value="${status.index}"/>);">${userList.uId}</a></span>
								<a href="#" id="modalinput" data-toggle="modal"
								data-target="#inquireMSModal" data-uid="${userList.uId }"
								data-adminId="${adminId }">메세지 보내기</a></td>
							<td><span>${userList.uNm}</span></td>
							<td><span>${userList.cNm}</span></td>
							<td><span>${userList.uHp}</span></td>
							<td><input type="hidden" id=uId${status.index} name="uId"
								value="${userList.uId}"> <select id=index${status.index}
								name="authChange">
									<option value=0 selected disabled hidden>${userList.authList}</option>
									<option value=1>관리자</option>
									<option value=2>일반 사용자</option>
									<option value=3>미승인 사용자</option>
							</select> <a href="#"
								onclick="changeAuth(<c:out value="${status.index}"/>);">변경하기</a>
							</td>
							<td><span>${userList.cDt}</span></td>
							<td style="text-align: center;"><button
									class="btn btn-danger"
									style="width: 55px; height: 20px; padding: 0;"
									onclick="userdelete(<c:out value="${status.index}"/>);">
									<i class="glyphicon glyphicon-remove"></i>삭제
								</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script src="/resources/admin/js/userMgmt/userMgmt.js"></script>
</body>
</html>