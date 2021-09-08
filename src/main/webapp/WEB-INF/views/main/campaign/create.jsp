<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<head>
<title>DATARGET | 캠페인 생성</title>
<link rel="stylesheet" href="/resources/lib/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="/resources/lib/openlayers/ol.css">
<link rel="stylesheet" href="/resources/main/css/campaign/create.css">
</head>
<body>
	<div id="container">
		<div id="map-area">
			<div id="map" class="map"></div>
		</div>
		<div class="create-window shadow">
			<div class="create-window-part pt-4 px-4">
				<div class="form-group">
					<input type="text" class="form-control input-underline mb-2"
						id="campaignName" name="campaignName" placeholder="캠페인 명">
					<input type="text" class="form-control input-underline mb-2"
						id="advertiser" name="advertiser" placeholder="광고주"> <input
						type="text" class="form-control input-underline mb-2"
						id="campaignBudget" name="campaignBudget" placeholder="캠페인 예산(원)"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					<div class="input-group mb-3">
						<input type="text" name="campaignTerm" placeholder="캠페인 일정"
							class="form-control input-underline" id="campaignTerm"
							readonly="readonly" value="" /> <label
							class="input-padding input-underline float-right"
							for="campaignTerm"> <i class="far fa-calendar"></i>
						</label>
					</div>
					<p>
						<b>캠페인 타겟</b>
					</p>
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
						<b class="py-2 mr-5">연령 설정</b> 
						<input type="number" name="minTargetAge" id="minTargetAge"
							class="form-control input-underline text-center" readonly="readonly"> 
						<span class="form-control input-none text-center" >~</span> 
						<input type="number" name="maxTargetAge" id="maxTargetAge"
							class="form-control input-underline text-center" readonly="readonly">
					</p>
					<c:if test="${autoStratagy }">
					<div class="custom-control custom-checkbox mb-3">
						<input type="checkbox" id="suggestionCheckbox"
							name="suggestionCheckbox" class="custom-control-input">
						<!-- init checked="checked" delete -->
						<label class="custom-control-label font-weight-bold h5"
							for="suggestionCheckbox">자동으로 미디어 제안받기</label>
					</div>
					</c:if>
				</div>
			</div>
			<c:if test="${autoStratagy }">
			<div class="create-window-part">
				<div class="option-list" style="display: none;">
					<!-- init style="display:none;" add -->
					<div class="option-item">
						<div class="option-header">
							<!-- init on class delete -->
							<b>미디어</b>
							<span class="dscrpt">* 다중선택 가능</span>
						</div>
						<div class="option-body" style="display: none;">
							<!-- init style="display:none;" add , on class delete -->
							<div class="custom-control custom-checkbox p-2">
								<input type="checkbox" name="mediaCheckbox-auto" id="mediaCheckbox-auto" class="custom-control-input mediaCheckbox"> 
								<label class="custom-control-label ml-4" for="mediaCheckbox-auto">미디어 믹스 제안받기</label>
							</div>
							<div class="custom-control custom-radio p-2">
								<input type="checkbox" name="mediaCheckbox-1"
									id="mediaCheckbox-1" class="custom-control-input mediaCheckbox">
								<label class="custom-control-label ml-4 w-25"
									for="mediaCheckbox-1">쉘터</label> <select
									class="mediaSelect ml-2 w-50" name="mediaSelect-1" disabled>
									<option value="0">미디어 선택</option>
									<option value="1">가로변 버스쉘터</option>
									<option value="2">중앙차로 버스쉘터</option>
									<option value="3">택시 쉘터</option>
								</select>
							</div>
							<div class="custom-control custom-radio p-2">
								<input type="checkbox" name="mediaCheckbox-2"
									id="mediaCheckbox-2" class="custom-control-input mediaCheckbox">
								<label class="custom-control-label ml-4 w-25"
									for="mediaCheckbox-2">지하철</label> <select
									class="mediaSelect ml-2 w-50" name="mediaSelect-2" disabled>
									<option value="0">미디어 선택</option>
									<option value="1">PSD</option>
									<option value="2">GDIA/빅스크린</option>
									<option value="3">GDIA/디지털포스터</option>
									<option value="4">GDIA/와이드배너</option>
								</select>
							</div>
							<div class="custom-control custom-radio p-2">
								<input type="checkbox" name="mediaCheckbox-3"
									id="mediaCheckbox-3" class="custom-control-input mediaCheckbox">
								<label class="custom-control-label ml-4 w-25"
									for="mediaCheckbox-3">버스래핑</label> <select
									class="mediaSelect ml-2 w-50" name="mediaSelect-3" disabled>
									<option value="0">미디어 선택</option>
									<option value="1">서울시내</option>
									<option value="2">경기광역</option>
								</select>
							</div>
							<div class="custom-control custom-radio p-2">
								<input type="checkbox" name="mediaCheckbox-4"
									id="mediaCheckbox-4" class="custom-control-input mediaCheckbox">
								<label class="custom-control-label ml-4 w-25"
									for="mediaCheckbox-4">아파트</label> <select
									class="mediaSelect ml-2 w-50" name="mediaSelect-4" disabled>
									<option value="0">미디어 선택</option>
									<option value="1">포커스미디어</option>
									<option value="2">타운보드</option>
								</select>
							</div>
							<div class="custom-control custom-radio p-2">
								<input type="checkbox" name="mediaCheckbox-5"
									id="mediaCheckbox-5" class="custom-control-input mediaCheckbox">
								<label class="custom-control-label ml-4 w-25"
									for="mediaCheckbox-5">빌보드</label> <select
									class="mediaSelect ml-2 w-50" name="mediaSelect-5" disabled>
									<option value="0">미디어 선택</option>
									<option value="1">디지털 빌보드</option>
									<option value="2">빌보드</option>
									<option value="3">빌딩 외벽</option>
								</select>
							</div>
						</div>
					</div>
					<div class="option-item">
						<div class="option-header">
							<!-- init on class delete -->
							<b>관심 시설</b>
							<span class="dscrpt">&nbsp;</span>
						</div>
						<div class="option-body" style="display: none;">
							<!-- init style="display:none;" add -->
							<div class="custom-control custom-radio px-2">
								<div class="m-2 ml-4 w-100">
									<input type="radio" name="interestRadio" id="interestRadio-1"
										class="custom-control-input" value="0" checked="checked">
									<label class="custom-control-label" for="interestRadio-1">선택없음</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-2"
										class="custom-control-input" value="1"> <label
										class="custom-control-label" for="interestRadio-2">아파트</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-3"
										class="custom-control-input" value="2"> <label
										class="custom-control-label" for="interestRadio-3">서점</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-4"
										class="custom-control-input" value="3"> <label
										class="custom-control-label" for="interestRadio-4">카페</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-5"
										class="custom-control-input" value="4"> <label
										class="custom-control-label" for="interestRadio-5">F&B</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-6"
										class="custom-control-input" value="5"> <label
										class="custom-control-label" for="interestRadio-6">H&B</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-7"
										class="custom-control-input" value="6"> <label
										class="custom-control-label" for="interestRadio-7">화장품</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-8"
										class="custom-control-input" value="7"> <label
										class="custom-control-label" for="interestRadio-8">마트</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-9"
										class="custom-control-input" value="8"> <label
										class="custom-control-label" for="interestRadio-9">병원</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-10"
										class="custom-control-input" value="9"> <label
										class="custom-control-label" for="interestRadio-10">약국</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-11"
										class="custom-control-input" value="10"> <label
										class="custom-control-label" for="interestRadio-11">학교</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-12"
										class="custom-control-input" value="11"> <label
										class="custom-control-label" for="interestRadio-12">영화관</label>
								</div>
								<div class="minw-15 m-2 ml-4">
									<input type="radio" name="interestRadio" id="interestRadio-13"
										class="custom-control-input" value="12"> <label
										class="custom-control-label" for="interestRadio-13">지하철</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			<div class="create-window-part p-4">
				<button type="button" class="btn btn-secondary btn-lg btn-block"
					id="submitCampaign" disabled="disabled">생성하기</button>
			</div>
		</div>
	</div>
	<script src="/resources/lib/daterangepicker/moment.min.js"></script>
	<script src="/resources/lib/daterangepicker/daterangepicker.js"></script>
	<script src="/resources/lib/openlayers/ol.js"></script>
	<script src="/resources/main/js/campaign/create.js"></script>
	<script src="/resources/main/js/map/map.js"></script>
</body>
</html>

