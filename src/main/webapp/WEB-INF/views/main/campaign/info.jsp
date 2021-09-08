<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<head>
<title>DATARGET | 캠페인 정보</title>
<link rel="stylesheet" href="/resources/main/css/campaign/campaign_info.css">
<link rel="stylesheet" href="/resources/lib/openlayers/ol.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style type="text/css">
	.gend{
		font-weight: bold;
	    font-size: 13px;
	    color: #7E7E7D !important;
		position: relative;
        top: -130px;
	    left: 91px;
	    width: 80px;
	    text-align: center;
    }
    
    #chart>svg{
	    position: relative;
	    top: -20px;
	    left: -30px;
    }
</style>
</head>
<body>
<input type="hidden" id="InterFacility" name="InterFacility" value="${InterFacility}">
<input type="hidden" id="tAg" name="tAg" value="${campaignInfo.tAg }">
<input type="hidden" id="cpt" name="cpt" value="${campaignInfo.tGndr }">
<input type="hidden" id="sDt" name="sDt" value="${tgDate.sDt }">
<input type="hidden" id="eDt" name="eDt" value="${tgDate.eDt }">
<input type="hidden" id="cPrgsStts" name="cPrgsStts" value="${campaignInfo.cPrgsStts }">
<input type="hidden" id="defTable" name="defTable" value="${defTable}">
<div class="container">
	<div class="mt-5 mb-5">
		<b class="fs-info-title">${campaignInfo.cTit }</b>
		<hr class="mt-1">
		<a class = "silkasemibold" style="font-size:16px; color:#282828">Overview</a><br><br>
		<div id="progress_box">
			<div class="circle"><div class="circle_font m-auto">
			<c:choose>
				<c:when test="${campaignInfo.cPrgsStts eq 1}"><div class="circle-basic circle-creating"></div>생성중</c:when>
				<c:when test="${campaignInfo.cPrgsStts eq 2}"><div class="circle-basic circle-booking"></div>예약중</c:when>
				<c:when test="${campaignInfo.cPrgsStts eq 3}"><div class="circle-basic circle-booking"></div>예약중</c:when>
				<c:when test="${campaignInfo.cPrgsStts eq 4}"><div class="circle-basic circle-booking"></div>예약중</c:when>
				<c:when test="${campaignInfo.cPrgsStts eq 5}"><div class="circle-basic circle-booking"></div>예약중</c:when>
				<c:when test="${campaignInfo.cPrgsStts eq 6}"><div class="circle-basic circle-progressing"></div>진행중</c:when>
				<c:when test="${campaignInfo.cPrgsStts eq 7}"><div class="circle-basic circle-finished"></div>종료</c:when>
			</c:choose>
			</div>
			</div>
			<div class="prg1 shadow">
				<div class="progress_circle_font m-auto">
					<div class="silkabold progress_circle_top1" style="margin-bottom:-12px;"><h4 style="font-weight:900;">1</h4></div>
						<hr class="prg_hr1" style="width:80px; background-color:black;">
					<div class="progress_circle_bottom1" style="margin-top:-12px;">생성</div>
				</div>
			</div>
			<div class="mini_circle1"></div>
			<div class="mini_circle1"></div>
			<div class="mini_circle1"></div>
			<div class="prg2 shadow">
				<div class="progress_circle_font m-auto">
					<div class="silkabold progress_circle_top2" style="margin-bottom:-12px;"><h4 style="font-weight:900;">2</h4></div>
						<hr class="prg_hr2" style="width:80px; background-color:black;">
					<div class="progress_circle_bottom2" style="margin-top:-12px;">매체검토</div>
				</div>
			</div>
			<div class="mini_circle2"></div>
			<div class="mini_circle2"></div>
			<div class="mini_circle2"></div>
			<div class="prg3 shadow">
				<div class="progress_circle_font m-auto">
					<div class="silkabold progress_circle_top3" style="margin-bottom:-12px;"><h4 style="font-weight:900;">3</h4></div>
						<hr class="prg_hr3" style="width:80px; background-color:black;">
					<div class="progress_circle_bottom3" style="margin-top:-12px;">캠페인 확정</div>
				</div>
			</div>
			<div class="mini_circle3"></div>
			<div class="mini_circle3"></div>
			<div class="mini_circle3"></div>
			<div class="prg4 shadow">
				<div class="progress_circle_font m-auto">
					<div class="silkabold progress_circle_top4" style="margin-bottom:-12px;"><h4 style="font-weight:900;">4</h4></div>
						<hr class="prg_hr4" style="width:80px; background-color:black;">
					<div class="progress_circle_bottom4" style="margin-top:-12px;">소재검수</div>
				</div>
			</div>
			<div class="mini_circle4"></div>
			<div class="mini_circle4"></div>
			<div class="mini_circle4"></div>
			<div class="prg5 shadow">
				<div class="progress_circle_font m-auto">
					<div class="silkabold progress_circle_top5" style="margin-bottom:-12px;"><h4 style="font-weight:900;">5</h4></div>
						<hr class="prg_hr5" style="width:80px; background-color:black;">
					<div class="progress_circle_bottom5" style="margin-top:-12px;">LIVE</div>
				</div>
			</div>
			<div class="mini_circle5"></div>
			<div class="mini_circle5"></div>
			<div class="mini_circle5"></div>
			<div class="prg6 shadow mr-0" >
				<div class="progress_circle_font m-auto">
					<div class="silkabold progress_circle_top6" style="margin-bottom:-12px;"><h4 style="font-weight:900;">6</h4></div>
						<hr class="prg_hr6" style="width:80px; background-color:black;">
					<div class="progress_circle_bottom6" style="margin-top:-12px;">종료</div>
				</div>
			</div>
		</div><br>
		<div class="card pt-3 mov-card">
			<div class="card-body p-0">
				<div class="row ml-0 mr-0">
					<div class="col p-0 mov-prib">
						<div class="p-3 py-4 mov-pri shadow border-radius-tr">							
							<div class="float-left">
								<a class="fs-title">일정</a><br> <a class="fs-big-card lh-1" style="font-size: 15pt;">
								${campaignInfo.sDt } - <br>${campaignInfo.eDt }</a>
							</div>
							<div class="card-circle">
								<img src="/resources/images/Calendar.png" style="margin-left:18px; margin-top:17px;">
							</div>
						</div>
					</div>
					<div class="col p-0 mov-prib">
						<div class="p-3 py-4 mov-pri shadow border-radius-tr">							
							<div class="float-left">
								<a class="fs-title">광고료</a><br> <a class="fs-big-card">
								<fmt:formatNumber type="number" value="${cmpTotPrice }"></fmt:formatNumber></a>
							</div>
							<div class="card-circle">
								<img src="/resources/images/Money.png" style="margin-left:20px; margin-top:22px;">
							</div>
						</div>
					</div>
					<div class="col p-0 mov-prib">
						<div class="p-3 py-4 mov-pri shadow border-radius-tr">							
							<div class="float-left">
								<a class="fs-title">예상 총 OTS</a><br> <a class="fs-big-card">
									<fmt:parseNumber var="totalOts" value="${campaignInfo.totalOts }" integerOnly="true"> </fmt:parseNumber>
									<fmt:formatNumber type="number" value="${totalOts}"></fmt:formatNumber>
								</a>
							</div>
							<div class="card-circle">
								<img src="/resources/images/OTS.png" style="margin-left:18px; margin-top:23px;">
							</div>
						</div>
					</div>
					<div class="col p-0 mov-prib mr-0">
						<div class="p-3 py-4 mov-pri shadow border-radius-tr">				
							<div class="float-left">
								<a class="fs-title">예상 타겟 OTS</a><br> <a class="fs-big-card">
									<fmt:parseNumber var="targetOts" value="${campaignInfo.targetOts }" integerOnly="true"> </fmt:parseNumber>
									<fmt:formatNumber type="number" value="${targetOts }"></fmt:formatNumber>
								</a>
							</div>
							<div class="card-circle">
								<img src="/resources/images/OTS.png" style="margin-left:18px; margin-top:23px;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="mt-5 mb-5">
		<hr class="mt-1">
		<div class="row">
			<div class="col-3"><a class = "silkasemibold" style="font-size:16px; color:#282828">Targeting</a></div>
			<div class="col-5"><a class = "silkasemibold" style="font-size:16px; color:#282828">Campaign Map</a></div>
			<div class="col-4">
				<button id="savePdf" class="btn btn-primary fas down-btn" style="margin-left:10px;">
					<img src="/resources/images/download_white.png" >
					<span>다운로드</span>
				</button>
				<button id="moveView" class="btn btn-primary fas down-btn">
					<img src="/resources/images/marker.png" style="width:13px; height:15px; margin-right:5px;">
					<span>뷰어로 이동</span>
				</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-md-pull-9">
				<div class=" col p-0 ">
					<div class="left-card p-3 py-4 shadow">
						<div class="left-card-title">타겟</div>		
						<div id="chart" class="gauge-back"></div>		
						
						<div class="gend">
						<c:choose>
							<c:when test="${campaignInfo.tGndr eq 'male'}">남성</c:when>
							<c:when test="${campaignInfo.tGndr eq 'female'}">여성</c:when>
							<c:otherwise>남성 + 여성</c:otherwise>
						</c:choose>
						</div>	
					</div>
				</div><br>
				<div class=" col p-0 ">
					<div class="left-card p-3 py-4 shadow" style="text-align: center;">		
						<div class="left-card-title" style="float:left;">미디어</div>	
						<div style="display: inline-block;">
							<div class="row" style="margin-top:12px;">
								<div class="mediaicon">
									<input type="checkbox" class="media-btn" id="media_btn1" /><label class="btn" for="media_btn1" style="pointer-events: none;"><img src="/resources/images/bus.png"></label><br>
									<div class="media-name">버스래핑</div>
								</div>
								<div class="mediaicon">
									<input type="checkbox" class="media-btn" id="media_btn2" /><label class="btn" for="media_btn2" style="pointer-events: none;"><img src="/resources/images/Shelter.png"></label><br>
									<div class="media-name">쉘터</div>
								</div>
								<div class="mediaicon">
									<input type="checkbox" class="media-btn" id="media_btn3" /><label class="btn" for="media_btn3" style="pointer-events: none;"><img src="/resources/images/train.png"></label><br>
									<div class="media-name">지하철</div>
								</div>
								<div class="mediaicon">
									<input type="checkbox" class="media-btn" id="media_btn4" /><label class="btn" for="media_btn4" style="pointer-events: none;"><img src="/resources/images/billboard.png"></label><br>
									<div class="media-name">빌보드</div>
								</div>
							</div>	
							<div class="row" style="margin-top:15px;">
							<div class="mediaicon">
								<input type="checkbox" class="media-btn" id="media_btn5"/><label class="btn" for="media_btn5" style="pointer-events: none;"><img src="/resources/images/building.png"></label><br>
								<div class="media-name">아파트</div></div>
							</div>
						</div>
					</div>
				</div><br>
				<div class=" col p-0">
					<div class="left-card p-3 py-4 shadow" style="text-align: center;">		
						<div>
							<div class="left-card-title" style="float:left;">관심 시설</div>		
							<div style="float:right; margin-top:-15px;">
								<a href="#carouselExampleCaptions" role="button" data-slide="prev">
									<input type="image" src="/resources/images/left_btn.PNG" style="width:20px; height:20px;">
								</a>
								<a href="#carouselExampleCaptions" role="button" data-slide="next">
									<input type="image" src="/resources/images/right_btn.PNG" style="width:20px; height:20px;">
								</a>
							</div>
						</div>
						<div id="none-carousel" style="display:none;">관심시설이 없습니다.</div>
						<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">

   							</div>
   						</div>	
					</div>
				</div>
			</div>
			<div id="divmap" class="col-md-9 col-md-push-3 border-radius-tr" style="width:1050px; height:582px;">
				<div id="map" class="map border-radius-tr" style="width:100%; height:100%;"></div>
			</div>
		</div>
	</div>
	
	<hr class="mt-1" style="padding-top:0.5px;">
		<div class="row">
			<div class="col-10 down-left-div">
				<a class = "silkasemibold" style="font-size:16px; color:#282828">Media Mix</a>
			</div>
			<div class="col-2 down-right-div">
				<button class="btn btn-primary fas down-btn down-menu" onclick="downloadMenuChange()">
					<img src="/resources/images/download_white.png">
					<span>다운로드</span>
				</button>
				
				<button class="btn btn-primary fas down-btn down-submenu" style="width:30px;" onclick="closeDownladMenu()">
					<a style="font-size:14px; margin-left: -2px;">X</a>
				</button>
				<button class="btn btn-primary fas down-btn down-submenu down-btn-sub" style="width:133px;" onclick="fnExcelReport('table', 'MediaMix')">
					<img src="/resources/images/download_white.png">
					<span>MediaMix</span>
				</button>
				<button class="btn btn-primary fas down-btn down-submenu down-btn-sub" style="width:133px;" onclick="makingGudieDownload()">
					<img src="/resources/images/download_white.png">
					<span>제작가이드</span>
				</button>
				<button class="btn btn-primary fas down-btn down-submenu down-btn-sub" style="width:133px;" onclick="introduceDownload()">
					<img src="/resources/images/download_white.png">
					<span>미디어소개서</span>
				</button>
			</div>
		</div>
		
		<div class="drop-box notosansregular" id="drop">
			<div id="dropbox_content">
				<img src="/resources/images/drop.png" style="width:60px; height:60px;">&nbsp;&nbsp;제외하고자 하는 항목을 Drag & Drop 해주세요.
			</div>
		</div>
		
		<br>
		<div class="table-div">		
			<table class="table shadow border-radius-tr table-bordered" id="table" style="table-layout:fixed">
				<thead class="notosansbold" style="font-size:14px;">
					<tr>
						<th scope="col" data-idx="0" draggable="true" style="user-select:all; width:170px;">미디어 유형</th>
						<th scope="col" data-idx="1" draggable="true" style="user-select:all; width:140px;">미디어</th>
						<th scope="col" data-idx="2" draggable="true" style="user-select:all;">미디어 상품</th>
						<th scope="col" data-idx="3" draggable="true" style="user-select:all; width:185px;">노출 위치</th>
						<th scope="col" data-idx="4" draggable="true" style="user-select:all; width:170px;">광고료</th>
						<th scope="col" data-idx="6" draggable="true" style="user-select:all; width:170px;">예상 타겟 OTS</th>
						<th scope="col" data-idx="5" draggable="true" style="user-select:all; width:170px;">예상 총 OTS</th>
					</tr>
				</thead>	
				<tbody class="notosansregular" style="font-size:14px; ">
					<c:forEach var="tblist" items="${tblist}">
						<tr class="tbCnt">
							<td>${tblist.dvsn1Nm}</td>
							<td>${tblist.dvsn2Nm}</td>
							<td>${tblist.name}</td>
							<td>${tblist.address}</td>
							<td class="priceMonth">
								<fmt:parseNumber var="price" value="${tblist.adPriceMonth}" integerOnly="true"> </fmt:parseNumber>
								<fmt:formatNumber type="number" value="${price}"></fmt:formatNumber>
							</td>
							<td>
								<fmt:parseNumber var="targetOts" value="${tblist.preTargetOts}" integerOnly="true"> </fmt:parseNumber>
								<fmt:formatNumber type="number" value="${targetOts}"></fmt:formatNumber>
							</td>
							<td>
								<fmt:parseNumber var="totalOts" value="${tblist.preTotalOts}" integerOnly="true"> </fmt:parseNumber>
								<fmt:formatNumber type="number" value="${totalOts}"></fmt:formatNumber>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="text-center">
			<br><br>
			<button type="button" class="cmp_extension" data-toggle="modal" data-target="#ExtensionModal" style="width:300px; height:50px; background-color:#282828; border-color:#282828; color:white; display:none;">캠페인 연장요청</button>
			<button type="button" class="cmp_revise" style="width:300px; height:50px; background-color:#282828; border-color:#282828; color:white; display:none;margin-left:50px" onclick="CampaignRevise()">캠페인 수정</button>
			<button type="button" class="cmp_reservation" style="width:300px; height:50px; background-color:#282828; border-color:#282828; color:white; display:none;margin-left:50px" onclick="CampaignReservation();">캠페인 예약</button>
		</div>	
