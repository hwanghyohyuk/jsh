<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<head>
<title>DATARGET | 캠페인 목록</title>
<link rel="stylesheet" href="/resources/main/css/campaign/campaign.css">
<style>
.paging{
	font-size:16px !important;
}
div#generating_cardgrid, div#reservation_cardgrid, div#progress_cardgrid, div#end_cardgrid{
   	white-space: nowrap;
   	overflow-x: scroll;
}



</style>
</head>
<body>
<div class="container">
	<div class="mt-5 mb-5">
		<h6 class="silkasemibold">Campaign status</h6>
		<div class="card pt-3 mov-card">
			<div class="card-body p-0">
				<div class="row ml-0 mr-0">
					<c:forEach var="i" varStatus="s" items="${campaignStatus }">
					<div class="col p-0 mov-prib" id="${i.prgsStts}">
						<c:if test="${!s.last }">
							<div class="p-3 py-4 mov-pri shadow">
						</c:if>
						<c:if test="${s.last }">
							<div class="p-3 py-4 mov-pri shadow border-radius-tr">
						</c:if>
						<c:choose>
							<c:when test="${i.prgsStts eq '1-creating'}">
								<div class="float-left rounded-circle ml-3 mr-3 i-creating">
								</div>
								<div class="float-left ml-3">
									<span class="fs-title">생성중인 캠페인</span><br> <b class="fs-big silkabold">${i.cnt}</b><c:if test="${i.isNw gt 0}"><span class="ml-2 is-new">new</span></c:if>
								</div>
							</c:when>
							<c:when test="${i.prgsStts eq '2-booking'}">
								<div class="float-left rounded-circle ml-3 mr-3 i-booking">
								</div>
								<div class="float-left ml-3">
									<span class="fs-title">예약중인 캠페인</span><br> <b class="fs-big silkabold">${i.cnt}</b><c:if test="${i.isNw gt 0}"><span class="ml-2 is-new">new</span></c:if>
								</div>
							</c:when>
							<c:when test="${i.prgsStts eq '3-progressing'}">
								<div class="float-left rounded-circle ml-3 mr-3 i-progressing">
								</div>
								<div class="float-left ml-3">
									<span class="fs-title">진행중인 캠페인</span><br> <b class="fs-big silkabold">${i.cnt}</b><c:if test="${i.isNw gt 0}"><span class="ml-2 is-new">new</span></c:if>
								</div>
							</c:when>
							<c:when test="${i.prgsStts eq '4-finished'}">
								<div class="float-left rounded-circle ml-3 mr-3 i-finished">
								</div>
								<div class="float-left ml-3">
									<span class="fs-title">종료된 캠페인</span><br> <b class="fs-big silkabold">${i.cnt}</b><c:if test="${i.isNw gt 0}"><span class="ml-2 is-new">new</span></c:if>
								</div>
							</c:when>
						</c:choose>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-5 mb-5 fs-14">
		<div class="row">
			<div class="col-8">
				<h6 class="silkasemibold">Campaign list</h6>
			</div>
			<div class="col-4">
				<a class="btn btn-link btn-sm float-right" id="type-list"><i
					class="fas fa-list"></i></a> <a
					class="btn btn-link btn-sm float-right mr-1" id="type-grid"><i
					class="fas fa-th-large"></i></a>
			</div>
		</div>

		<hr class="mt-1">
		<div class="view list-type"  style="display: none">
		<table class="table bg-white shadow border-radius-tr" id="list">
			<colgroup>
				<col width="135px">
				<col width="150px">
				<col width="165px">
				<col width="155px">
				<col width="130px">
				<col width="125px">
				<col width="125px">
				<col width="85px">
				<col width="110px">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">상태</th>
					<th scope="col">캠페인</th>
					<th scope="col">브랜드</th>
					<th scope="col">일정</th>
					<th scope="col">예산(원)</th>
					<th scope="col">예상 총 OTS</th>
					<th scope="col">예상 타겟 OTS</th>
					<th scope="col">생성일</th>
					<th scope="col">최종 수정일</th>
					<th scope="col">컨텍스트</th>
					<th scope="col">진행상태</th>
				</tr>
			</thead>
		</table>
		</div>
		<div class="view grid-type" style="display: none">
			<div id="generating">
				<div class="listtitle"><div class="campaign-status status-creating" style="margin-top:9px;"></div>생성중인 캠페인</div>
					<div class="card pt-3 mov-card">
						<div class="card-body p-0">
							<div class="row ml-0 mr-0" >
								<div id="generating_cardgrid" class="col p-0 card-mov-prib ">
