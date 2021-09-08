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
			<div class="panel-title" style="font-size: 30px;">택시 쉘터</div>
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
				style="background-color: white; color: black; pointer-events: none;">택시
				쉘터</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_psd'">PSD</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_gdia'">GDIA</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='mediaMgmt_bus'">버스래핑(경기)</button>
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
			<a href="#" data-toggle="modal" data-target="#ShelterExcelupload"
				class="btn btn-success" style="float: right"><i
				class="glyphicon glyphicon-file"></i>미디어 추가</a>
		</div>
		<div style="float: left; padding-left: 15px; padding-top: 15px;">
			<select id="cntPerPage" name="sel" onchange="shelter3_selChange()">
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
					name="btnSearch" id="shelter3_btnSearch">검색</button>
			</div>
		</div>
		<div class="panel-body">
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>정류소명</th>
						<th>쉘터분류</th>
						<th>쉘터ID</th>
						<th>자치구</th>
						<th>도로명</th>
						<th>타입</th>
						<th>등급</th>
						<th>제안면</th>
						<th>조명</th>
						<th>월 광고료</th>
						<th>제작비</th>
						<th>내경</th>
						<th>외경</th>
						<th>변경,삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ShelterList" items="${viewAll}" varStatus="status">
						<tr class="odd gradeX">
							<td id=shelterNm${status.index}>${ShelterList.shelterNm}</td>
							<td id=shelterDvsnNm${status.index}>${ShelterList.shelterDvsnNm}</td>
							<td id=mediaId${status.index}>${ShelterList.mediaId}</td>
							<td id=sggNm${status.index}>${ShelterList.sggNm}</td>
							<td id=emdNm${status.index}>${ShelterList.emdNm}</td>
							<td id=adType${status.index}>${ShelterList.adType}</td>
							<td id=adRating${status.index}>${ShelterList.adRating}</td>
							<td id=sugArea${status.index}>${ShelterList.sugArea}</td>
							<td id=lighting${status.index}>${ShelterList.lighting}</td>
							<td id=adPriceMonth${status.index}>${ShelterList.adPriceMonth}</td>
							<td id=adMakePrice${status.index}>${ShelterList.adMakePrice}</td>
							<td id=innerSize${status.index}>${ShelterList.innerSize}</td>
							<td id=outerSize${status.index}>${ShelterList.outerSize}<input
								type="hidden" id=gid${status.index} name="gid"
								value="${ShelterList.gid}"></td>
							<th style="text-align: center;">
								<button class="btn btn-info"
									style="width: 55px; height: 20px; padding: 0;"
									onclick="shelter_dbupdate(<c:out value="${status.index}"/>);">
									<i class="glyphicon glyphicon-refresh"></i>변경
								</button>
								<button class="btn btn-danger"
									style="width: 55px; height: 20px; padding: 0;"
									onclick="shelter_dbdelete(<c:out value="${status.index}"/>);">
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
						href="mediaMgmt_shelter3?nowPage=${paging.nowPage - 1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">←
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
								href="mediaMgmt_shelter3?nowPage=${p }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<a class="pg_next"
						href="mediaMgmt_shelter3?nowPage=${paging.nowPage+1 }&cntPerPage=${paging.cntPerPage}&keyword=${paging.keyword}">Next
						→ </a>
				</c:if>
			</div>
		</div>
	</div>
	<script src="/resources/admin/js/mediaMgmt/mediaMgmt.js"></script>
</body>
</html>

