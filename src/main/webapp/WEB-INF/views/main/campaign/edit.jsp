<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>DATARGET | 새 캠페인</title>
<link rel="stylesheet" href="/resources/lib/daterangepicker/daterangepicker.css">
<link rel="stylesheet"href="/resources/lib/jquery-ui/jquery-ui.css">
<link rel="stylesheet" href="/resources/lib/openlayers/ol.css">
<link rel="stylesheet"
	href="/resources/main/css/campaign/create_new.css">
</head>
<body>
	<input type="hidden" id="cpt" name="cpt" value="${ params.cpt }">
	<div id="container">
		<div id="map-area">
			<div id="map" class="map"></div>
			<div id="mapLogo"><img src="/resources/images/intro-logo.png" alt="logo-image"></div>
			<div style="display: none;">
				<!-- Popup -->
				<div id="popup"></div>
				<!-- miniPop -->
				<div id="miniPop"></div>
		    </div>
		</div>
		<div class="create-window shadow">
			<div class="create-window-part absolute-lt" id="info-part">
				<div class="info">
					<div class="info-header">
						<b class="info-title-l w-75">
						<input type="text" class="changeable input-none color-000 tfont w-100 show" id="campaignName" value="${campaignMap.cTit }" placeholder="캠페인 제목을 입력해주세요.">
						</b>
						<a class="btn btn-context-menu"><i class="fas fa-ellipsis-v"></i></a>
					</div>
					<div class="info-body">
						<div>
							<b class="info-title">광고주</b>
							<span class="w-70">
							<input type="text" class="changeable input-none color-505050 dfont w-70 show" id="advertiser"  value="${campaignMap.cAdvr }" placeholder="광고주를 입력해주세요.">
							</span>
						</div>
						<div>
							<b class="info-title">일정</b>
							<input type="text" name="campaignTerm" placeholder="0000.00.00~0000.00.00" class="input-none color-505050 dfont w-70" id="campaignTerm" readonly="readonly" value="${campaignMap.sDt } - ${campaignMap.eDt }" />
						</div>
					</div>
				</div>
			</div>
			<c:if test="${params.sug eq 'true'}">
				<!-- 자동 -->
				<div class="create-inner-window">
					<div class="create-window-part">
						<div class="collapse" id="target-modify">
							<div class="custom-control custom-radio text-center mb-3">
								<div class="col-4 float-left">
									<input type="radio" name="targetRadio" id="targetRadio-1"
										class="custom-control-input" value="every" checked="checked">
									<label class="custom-control-label" for="targetRadio-1">남성+여성</label>
								</div>
								<div class="col-4 float-left">
									<input type="radio" name="targetRadio" id="targetRadio-2"
										class="custom-control-input" value="male"> <label
										class="custom-control-label" for="targetRadio-2">남성</label>
								</div>
								<div class="col-4 float-left">
									<input type="radio" name="targetRadio" id="targetRadio-3"
										class="custom-control-input" value="female"> <label
										class="custom-control-label" for="targetRadio-3">여성</label>
								</div>
							</div>
							<p class="input-group mb-4">
								<b class="py-2 mr-5">연령 설정</b> <input type="number"
									name="minTargetAge" id="minTargetAge"
									class="form-control input-underline text-center" min="0"
									max="100" value="0" step="5"> <span
									class="form-control input-none text-center">~</span> <input
									type="number" name="maxTargetAge" id="maxTargetAge"
									class="form-control input-underline text-center" min="0"
									max="100" value="0" step="5">
							</p>
							<div class="row m-0">
								<div class="col"><button class="btn btn-white btn-no-radius w-100 font-11">타게팅 수정하기</button></div>
								<div class="col"><button class="btn btn-white btn-no-radius w-100 font-11">취소</button></div>
							</div>
						</div>
						<div class="strategy-list">
							<div class="strategy-item">
								<div class="hover">
									<div class="strategy-header">
										<b>타겟 노출 극대화 전략</b>
									</div>
									<div class="strategy-body">
										<div class="mb-2">
											<b class="item-title minw-30 mr-4">예상 타겟 OTS</b><span>9,999,999,999</span>
										</div>
										<div class="mb-2">
											<b class="item-title minw-30 mr-4">예상 총 OTS</b><span>9,999,999,999</span>
										</div>
										<div class="">
											<b class="item-title minw-30 mr-4">광고료</b><span>9,999,999,999</span>
										</div>
									</div>
								</div>
								<div class="strategy-footer collapse">
									<div class="item-list">
										<div class="item">
 											<span class="unicon unicon-red"></span> 가로변 버스쉘터 <span 
												class="float-right ml-2"><i class="fas fa-times"></i></span>
											<span class="float-right ml-2"><i class="fas fa-bars"></i></span>
											<span class="float-right">3ea</span>
										</div>
										<div class="item">
											<span class="unicon unicon-blue"></span> 가로변 버스쉘터 <span
												class="float-right ml-2"><i class="fas fa-times"></i></span>
											<span class="float-right ml-2"><i class="fas fa-bars"></i></span>
											<span class="float-right">3ea</span>
										</div>
									</div>
									<div class="row m-0 py-2">
										<div class="col"><button class="btn btn-white btn-no-radius w-100 font-11">전략 상세 편집</button></div>
										<div class="col"><button class="btn btn-primary btn-no-radius w-100 font-11">바로 예약하기</button></div>
									</div>
								</div>
								<div class="strategy-collapse">
									<button class="btn collapsed"><i class="fas fa-chevron-down"></i></button>
								</div>
							</div>
							<div class="strategy-item">
								<div class="hover">
									<div class="strategy-header">
										<b>타겟 거점 DOMINATION 전략</b>
									</div>
									<div class="strategy-body">
										<div class="mb-2">
											<b class="item-title minw-30 mr-4">예상 타겟 OTS</b><span>9,999,999,999</span>
										</div>
										<div class="mb-2">
											<b class="item-title minw-30 mr-4">예상 총 OTS</b><span>9,999,999,999</span>
										</div>
										<div class="">
											<b class="item-title minw-30 mr-4">광고료</b><span>9,999,999,999</span>
										</div>
									</div>
								</div>
								<div class="strategy-footer collapse">
									<div class="item-list">
										<div class="item pl-4 pr-3 py-2">
											<span class="unicon unicon-red"></span> 가로변 버스쉘터 <span
												class="float-right ml-2"><i class="fas fa-times"></i></span>
											<span class="float-right ml-2"><i class="fas fa-bars"></i></span>
											<span class="float-right">3ea</span>
										</div>
										<div class="item pl-4 pr-3 py-2">
											<span class="unicon unicon-blue"></span> 가로변 버스쉘터 <span
												class="float-right ml-2"><i class="fas fa-times"></i></span>
											<span class="float-right ml-2"><i class="fas fa-bars"></i></span>
											<span class="float-right">3ea</span>
										</div>
									</div>
									<div class="row m-0 py-2">
										<div class="col"><button class="btn btn-white btn-no-radius w-100 font-11">전략 상세 편집</button></div>
										<div class="col"><button class="btn btn-primary btn-no-radius w-100 font-11">바로 예약하기</button></div>
									</div>
								</div>
								<div class="strategy-collapse">
									<button class="btn collapsed"><i class="fas fa-chevron-down"></i></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${params.sug eq 'false'}">
				<!-- 수동 -->
				<div class="create-inner-window">
					<div class="create-window-part">
						<div class="option-list">
							<!-- init style="display:none;" add -->
							<div class="option-item">
								<div class="option-header">
									<!-- init on class delete -->
									<b>미디어</b>
								</div>
								<div class="option-body" style="display: none;">
									<!-- init style="display:none;" add , on class delete -->
									<c:forEach items="${mediaType }" var="m">
									<div class="custom-control custom-radio pt-1 pb-2 px-0">
										<input type="radio" name="mediaRadio" id="mediaRadio-${m.dvsn1No}" class="custom-control-input mediaRadio">
										<label class="custom-control-label ml-4 w-25" for="mediaRadio-${m.dvsn1No}">${m.dvsn1Nm}</label> 
										<select	class="mediaSelect ml-2 w-50" name="mediaSelect-${m.dvsn1No}" disabled>
											<option value="0">미디어 선택</option>
											<c:forEach items="${mediaDvsn }" var="d">
												<c:if test="${m.dvsn1No eq d.dvsn1No }">
													<option value="${d.dvsn2No }">${d.dvsn2Nm }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									</c:forEach>
									<div class="custom-control custom-checkbox pt-1 pb-2 px-0" style="display: none;">
										<input type="checkbox" name="availableCheckbox"	id="availableCheckbox" class="custom-control-input"> 
										<label class="custom-control-label ml-4" for="availableCheckbox">기간 내 집행 가능한 미디어 표시</label>
									</div>
									<div class="pt-1 pb-2 px-0">
										<input type="button" class="btn btn-white btn-no-radius w-100"
											id="btn-media" value="선택한 미디어 추가하기" disabled>
									</div>
								</div>
								<div class="option-footer media-list">
								</div>
							</div>
							<div class="option-item">
								<div class="option-header">
									<!-- init on class delete -->
									<b>시설물</b>
								</div>
								<div class="option-body" style="display: none;">
									<!-- init style="display:none;" add -->
									<div class="custom-control custom-radio px-0">
										<div class="w-75 mt-1 mb-2 mx-4">
											<input type="radio" name="facilityRadio" id="facilityRadio-0" class="custom-control-input" checked="checked"> 
											<label class="custom-control-label" for="facilityRadio-0">선택없음</label>
										</div>
										<c:forEach items="${facilityType }" var="f">
										<div class="minw-15 mt-1 mb-2 mx-4">
											<input type="radio" name="facilityRadio" id="facilityRadio-${f.dvsn1No }" class="custom-control-input"> 
											<label class="custom-control-label" for="facilityRadio-${f.dvsn1No }">${f.dvsn1Nm }</label>
										</div>
										</c:forEach>
									</div>
									<div class="py-2 px-0">
										<input type="button" class="btn btn-white btn-no-radius w-100"
											id="btn-facility" value="선택한 시설물 추가하기" disabled="disabled">
									</div>
								</div>
								<div class="option-footer facility-list">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="create-window-part absolute-lb1 resizable" id="result-part">
					<div class="handle">
					</div>
					<div class="mix-over">
					<div class="mix-info">
						<div class="info-header">
							<b class="info-title">미디어 믹스</b>
						</div>
						<div class="info-body">
							<div>
								<span class="item-title">예상 타겟 OTS</span><span class="targetOts">-</span>
							</div>
							<div>
								<span class="item-title">예상 총 OTS</span><span class="totalOts">-</span>
							</div>
							<div>
								<span class="item-title">광고료</span><span class="adPriceMonth">-</span>
							</div>
						</div>
					</div>
					<div class="item-list">
					</div>
					</div>
				</div>
				<div class="d-flex absolute-lb2" id="decide-part">
					<input type="button" id="save" class="btn btn-save btn-no-radius flex-fill" value="저장하기"/> <!-- disabled="disabled" -->
					<input type="button" id="reservation" class="btn btn-primary btn-no-radius flex-fill" value="예약하기"/>
				</div>
			</c:if>
		</div>
		<div class="create-sub-window shadow">
			<div class="create-window-part absolute-lt" id="sub-part">
				<div class="sub-info">
					<div class="info-header overflow-visible mb-2">
						<a class="sub-close my-auto"><i class="fas fa-arrow-left"></i></a>
						<b class="info-title-l py-1 subTitle"></b>
						<input type="hidden" class="info-title-l py-1 subTitle2" value=""/>
						<span class="unicon-l unicon-blue"><i class="fas fa-circle"></i></span>
						<input type="button" id="contentsSave" class="btn btn-sm btn-radius-all btn-blue float-right" value="저장하기" style="display:none;"/>
						<input type="button" id="selectFile" class="btn btn-sm btn-radius-all btn-black float-right" value="파일로 선택" />
					</div>
					<div class="info-body row mx-0 pt-3 totalAdInfo">
						<div class="col-8 px-0">
							<b class="info-title w-40 mr-3 mb-1">미디어</b><span class="subTitle"></span><br>
							<b class="info-title w-40 mr-3 mb-1">개수</b><span class="quant">0ea</span><br>
							<b class="info-title w-40 mr-3 mb-1">광고료</b><span class="adPriceMonth">-</span><br>
							<b class="info-title w-40 mr-3 mb-1 bAdMakePrice">제작비</b><span class="adMakePrice">-</span><br>
							<b class="info-title w-40 mr-3 mb-1 bTargetOts">예상 타겟 OTS</b><span class="targetOts">-</span><br>
							<b class="info-title w-40 mr-3 mb-1">예상 총 OTS</b><span class="totalOts">-</span>
						</div>
						<div class="col-4 px-0 totalAdRating">
						<!-- 등급 -->
						
						</div>
					</div>
				</div>
			</div>
			 <div class="create-sub-inner-window overflow-hidden" >
				<ul class="tabs" id="ul_Tabs">
					<li class="tab-link current shadow text-center" data-tab="tab-1" id="package">패키지</li>
					<li class="tab-link shadow text-center" data-tab="tab-2" id="each">개별 선택</li>
				</ul>
				<div id="tab-1" class="tab-content current p-0">
					<div class="create-package-window">
						<div class="table-package-body">
							<ul>
							</ul>
						</div>
					</div>
				</div>
				<div id="tab-2" class="tab-content p-0">
					<div class="create-sub-tab-window"> 
						<div class="create-window-part">
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
		<div class="context-menu">
			<ul>
				<!-- 초기생성 단계 -->
				<li><a class="map-download" id="savePdf">지도 다운로드</a></li>
				<li><a class="set-view">기본보기 설정</a></li>
				<!-- 초기생성 단계 X -->
				<li><a class="campaign-copy">캠페인 복사하기</a></li>
				<li><a class="campaign-share">캠페인 공유하기</a></li>
				<li><a class="campaign-delete">캠페인 삭제하기</a></li>
			</ul>
		</div>
		<div class="unicon-palette">
			<input type="hidden" id="unicon-index">
			<input type="hidden" id="unicon-info">
			<div class="shape-part">
				<span class="unicon"><i class="unicon-circle-gray-fill"></i></span>
				<span class="unicon"><i class="unicon-square-gray-fill"></i></span>
				<span class="unicon"><i class="unicon-triangle-gray-fill"></i></span>
				<span class="unicon"><i class="unicon-rvstriangle-gray-fill"></i></span>
				<span class="unicon"><i class="unicon-star-gray-fill"></i></span>
				<span class="unicon"><i class="unicon-rhombus-gray-fill"></i></span>
				<span class="unicon"><i class="unicon-heart-gray-fill"></i></span>
				<span class="unicon line"><i class="unicon-line-gray-fill"></i></span>
			</div>
			<div class="color-part">
				<span class="unicon"><i class="unicon-circle-red-fill"></i></span>
				<span class="unicon"><i class="unicon-circle-orange-fill"></i></span>
				<span class="unicon"><i class="unicon-circle-yellow-fill"></i></span>
				<span class="unicon"><i class="unicon-circle-teal-fill"></i></span>
				<span class="unicon"><i class="unicon-circle-green-fill"></i></span>
				<span class="unicon"><i class="unicon-circle-cyan-fill"></i></span>
				<span class="unicon"><i class="unicon-circle-blue-fill"></i></span>
				<span class="unicon"><i class="unicon-circle-indigo-fill"></i></span>
				<span class="unicon"><i class="unicon-circle-purple-fill"></i></span>
				<span class="unicon"><i class="unicon-circle-gray-fill"></i></span>
				<span class="unicon"><i class="unicon-circle-dark-fill"></i></span>
			</div>
			<div class="confirm-part">
				<input type="button" class="btn btn-sm btn-save btn-radious w-100" id="btn-unicon-modify" value="확인">
			</div>
		</div>
		<div class="filter-window">
			<div class="form-group" style="height:28px;">
			<b>미디어 추출</b>
			</div>
			<input type="hidden" id="filter-index">
			<div class="" style="height:38px;">
				<select class="w-100 form-control input-underline" style="padding:6px 0;" name="targetFacilA" id="targetFacilA">
				</select>
			</div>
			<div class="" style="height:38px;">
				<input type="hidden" id="select-dvsn2"/>
				<select class="w-100 form-control input-underline" style="padding:6px 0;" name="targetFacilB" id="targetFacilB">
				</select>
			</div>
			<div class="custom-control custom-radio mt-3 mb-2">
					<input type="radio" name="mediaFilter"
						id="mediaFilter1" class="custom-control-input " value="nearest">
					<label class="custom-control-label"
						for="mediaFilter1">최근접 미디어 추출</label>
			</div>
			<div class="custom-control custom-radio mt-2 mb-4">
					<input type="radio" name="mediaFilter"
						id="mediaFilter2" class="custom-control-input " value="include">
					<label class="custom-control-label"
						for="mediaFilter2"> <select id="filter-distance" 
						class="distance">
						<option value="0">선택</option>
						<option value="50">50m</option>
						<option value="100">100m</option>
						<option value="200">200m</option>
						<option value="300">300m</option>
					</select> 내 미디어 추출</label>
			</div>
			<div class="filter-confirm text-center">
				<input type="button" class="btn btn-sm btn-filter-secondary btn-radious w-48 float-left" id="btn-filter" value="추출하기">
				<input type="button" class="btn btn-sm btn-save btn-radious w-48 float-right" id="btn-filter-close" value="취소">
			</div>
		</div>
		<div class="targeting-list">
		<ul class="currentTarget off">
		</ul>
		<ul class="targetList">
		</ul> 
		</div>
		<div class="targeting-map">
			<div class="marker"></div>
			<p>TARGETING</p>
			<p>MAP</p>
			<div class="clickArea"><div class="hiddenArea"><i class="fas fa-plus"></i></div></div>
		</div>
		<div class="targeting-window">
			<div class="targeting-window-header">
				<b>Targeting Map</b>
				<button type="button" class="close" aria-label="Close"></button>
			</div>
			<div class="targeting-window-body">
				<div class="row">
					<div class="col-3 p-2">기간 설정</div>
					<div class="col-9">
						<div class="input-group">
							<input type="text" name="campaignTgTerm" placeholder="기간 입력" class="form-control input-underline" id="campaignTgTerm" readonly="readonly" value="" /> 
								<label class="input-underline float-right lh-2 calendar-icon"  for="campaignTgTerm">
							</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-3 p-2">성별 설정</div>
					<div class="col-9 custom-control custom-radio py-2 px-4" style="padding-left:28px !important;">
						<div class="col-12 float-left">
							<input type="radio" name="targetRadio" id="targetRadio-1"
								class="custom-control-input" value="every" checked="checked">
							<label class="custom-control-label" for="targetRadio-1">남성+여성</label>
						</div>
						<div class="col-4 float-left mr-2-5rem ">
							<input type="radio" name="targetRadio" id="targetRadio-2"
								class="custom-control-input" value="male"> <label
								class="custom-control-label" for="targetRadio-2">남성</label>
						</div>
						<div class="col-4 float-left">
							<input type="radio" name="targetRadio" id="targetRadio-3"
								class="custom-control-input" value="female"> <label
								class="custom-control-label" for="targetRadio-3">여성</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-3 p-2">연령 설정</div>
					<div class="col-9">
						<div class="input-group">
						<input type="text" name="minTargetAge" id="minTargetAge" class="width-75 text-center targetAge" style="height:37px" readonly="readonly">
						<span class="input-none text-center" style="width:30px;line-height: 2.4">~</span>
						<input type="text" name="maxTargetAge" id="maxTargetAge" class="width-75 text-center targetAge" style="height:37px" readonly="readonly">
						</div>
					</div>
				</div>
			</div>
			<div class="targeting-window-footer">
				<a class='btn btn-primary btn-radius-bottom w-100' href='#' id='createTargetingMap'>생성하기</a>
			</div>
		</div>
		<div class="map-option">
			<div class="basic-view">
				<a class="flag" id="basicView"></a>
			</div>
			<div class="zoom">
				<a class="zoom-in" id="zoomIn"><i class="fas fa-plus"></i></a>
				<a class="zoom-out" id="zoomOut"><i class="fas fa-minus"></i></a>
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
		<!-- 		파일 업로드 팝업 -->
		<div class="fileUpload-window">
			<div class="fileUpload-window-header">
				<b>파일 선택</b>
				<button type="button" class="close" aria-label="Close"></button>
			</div>
		<form  name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">
			<div class="fileUpload-window-body">
				<div class="row">
					<div class="col px-0">
						<div class="input-group">
							<input type="hidden" name="_csrf" value="${_csrf.token}">
							<input type="hidden" name="cid" value="${cid }">
							<input type="text" id="upfileName" name="upfilePath" class="upload-name" disabled="disabled" title="파일경로" readonly/>
