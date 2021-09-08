<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<body>
	<input type="hidden" value="${returnList}">

	<c:if test="${returnList == '[]' }">
		<div class="content-box-large">
			<div class="panel-body">
				<p style="font-size: 25px;">해당 캠페인에 예약된 미디어가 없습니다</p>
			</div>
		</div>
	</c:if>

	<c:if test="${buyMedia.shelter == 'Y' }">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title" style="font-size: 30px;">쉘터</div>
			</div>
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="example">
					<thead>
						<tr>
							<th>정류소명</th>
							<th>쉘터분류</th>
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
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ShelterList" items="${returnList}">
							<c:if test="${ShelterList.type == 'shelter' }">
								<tr class="odd gradeX">
									<td>${ShelterList.shelterNm}</td>
									<td>${ShelterList.shelterDvsnNm}</td>
									<td>${ShelterList.sggNm}</td>
									<td>${ShelterList.emdNm}</td>
									<td>${ShelterList.adType}</td>
									<td>${ShelterList.adRating}</td>
									<td>${ShelterList.sugArea}</td>
									<td>${ShelterList.lighting}</td>
									<td>${ShelterList.adPriceMonth}</td>
									<td>${ShelterList.adMakePrice}</td>
									<td>${ShelterList.innerSize}</td>
									<td>${ShelterList.outerSize}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${buyMedia.psd == 'Y' }">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title" style="font-size: 30px;">PSD</div>
			</div>
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="examplePSD">
					<thead>
						<tr>
							<th>호선</th>
							<th>PSD역사</th>
							<th>타입</th>
							<th>월광고료</th>
							<th>제작비</th>
							<th>월평균승하차</th>
							<th>패키지</th>
							<th>매체사</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="PsdList" items="${returnList}">
							<c:if test="${PsdList.type == 'psd' }">
								<tr class="odd gradeX">
									<td>${PsdList.line}</td>
									<td>${PsdList.psdMetro}</td>
									<td>${PsdList.psdType}</td>
									<td>${PsdList.adPriceMonth}</td>
									<td>${PsdList.adMakePrice}</td>
									<td>${PsdList.avgInoutMonth}</td>
									<td>${PsdList.adPackage}</td>
									<td>${PsdList.operationCompany}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${buyMedia.gdia == 'Y' }">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title" style="font-size: 30px;">GDIA</div>
			</div>
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="exampleGDIA">
					<thead>
						<tr>
							<th>호선</th>
							<th>등급</th>
							<th>역명</th>
							<th>미디어</th>
							<th>수량</th>
							<th>단가</th>
							<th>월광고료</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="GdiaList" items="${returnList}">
							<c:if test="${GdiaList.type == 'gdia' }">
								<tr class="odd gradeX">
									<td>${GdiaList.line}</td>
									<td>${GdiaList.adRating}</td>
									<td>${GdiaList.stationNm}</td>
									<td>${GdiaList.mediaType}</td>
									<td>${GdiaList.quantity}</td>
									<td>${GdiaList.unitPrice}</td>
									<td>${GdiaList.adPriceMonth }</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${buyMedia.bus == 'Y' }">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title" style="font-size: 30px;">버스래핑</div>
			</div>
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="exampleBUS">
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
							<th>운영버스</th>
							<th>매체사</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="BusList" items="${returnList}">
							<c:if test="${BusList.type == 'bus' }">
								<tr class="odd gradeX">
									<td>${BusList.routeNo}</td>
									<td>${BusList.adRating}</td>
									<td>${BusList.busDvsnNm}</td>
									<td>${BusList.startPoint}</td>
									<td>${BusList.endPoint}</td>
									<td>${BusList.adPriceMonth}</td>
									<td>${BusList.adMakePrice}</td>
									<td>${BusList.operationCompany}</td>
									<td>${BusList.startTime}</td>
									<td>${BusList.endTime}</td>
									<td>${BusList.allocInterval}</td>
									<td>${BusList.operationBus}</td>
									<td>${BusList.mediaCompany }</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${buyMedia.mediaboard == 'Y' }">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title" style="font-size: 30px;">포커스 미디어</div>
			</div>
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="exampleMEDIABOARD">
					<thead>
						<tr>
							<th>건물유형</th>
							<th>단지명</th>
							<th>주소</th>
							<th>등급</th>
							<th>세대수</th>
							<th>하프-1 패널수</th>
							<th>하프-2 패널수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="MediaboardList" items="${returnList}">
							<c:if test="${MediaboardList.type == 'mediaboard' }">
								<tr class="odd gradeX">
									<td>${MediaboardList.bdType}</td>
									<td>${MediaboardList.cplxNm}</td>
									<td>${MediaboardList.address}</td>
									<td>${MediaboardList.adRating}</td>
									<td>${MediaboardList.householdsCnt}</td>
									<td>${MediaboardList.half1PanelCnt}</td>
									<td>${MediaboardList.half2PanelCnt}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${buyMedia.townboard == 'Y' }">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title" style="font-size: 30px;">타운 보드</div>
			</div>
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="exampleTOWNBOARD">
					<thead>
						<tr>
							<th>구분</th>
							<th>아파트명</th>
							<th>주소</th>
							<th>패널수</th>
							<th>세대수</th>
							<th>음향</th>
							<th>분할화면</th>
							<th>월 보장 노출수</th>
							<th>월 단가1(일100회,15초)</th>
							<th>월광고비1</th>
							<th>월 단가2(일100회,30초)</th>
							<th>월광고비2</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="TownboardList" items="${returnList}">
							<c:if test="${TownboardList.type == 'townboard' }">
								<tr class="odd gradeX">
									<td>${TownboardList.bdType}</td>
									<td>${TownboardList.aptNm}</td>
									<td>${TownboardList.address}</td>
									<td>${TownboardList.panelCnt}</td>
									<td>${TownboardList.householdsCnt}</td>
									<td>${TownboardList.adSound}</td>
									<td>${TownboardList.splitScreen}</td>
									<td>${TownboardList.minImpressions}</td>
									<td>${TownboardList.perMonth1}</td>
									<td>${TownboardList.adPriceMonth1}</td>
									<td>${TownboardList.perMonth2}</td>
									<td>${TownboardList.adPriceMonth2}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>


	<c:if test="${buyMedia.edisplay == 'Y' }">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title" style="font-size: 30px;">디지털 빌보드</div>
			</div>
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="exampleEDISPLAY">
					<thead>
						<tr>
							<th>전광판명</th>
							<th>주소</th>
							<th>크기</th>
							<th>표출 사양</th>
							<th>월광고료</th>
							<th>운영 시간</th>
							<th>매체사</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="EdisplayList" items="${returnList}">
							<c:if test="${EdisplayList.type == 'edisplay' }">
								<tr class="odd gradeX">
									<td>${EdisplayList.name}</td>
									<td>${EdisplayList.address}</td>
									<td>${EdisplayList.size}</td>
									<td>${EdisplayList.spec}</td>
									<td>${EdisplayList.adPriceMonth}</td>
									<td>${EdisplayList.operationTime}</td>
									<td>${EdisplayList.mediaCompany }</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${buyMedia.bilboard == 'Y' }">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title" style="font-size: 30px;">빌보드</div>
			</div>
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="exampleBILBOARD">
					<thead>
						<tr>
							<th>옥상빌보드명</th>
							<th>신주소</th>
							<th>광고면수</th>
							<th>전면크기</th>
							<th>좌면크기</th>
							<th>우면크기</th>
							<th>후면크기</th>
							<th>월광고료</th>
							<th>제작비</th>
							<th>최소 집행조건</th>
							<th>매체사</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="BillboardList" items="${returnList}">
							<c:if test="${BillboardList.type == 'bilboard' }">
								<tr class="odd gradeX">
									<td>${BillboardList.name}</td>
									<td>${BillboardList.roadAddress}</td>
									<td>${BillboardList.adAreaCnt}</td>
									<td>${BillboardList.frontSize}</td>
									<td>${BillboardList.leftsideSize}</td>
									<td>${BillboardList.rightsideSize}</td>
									<td>${BillboardList.backSize}</td>
									<td>${BillboardList.adPriceMonth}</td>
									<td>${BillboardList.adMakePrice}</td>
									<td>${BillboardList.minCondition}</td>
									<td>${BillboardList.mediaCompany}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<c:if test="${buyMedia.outerwall == 'Y' }">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title" style="font-size: 30px;">빌딩 외벽</div>
			</div>
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="exampleOUTERWALL">
					<thead>
						<tr>
							<th>건물명</th>
							<th>구분</th>
							<th>주소</th>
							<th>타입</th>
							<th>소재</th>
							<th>조명여부</th>
							<th>설치수량</th>
							<th>기간</th>
							<th>광고료</th>
							<th>제작비</th>
							<th>크기</th>
							<th>매체사</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="OuterwallList" items="${returnList}">
							<c:if test="${OuterwallList.type == 'outerwall' }">
								<tr class="odd gradeX">
									<td>${OuterwallList.bdNm}</td>
									<td>${OuterwallList.acptLawDvsnNm}</td>
									<td>${OuterwallList.roadAddress}</td>
									<td>${OuterwallList.adType}</td>
									<td>${OuterwallList.material}</td>
									<td>${OuterwallList.lighting}</td>
									<td>${OuterwallList.installQt}</td>
									<td>${OuterwallList.term}</td>
									<td>${OuterwallList.adPrice}</td>
									<td>${OuterwallList.adMakePrice}</td>
									<td>${OuterwallList.size}</td>
									<td>${OuterwallList.mediaCompany}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
	<script src="/resources/admin/js/CampaignMgmt/CampaignMgmt.js"></script>
</body>
</html>