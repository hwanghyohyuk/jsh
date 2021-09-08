<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<input type="hidden" id="dd" name="dd" value="${CampaignList}">
	<div class="content-box-large">
		<div class="panel-heading">
			<div class="panel-title" style="font-size: 30px;">캠페인 목록 - 종료</div>
		</div>

		<div class="submenubtn"
			style="margin: 50px 0px 10px 0px; padding-left: 15px;">
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt'">생성중</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt_reservation'">예약중</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt_review'">매체검토</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt_confirm'">캠페인확정</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt_inspection'">소재검수</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt_progrees'">진행중</button>
			<button class="btn btn-primary"
				style="background-color: white; color: black; pointer-events: none;">종료</button>
		</div>

		<div class="panel-body">
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered" id="campaign">
				<thead>
					<tr>
						<th>예약일</th>
						<th>예약자</th>
						<th>캠페인 이름</th>
						<th>광고주</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>진행단계</th>
						<th>파일 업로드</th>
						<th>미디어보기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="CampaignList" items="${CampaignList}"
						varStatus="status">
						<tr>
							<td>${CampaignList.cDt}</td>
							<td id=uId${status.index}>${CampaignList.uId}</td>
							<td style="font-weight: bold;"><a style="cursor: pointer;"
								onclick="userCampaign(<c:out value="${status.index}"/>);">${CampaignList.cTit}</a>
								<input type="hidden" id=mediacCtxt${status.index}
								name="mediacCtxt" value="${CampaignList.cCtxt}"></td>
							<td>${CampaignList.cAdvr}</td>
							<td>${CampaignList.sDt}</td>
							<td>${CampaignList.eDt}</td>
							<td><input type="hidden" id=cCtxt${status.index}
								name="cCtxt" value="${CampaignList.cCtxt}"> <select
								id=index${status.index} name="cPrgsStts">
									<option value=0 selected disabled hidden>${CampaignList.prgss}</option>
									<option value=1>생성중</option>
									<option value=2>예약중</option>
									<option value=3>매체검토</option>
									<option value=4>캠페인확정</option>
									<option value=5>소재검수</option>
									<option value=6>진행중</option>
									<option value=7>종료</option>
							</select> <a href="#"
								onclick="changePrgss(<c:out value="${status.index}"/>);">변경하기</a>
							</td>
							<td style="text-align: center;"><a href="#"
								data-toggle="modal" data-target="#FileModal"
								data-uid="${CampaignList.cCtxt }" class="btn btn-success"
								style="width: 90px; height: 23px; padding: 0;">게첨이미지</a> <a
								href="#" data-toggle="modal" data-target="#campaignpptUpload"
								data-uid="${CampaignList.cCtxt }" class="btn btn-danger"
								style="width: 90px; height: 23px; padding: 0;">게재보고서</a></td>
							<td><a
								href="/admin/campaignMgmtMedia?cCtxt=${CampaignList.cCtxt}"
								id="media"
								style="background-color: lavender; font-weight: normal;">미디어
									보기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="content-box-large">
		<div class="panel-heading">
			<div class="panel-title" style="font-size: 30px;">캠페인 연장요청 대기</div>
		</div>
		<div class="panel-body">
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered" id="campaign">
				<thead>
					<tr>
						<th>예약자</th>
						<th>캠페인 이름</th>
						<th>광고주</th>
						<th>시작일</th>
						<th>예정 종료일</th>
						<th>연장 종료일</th>
						<th>승인 처리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ExtentionList" items="${ExtentionList}"
						varStatus="status">
						<tr class="odd gradeX">
							<td id=uId${status.index}>${ExtentionList.reqAdvr}</td>
							<td style="font-weight: bold;">${ExtentionList.cTit} <input
								type="hidden" id="mediacCtxt" name="mediacCtxt"
								value="${ExtentionList.cCtxt}"> <a
								href="/admin/campaignMgmtMedia?cCtxt=${ExtentionList.cCtxt}"
								id="media"
								style="background-color: lavender; font-weight: normal;">미디어
									보기</a>
							</td>
							<td>${ExtentionList.cAdvr}</td>
							<td>${ExtentionList.sDt}</td>
							<td style="color: #aaaaaa; font-weight: bold;">${ExtentionList.bDate}</td>
							<td style="color: #1847ff; font-weight: bold;">${ExtentionList.nDate}</td>
							<td><a class="cmp_extension" data-toggle="modal"
								data-target="#ExtentionModal"
								data-uid="${ExtentionList.reqAdvr }"
								data-cCtxt="${ExtentionList.cCtxt }"
								onclick="prcExt('${ExtentionList.rNo}','${ExtentionList.reqAdvr }', '${ExtentionList.cTit}', '${ExtentionList.cCtxt }','${ExtentionList.nDate}')">변경하기</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 캠페인 연장 Modal -->
	<div class="modal fade" id="ExtentionModal" tabindex="-1" role="dialog"
		data-backdrop="static" data-keyboard="false"
		aria-labelledby="inquireModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="inquireModalLabel">연장하기</h4>
				</div>
				<form class="modal-body"
					style="width: 85%; padding: 30px 0 0 0; margin: 0 auto;">
					<div class="form-group">
						<label for="reqAdvr">요청자</label> <input type="text"
							class="form-control" id="reqAdvr" name="reqAdvr"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="cTit">캠페인</label> <input type="text"
							class="form-control" id="cTit" name="cTit" readonly="readonly">
						<input type="hidden" id="cCtxt" name="cCtxt"> <input
							type="hidden" id="nDate" name="nDate"> <input
							type="hidden" id="rNo" name="rNo">
					</div>
					<div class="form-group">
						<label for="prgsStts">연장 처리</label> <select class="form-control"
							id="prgsStts" name="prgsStts">
							<option value="S">승인</option>
							<option value="R">반려 처리</option>
						</select>
					</div>
					<div class="form-group">
						<label for="resReject">반려 사유</label>
						<textarea class="form-control" rows="3" id="resReject"
							name="resReject" readonly="readonly"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="ExtensionSubmit();"
							class="btn btn-secondary mx-auto">검토 완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="/resources/admin/js/campaignMgmt/campaignMgmt.js"></script>
</body>
</html>