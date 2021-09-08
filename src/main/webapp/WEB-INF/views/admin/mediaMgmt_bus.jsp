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
			<div class="panel-title" style="font-size: 30px;">버스래핑</div>
		</div>
		<div class="submenubtn"
			style="margin: 50px 0px 10px 0px; padding-left: 15px;">
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_shelter'">가로변버스
				쉘터</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_shelter2'">중앙차로
				쉘터</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_shelter3'">택시
				쉘터</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_psd'">PSD</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_gdia'">GDIA</button>
			<button class="btn btn-primary"
				style="background-color: white; color: black; pointer-events: none;">버스래핑(경기)</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_bus2'">버스래핑(서울)</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_mediaboard'">포커스미디어</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_townboard'">타운보드</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_edisplay'">디지털빌보드</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_billboard'">빌보드</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_outerwall'">빌딩외벽</button>
			<a href="#" data-toggle="modal" data-target="#BusExcelupload"
				class="btn btn-success" style="float: right"><i
				class="glyphicon glyphicon-file"></i>미디어 추가</a>
		</div>

		<div style="float: left; padding-left: 15px; padding-top: 15px;">
			<select id="cntPerPage" name="sel" onchange="bus_selChange()">
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
					name="btnSearch" id="bus_btnSearch">검색</button>
			</div>
		</div>

		<div class="panel-body">
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>버스번호</th>
						<th>등급</th>
						<th>구분</th>
						<th>시작점</th>
						<th>종점</th>
						<th>월 광고료</th>
						<th>제작비</th>
						<th>운영사</th>
						<th>첫차</th>
						<th>막차</th>
						<th>배차</th>
						<th>운영대수</th>
						<th>매체사</th>
						<th>변경,삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="BusList" items="${viewAll}" varStatus="status">
						<tr class="odd gradeX">
							<td id=routeNo${status.index}>${BusList.routeNo}</td>
							<td id=adRating${status.index}>${BusList.adRating}</td>
							<td id=busDvsnNm${status.index}>${BusList.busDvsnNm}</td>
							<td id=startPoint${status.index}>${BusList.startPoint}</td>
							<td id=endPoint${status.index}>${BusList.endPoint}</td>
							<td id=adPriceMonth${status.index}>${BusList.adPriceMonth}</td>
							<td id=adMakePrice${status.index}>${BusList.adMakePrice}</td>
							<td id=operationCompany${status.index}>${BusList.operationCompany}</td>
							<td id=startTime${status.index}>${BusList.startTime}</td>
							<td id=endTime${status.index}>${BusList.endTime}</td>
							<td id=allocInterval${status.index}>${BusList.allocInterval}</td>
							<td id=operationBus${status.index}>${BusList.operationBus}</td>
							<td id=mediaCompany${status.index}>${BusList.mediaCompany }<input
								type="hidden" id=gid${status.index} name="gid"
								value="${BusList.gid}"></td>
							<th style="text-align: center;">
								<button class="btn btn-info"
									style="width: 55px; height: 20px; padding: 0;"
									onclick="bus_dbupdate(<c:out value="${status.index}"/>);">
									<i class="glyphicon glyphicon-refresh"></i>변경
								</button>
								<button class="btn btn-danger"
									style="width: 55px; height: 20px; padding: 0;"
									onclick="bus_dbdelete(<c:out value="${status.index}"/>);">
									<i class="glyphicon glyphicon-remove"></i>삭제
								</button>
							</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="display: block; text-align: center;">
				<c:if test="${paging.startPage != 1 }">
					<a class="pg_prev"
						href="mediaMgmt_bus?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">←
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
								href="mediaMgmt_bus?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a class="pg_next"
						href="mediaMgmt_bus?nowPage=${paging.nowPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">Next
						→ </a>
				</c:if>
			</div>
		</div>
	</div>
	<script src="/resources/admin/js/mediaMgmt/mediaMgmt.js"></script>
</body>
</html>