</div>

<!-- 캠페인 연장 Modal -->
<!-- 연장요청 모달 -->
<div class="modal fade" id="ExtensionModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false" aria-labelledby="ExtensionModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="ExtensionModalLabel">연장하기</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="text-align:center;">
				<h3>연장하실 기간을 선택해주세요</h3><br>
				<div class="row">
					<div style="width:50%;padding:0 0 0 20%;">
						<input type="hidden" id="befSDt" name="befSDt" value="${cmpDate.sDt }">
						<input type="hidden" id="befEDt" name="befEDt" value="${cmpDate.eDt }">
						<div style="margin-bottom:8px;">시작날짜</div>
						<div><h5>${cmpDate.sDt }</h5></div>
					</div>
					<div style="width:50%;padding:0 20% 0 0;">
						<div>종료날짜</div>
						<div class="input-group">
							<input type="text" name="datefilter" placeholder="기간 입력" class="form-control input-underline input-center" id="datefilter" value="${cmpDate.eDt }" /> 
								<label class="input-underline float-right lh-2 calendar-icon" for="datefilter">
							</label>
						</div>
					</div>
				</div>
			<div class="modal-footer">
				<button type="button" onclick="ExtensionSubmit();" class="btn btn-secondary mx-auto">연장신청</button>
			</div>
			<div class="model-a" id="downToExcel" style="display:none;"></div>
			</div>
		</div>
	</div>