<%-- 								<c:forEach var="i" varStatus="s" items="${campaignStatus }"> --%>
									<c:forEach var="j" begin="0" end="${campaignStatus[0].cnt}">
										<div id="draggable-element c-${j}" class ="draggable-element" style="margin-bottom:10px"></div>
									</c:forEach>
<%-- 								</c:forEach> --%>
								</div>
							</div>
						</div>
					</div>
				</div><br>
				<div id="reservation">
					<div class="listtitle"><div class="campaign-status status-booking" style="margin-top:9px"></div>예약중인 캠페인</div>
					<div class="card pt-3 mov-card">
						<div class="card-body p-0">
							<div class="row ml-0 mr-0" >
								<div id="reservation_cardgrid" class="col p-0 card-mov-prib">
									<c:forEach var="j" begin="0" end="${campaignStatus[1].cnt}">
										<div id="draggable-element r-${j}" class ="draggable-element" style="margin-bottom:10px"></div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div><br>
				<div id="progress">
					<div class="listtitle"><div class="campaign-status status-progressing" style="margin-top:9px;"></div>진행중인 캠페인</div>
					<div class="card pt-3 mov-card">
						<div class="card-body p-0">
							<div class="row ml-0 mr-0" >
								<div id="progress_cardgrid" class="col p-0 card-mov-prib">
									<c:forEach var="j" begin="0" end="${campaignStatus[2].cnt}">
										<div id="draggable-element p-${j}" class ="draggable-element" style="margin-bottom:10px"></div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div><br>
				<div id="end">
					<div class="listtitle"><div class="campaign-status status-finished" style="margin-top:9px;"></div>종료된 캠페인</div>
					<div class="card pt-3 mov-card">
						<div class="card-body p-0">
							<div class="row ml-0 mr-0" >
								<div id="end_cardgrid" class="col p-0 card-mov-prib">
									<c:forEach var="j" begin="0" end="${campaignStatus[3].cnt}">
										<div id="draggable-element e-${j}" class ="draggable-element" style="margin-bottom:10px"></div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div><br>
			</div>
		</div>
	</div>
	
	<!-- url공유 Modal -->
<div class="modal fade" id="copyUrlModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="copyUrlModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="copyUrlModalLabel">캠페인 공유하기</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="text-align:center;">
				<input id="texturl" type="text" style="width:380px;">
			</div>
			<div class="modal-footer">
				<button type="button" onclick="copy_to_clipboard()" class="btn btn-secondary mx-auto">URL 복사하기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="deleteModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="deleteModalLabel"></h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="text-align:center;">
				<h4>선택된 캠페인을 영구 삭제할까요?</h4>
				<p>삭제된 캠페인은 다시 사용할 수 없습니다.</p>				
			</div>
			<div class="modal-footer px-auto">
				<div class="mx-auto w-50">
				<button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-secondary w-49">취소</button>
				<button type="button" onclick="dropCampaign()" class="btn btn-danger w-49">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/resources/lib/dragandshift/dragandshift.js"></script>
<script type="text/javascript">
	var app = new Object();
	app.jObj = ${jObj};
	
    $(function() {
        $('.draggable-element').arrangeable();
//         $('.draggable-element').arrangeable ({scroll: true, scrollSensitivity: 100});
//         $('.draggable-element').arrangeable ({scroll: true, scrollSpeed: 100});


    });
</script>
<script src="/resources/main/js/campaign/campaign_drag_version.js"></script>

</body>