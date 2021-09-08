<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<body>
	<input type="hidden" id="dd" name="dd" value="${CampaignList}">
	<div class="content-box-large">
		<div class="panel-heading">
			<div class="panel-title" style="font-size: 30px;">캠페인 목록 - 예약중</div>
		</div>

		<div class="submenubtn"
			style="margin: 50px 0px 10px 0px; padding-left: 15px;">
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt'">생성중</button>
			<button class="btn btn-primary"
				style="background-color: white; color: black; pointer-events: none;">예약중</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt_review'">매체검토</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt_confirm'">캠페인확정</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt_inspection'">소재검수</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt_progrees'">진행중</button>
			<button class="btn btn-primary"
				onclick="javascript:location.href='campaignMgmt_end'">종료</button>
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
	<script src="/resources/admin/js/campaignMgmt/campaignMgmt.js"></script>
</body>
</html>