</div>
<script>
	var delIndex = [4,5,6];
	var initTable = false;
	var defTable = ${defTable};
</script>
<script>
	var appR = new Object();
	appR.campaign = ${campaign};
</script>
<script src="/resources/lib/daterangepicker/moment.min.js"></script>
<script src="/resources/lib/daterangepicker/daterangepicker.js"></script>
<script src="/resources/lib/jquery-ui/jquery-ui.js"></script>
<script src="/resources/lib/openlayers/ol.js"></script>
<script src="/resources/main/js/campaign/campaign_info.js"></script>
<script src="/resources/lib/pdfjs/html2canvas.js"></script>
<script src="/resources/lib/pdfjs/jspdf.min.js"></script>
<script src="/resources/main/js/map/map2.js"></script>
<script src="/resources/lib/draganddrop/draganddropInfo.js"></script>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="/resources/lib/d3/d3.js"></script>

<script>//d3js
    function randNumberBounds(min, max) {
      min = Math.ceil(min);
      max = Math.floor(max);
      return Math.floor(Math.random() * (max - min)) + min;
    }

    var ageStr = '${campaignInfo.tAg}';
	var minag = ageStr.substring(0,2)*1;
	var maxag = ageStr.substring(2,4)*1;
	
	(function() {
      var gauge = gaugeChart()
        .width(320)
        .height(200)
        .innerRadius(60)
        .outerRadius(80)
        .dataDomain([0,40,80])
        .setTick(10)
        .lastInvisible(true)

      d3.select("#chart").datum([minag,maxag]).call(gauge);
      
      function resize() {
        var gWidth = 320;
        gauge.width(gWidth).innerRadius(gWidth / 4).outerRadius((gWidth / 4) + 5);
        d3.select("#chart").call(gauge);
      }

      resize();
      window.addEventListener("resize", resize);
    })()
</script>