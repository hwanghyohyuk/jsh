<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<body>
	<input type="hidden" id="nowPage" name="nowPage"
		value="${paging.nowPage}">
	<div class="content-box-large">
		<div class="panel-heading">
			<div class="panel-title" style="font-size: 30px;">빌보드</div>
		</div>
		<div class="submenubtn"
			style="margin: 50px 0px 10px 0px; padding-left: 15px;">
			<button class="btn btn-primary"
				onclick="javascript:location.href='popupImg_shelter'">쉘터</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='popupImg_psd'">PSD</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='popupImg_gdia'">GDIA</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='popupImg_bus'">버스래핑</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='popupImg_mediaboard'">포커스미디어</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='popupImg_townboard'">타운보드</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='popupImg_edisplay'">디지털빌보드</button>
			<button class="btn btn-primary"
				style="background-color: white; color: black; pointer-events: none;">빌보드</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='popupImg_outerwall'">빌딩외벽</button>
			<button onclick="setIntegrationModal('billboard')"
				data-toggle="modal" data-target="#integration_Modal"
				class="btn btn-success" style="float: right">
				<i class="glyphicon glyphicon-file"></i>통합 업로드
			</button>
		</div>

		<div style="float: left; padding-left: 15px; padding-top: 15px;">
			<select id="cntPerPage" name="sel" onchange="billboard_selChange()">
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10
				</option>
				<option value="25"
					<c:if test="${paging.cntPerPage == 25}">selected</c:if>>25
				</option>
				<option value="50"
					<c:if test="${paging.cntPerPage == 50}">selected</c:if>>50
				</option>
				<option value="100"
					<c:if test="${paging.cntPerPage == 100}">selected</c:if>>100
				</option>
			</select> records per page
		</div>

		<div style="width: 300px; float: right; padding-left: 90px;">
			<div style="padding-right: 10px;">
				<input type="text"
					style="width: 150px; float: left; height: 20px; margin-top: 15px;"
					name="keyword" id="keyword" value="${paging.keyword}">
			</div>
			<div>
				<button style="float: left; height: 20px; margin-top: 15px;"
					name="btnSearch" id="billboard_btnSearch">검색</button>
			</div>
		</div>

		<div class="panel-body">
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>옥상빌보드명</th>
						<th>신주소</th>
						<th>광고면수</th>
						<th>최소 집행조건</th>
						<th>매체사</th>
						<th>개별 업로드</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="BillboardList" items="${viewAll}"
						varStatus="status">
						<tr class="odd gradeX">
							<td id=name${status.index}>${BillboardList.name}</td>
							<td id=roadAddress${status.index}>${BillboardList.roadAddress}</td>
							<td id=adAreaCnt${status.index}>${BillboardList.adAreaCnt}</td>
							<td id=minCondition${status.index}>${BillboardList.minCondition}</td>
							<td id=mediaCompany${status.index}>${BillboardList.mediaCompany}</td>
							<td style="text-align: center; width: 300px;">
								<button onclick="modalValput(${BillboardList.gid})"
									data-toggle="modal" data-target="#introduction_Modal"
									class="btn btn-success"
									style="height: 20px; width: 90px; padding: 0;">미디어소개서</button>
								<button onclick="modalValput(${BillboardList.gid})"
									data-toggle="modal" data-target="#makeingGuide_Modal"
									class="btn btn-success"
									style="height: 20px; width: 90px; padding: 0;">제작 가이드</button>
								<button onclick="modalValput(${BillboardList.gid})"
									data-toggle="modal" data-target="#popupImg_Modal"
									class="btn btn-success"
									style="height: 20px; width: 90px; padding: 0;">팝업이미지</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="display: block; text-align: center;">
				<c:if test="${paging.startPage != 1 }">
					<a class="pg_prev"
						href="popupImg_billboard?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">←
						Previous</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<b class="pg_current">${p }</b>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<a class="pg_page"
								href="popupImg_billboard?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a class="pg_next"
						href="popupImg_billboard?nowPage=${paging.nowPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">Next
						→ </a>
				</c:if>
			</div>
		</div>
	</div>
	<script src="/resources/admin/js/popupMgmt/popupMgmt.js"></script>
</body>
</html>