<!-- 							<input type="hidden" id=upload-hidden> -->
							<div class ="fileBtn">
								<label for="fileName">파일 선택</label>
								<input type="file" id="fileName" name="upfile" class="btn btn-sm btn-radius-all btn-black float-right" title="파일" onchange="javascript: document.getElementById('upfileName').value = this.value;"/>
							</div>
						</div>	
					</div>
				</div>
				<div class="row">
					<div class="input-group">
						<div class="Exceldownload">
							<a id="ExcelDown" title="양식 다운로드" style="color: #4153FF;margin-left:5px;cursor: pointer;">
								<img src="/resources/images/download_blue.svg" >
								<span>양식 다운로드</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			</form>
			<div class="fileUpload-window-footer">
				<a class='btn btn-primary btn-radius-bottom w-100' onclick="uploadFile()"  id='createExcelMap' href="javascript:{}">선택하기</a>
			</div>
		</div>
<!-- 		파일업로드 팝업 종료 -->
		<form name="imgForm" id="imgForm" action="/campaign/main/image/upload?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
			<input type="hidden" id="cCtxt" name="cCtxt" value="${params.cid }"> 
			<input type="hidden" id="state" name="state" value="create">
			<input type="hidden" name="imgSrc" id="imgSrc" >
		</form>
		
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
	</div>
	<script src="/resources/lib/daterangepicker/moment.min.js"></script>
	<script src="/resources/lib/daterangepicker/daterangepicker.js"></script>
	<script src="/resources/lib/jquery-ui/jquery-ui.js"></script>
	<script src="/resources/lib/openlayers/ol.js"></script>
	<script src="/resources/lib/pdfjs/html2canvas.js"></script>
	<script src="/resources/lib/sheetJS/xlsx.full.min.js"></script>
	<script src="/resources/main/js/campaign/create_new2.js"></script>
	<script src="/resources/main/js/map/map2.js"></script>
	<script src="/resources/lib/filesaver/FileSaver.min.js"></script>
	<script>
	var jObj = ${jObj};
	var cpn = '${ params.cpn }';
	var adv = '${ params.adv }';
	var trm = '${ params.trm }';
	var cpb = '${ params.cpb }';
	</script>
</body>
</html>

<script>
$(document).ready(function() {
	var cid = { cid :  $("#cid").val() };
	$.ajax({
		url : '/campaign/ajax/basicviewSetting',
		data : cid,
		dataType : 'json', 
		type : 'GET',
		error: function(request, status, error){
	         console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
	    },	   
		success : function(data) {
			var basicview_info = data;
			var coord = null;
			var zoom = null;
			if(basicview_info.viewSetting != null){
				coord = ol.proj.transform([basicview_info.viewSetting.basicLong, basicview_info.viewSetting.basicLat], 'EPSG:4326', 'EPSG:3857');
				zoom = basicview_info.viewSetting.zoom -1;
			}else{
				coord = [14138194.550988387, 4518176.71063379];
				zoom = 11.5;
			}
			_animationZoom(coord, zoom);
		}
	});
});
</script>

