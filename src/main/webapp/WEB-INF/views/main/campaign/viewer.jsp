<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<head>
<title>DATARGET | 뷰어</title>
<link rel="stylesheet" href="/resources/lib/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="/resources/lib/openlayers/ol.css">
<link rel="stylesheet" href="/resources/lib/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="/resources/main/css/campaign/create_new.css">
<link rel="stylesheet" href="/resources/main/css/viewer.css">
</head>
<body>
	
	<c:set var="mediaList" value="${campaign.medialist }"></c:set>
	<c:set var="facilList" value="${campaign.facillist }"></c:set>
	<c:set var="mediaMixInfo" value="${campaign.mediaMixInfo }"></c:set>
	<input type="hidden" id="minag" name="minag" value="${campaign.minag}">
	<input type="hidden" id="maxag" name="maxag" value="${campaign.maxag}">
	<input type="hidden" id="cpt" name="cpt" value="${campaign.cpt}">
	
	<div id="container">
		<div id="map-area">
			<div id="map" class="map"></div>
			<div id="mapLogo"><img src="/resources/images/intro-logo.png" alt="logo-image"></div>
		</div>
		<div class="create-window shadow">
			<div class="create-window-part absolute-lt" id="info-part">
				<div class="info">
					<div class="info-header">
						<b class="info-title-l">캠페인 뷰어</b> 
					</div>
					<div class="info-body">
						<div>
							<b class="info-title">캠페인명</b><span>${ campaign.cpn }</span>
						</div>
						<div>
							<b class="info-title">광고주</b><span>${ campaign.adv }</span>
						</div>
						<div>
							<b class="info-title">일정</b><span>${ campaign.trm }</span>
						</div>
						<div>
							<b class="info-title">타게팅</b><span><c:choose><c:when test="${ campaign.cpt eq 'every' }">남성+여성</c:when><c:when test="${ campaign.cpt eq 'male' }">남성</c:when><c:when test="${ campaign.cpt eq 'female' }">여성</c:when></c:choose></span><span> ${ campaign.minag }${ campaign.maxag }</span>
						</div>
					</div>
				</div>
			</div>
			<div class="create-inner-window">
				<div class="create-window-part">
					<div class="mix bd-bt-1">
						<div class="info-header">
							<b class="info-title">미디어 믹스</b> 
						</div>
						<div class="info-body">
							<div class="item-list">
								<c:forEach var="i" items="${mediaList }" varStatus="status">
								<c:if test="${fn:length(i.itemList)!=0 }">
								<div class="item" id="mix-idx-${i.index }" onclick="itemAClick(${status.index})">
									<span class="col-5"><span class="unicon"><i class="${i.unicon }"></i></span><span class="m-title">
										<c:if test="${i.dvsnA eq '1' and i.dvsnB eq '1' and fn:length(i.itemList)!=0 }">가로변 버스쉘터</c:if>
										<c:if test="${i.dvsnA eq '1' and i.dvsnB eq '2' and fn:length(i.itemList)!=0 }">중앙차로 버스쉘터</c:if>
										<c:if test="${i.dvsnA eq '1' and i.dvsnB eq '3' and fn:length(i.itemList)!=0 }">택시쉘터</c:if>
										<c:if test="${i.dvsnA eq '2' and i.dvsnB eq '1' and fn:length(i.itemList)!=0 }">PSD</c:if>
										<c:if test="${i.dvsnA eq '2' and i.dvsnB eq '2' and fn:length(i.itemList)!=0 }">GDIA</c:if>
										<c:if test="${i.dvsnA eq '3' and i.dvsnB eq '1' and fn:length(i.itemList)!=0 }">경기광역</c:if>
										<c:if test="${i.dvsnA eq '3' and i.dvsnB eq '2' and fn:length(i.itemList)!=0 }">서울시내</c:if>
										<c:if test="${i.dvsnA eq '4' and i.dvsnB eq '1' and fn:length(i.itemList)!=0 }">포커스미디어</c:if>
										<c:if test="${i.dvsnA eq '4' and i.dvsnB eq '2' and fn:length(i.itemList)!=0 }">타운보드</c:if>
										<c:if test="${i.dvsnA eq '5' and i.dvsnB eq '1' and fn:length(i.itemList)!=0 }">디지털빌보드</c:if>
										<c:if test="${i.dvsnA eq '5' and i.dvsnB eq '2' and fn:length(i.itemList)!=0 }">빌보드</c:if>
										<c:if test="${i.dvsnA eq '5' and i.dvsnB eq '3' and fn:length(i.itemList)!=0 }">빌딩 외벽</c:if>
									</span></span>
									<span class="col-2 text-right quant">
										<c:if test="${i.dvsnA eq '3'}">
											<c:set var="quantity" value="0"></c:set>
											<c:forEach var="j" items="${i.itemList }" varStatus="status">
												<c:set var="quantity" value="${quantity + j.quant }"></c:set>
											</c:forEach>
											${quantity }&nbsp;ea
										</c:if>
										<c:if test="${i.dvsnA ne '3'}">
											${fn:length(i.itemList) }&nbsp;ea
										</c:if>
									</span>
									<span class="col-5 text-right adPriceMonth">미디어 로딩 중</span>
								</div>
								</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="info bd-bt-1">
						<div class="info-header mb-2">
							<b class="info-title">예상 성과</b> 
						</div>
						<div class="info-body">
							<div class="item-list">
								<div class="item-l my-2">
									<span class="col-5"><b>예상 타겟 OTS</b></span>
									<span class="col-7" id="targetOts"></span>
								</div>
								<div class="item-l my-2">
									<span class="col-5"><b>예상 총 OTS</b></span>
									<span class="col-7" id="totalOts"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="info bd-bt-1">
						<div class="info-header flex my-2">
							<b class="info-title px-0 col-5">금액</b> 
							<b class="info-title fc-blue px-0 col-7" id="totalPrice"></b> 
						</div>
						<div class="info-body">
							<div class="item-list">
								<div class="item-l my-2">
									<span class="col-5"><b>광고료</b></span>
									<span class="col-7" id="adPriceMonth"></span>
								</div>
								<div class="item-l my-2">
									<span class="col-5"><b>제작비</b></span>
									<span class="col-7" id="adMakePrice"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="d-flex absolute-lb2" id="decide-part">
			</div>
		</div>
	</div>
	<div class="loading-bg" id="loading">
			<div class="loading">
				<div class="loader">
					<svg class="circular" viewBox="25 25 50 50">
						<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="5" stroke-miterlimit="10"/>
					</svg>
				</div>
			</div>
		</div>
	<div class="create-sub-window shadow">
			<div class="create-window-part absolute-lt" id="sub-part">
				<div class="info pt-3 px-4">
					<div class="info-header overflow-visible mb-2">
						<a class="sub-close my-auto" onclick="ACloseClick()"><i class="fas fa-arrow-left"></i></a>
						<b class="info-title-l py-1 subTitle"></b>
						<!-- <span class="unicon-l unicon-blue"><i class="fas fa-circle"></i></span> -->
					</div>
					<div class="info-body row mx-0 py-3 totalAdInfo">
						<div class="col-7 px-0">
							<b class="info-title minw-30 mr-4 mb-1">미디어</b><span class="subTitle"></span><br>
							<b class="info-title minw-30 mr-4 mb-1">개수</b><span class="quant">0 ea</span><br>
							<b class="info-title minw-30 mr-4 mb-1">광고료</b><span class="adPriceMonth">-</span><br>
							<b class="info-title minw-30 mr-4 mb-1">제작비</b><span class="adMakePrice">-</span><br>
							<b class="info-title minw-30 mr-4 mb-1">예상 타겟 OTS</b><span class="targetOts">-</span><br>
							<b class="info-title minw-30 mr-4 mb-1">예상 총 OTS</b><span class="totalOts">-</span>
						</div>
						<div class="col-5 px-0 totalAdRating">
						<!-- 등급 -->
						</div>
					</div>
				</div>
			</div>
			 <div class="create-sub-inner-window overflow-hidden" >
				<ul class="tabs" id = "ul_Tabs">
					<li class="tab-link current shadow text-center" data-tab="tab-1" id="package">패키지</li>
					<li class="tab-link shadow text-center" data-tab="tab-2" id="each">개별 선택</li>
				</ul>
				<div id="tab-1" class="tab-content current p-0">
					<div class="create-package-window">
						<div class="table-package-body">
							<ul >
							</ul>
						</div>
					</div>
				</div>
				<div id="tab-2" class="tab-content p-0 ">
					<div class="create-sub-tab-window"> 
						<div class="create-window-part ">
							<div class="table-header double-line font-14">
							</div>
							<div class="table-body">
								<ul>
								</ul>
							</div>
						</div>
					</div> 
				</div>
			</div>
		</div>
	<script src="/resources/lib/jquery-ui/jquery-ui.js"></script>
	<script src="/resources/lib/openlayers/ol.js"></script>
	<script src="/resources/lib/pdfjs/html2canvas.js"></script>
	<script src="/resources/lib/pdfjs/jspdf.min.js"></script>
	<script>
		
		var error = "${errorCode}";
		if(error=="CONFLICT_CAMPAIGN"){
			alert("${error}");
			location.href="${redirect}";
		}
		var appR = new Object();
			appR.campaign = ${campaign};
		
		function ACloseClick() {
			subCloseClick();
		}
		
	</script>
	<script src="/resources/main/js/viewer.js"></script>
	<script src="/resources/main/js/map/map2.js"></script>
</body>
</html>

