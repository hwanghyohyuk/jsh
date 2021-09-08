<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<head>
<title>DATARGET | 캠페인 성과</title>
<link rel="stylesheet" href="/resources/lib/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="/resources/main/css/campaign/campaign_result.css">
<link rel="stylesheet" href="/resources/lib/c3/c3.min.css">
<link rel="stylesheet" href="/resources/lib/chartJS/Chart.min.css">
</head>
<body>
<input type="hidden" id="tAg" name="tAg" value="${campaignInfo.tAg }">
<input type="hidden" id="cpt" name="cpt" value="${campaignInfo.tGndr }">
<input type="hidden" id="mediaList" name="mediaList" value="${tbmedia}">
<input type="hidden" id="sDt" name="sDt" value="${cmpDate.sDt }">
<input type="hidden" id="eDt" name="eDt" value="${cmpDate.eDt }">
<input type="hidden" id="imgList" name="imgList" value="${ImgList}">
<div class="container">
	<div class="mt-5 mb-5">
		<b class="fs-info-title">${campaignInfo.cTit }</b>
		<hr class="mt-1" style="padding-bottom:5px;">
		<a class = "silkasemibold" style="font-size:16px; color:#282828">Overview</a>
		<input class="selectpicker resultpicker" type="text" id="srhDate" name="datefilter" value="${cmpDate.sDt } - ${cmpDate.eDt }" />
		<img src="/resources/images/overview.png" class="fa-angle-down">
  		<br>
		<div class="card pt-3 mov-card" style="font-family: 'silkasemibold';">
			<div class="card-body p-0">
				<div class="row ml-0 mr-0" style="width:1180px;">
					<div class="col p-0 mov-prib ">
						<div class="p-3 py-4 mov-pri shadow border-radius-tr">							
							<div class="float-left ml-3">
								<div style="margin-top:-15px; margin-left:-15px;">
									<b class="fs-title">PROGRESS</b><br> <a class="fs-big-card">캠페인 진행률</a>
									<div id="cardchart" style="margin-left:50px; margin-top:-55px;"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col p-0 mov-prib ml-20">
						<div class="p-3 py-4 mov-pri shadow border-radius-tr">							
							<div class="float-left ml-3">
								<div style="margin-top:-15px; margin-left:-15px;">
									<b class="fs-title">총 OTS</b><br> <a class="fs-big-card">총 노출량</a><br>
								</div>
								<div style="margin-top:34px; margin-left:-15px;"><b class="fs-card-info" id="totOts">0</b></div>
							</div>
							<div style="float:right; margin-top:5px;">
								<img src="/resources/images/yellow_chart.png" style="width:200px; margin-right:-18px;">
							</div>
						</div>
					</div>
					<div class="col p-0 mov-prib ml-20">
						<div class="p-3 py-4 mov-pri shadow border-radius-tr">				
							<div class="float-left ml-3">
								<div style="margin-top:-15px; margin-left:-15px;">
									<b class="fs-title">타겟 OTS</b><br> <a class="fs-big-card">타겟 노출량</a><br>
								</div>
									<div style="margin-top: 34px; margin-left: -15px; ">
										<b class="fs-card-info" id="tgtOts">0</b>
									</div>
								</div>
							<div style="float:right; margin-top:5px;">
								<img src="/resources/images/blue_chart.png" style="margin-top:5px; width:170px; height:100px;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="mt-5 mb-5">
		<hr class="mt-1" style="padding-bottom:5px;">
		<div class="row">
			<div class="col-3"><a class = "silkasemibold" style="font-size:16px; color:#282828">Statistics</a></div>
		</div>
		<div class="row">
			<div id="chartLegend" class="chartjs-legend"></div>
			<canvas id="myChart" width="1170" height="400"></canvas>
		</div>
	</div>
	
	<hr class="mt-1" style="padding-top:0.5px;">
	<div class="mt-5 mb-5">
		<div class="row">
			<div class="col-10">
				<a class = "silkasemibold" style="font-size:16px; color:#282828;">Gross Performance</a>
			</div>
			<div class="col-2">
				<button class="btn btn-primary fas down-btn" onclick="fnExcelReport('list', 'GrossPerformance')">
					<img src="/resources/images/download_white.png">
					<span>다운로드</span>
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
			<table class="table shadow border-radius-tr table-bordered" id="list" style="table-layout:fixed">
				<thead class="notosansbold">
					<tr style="font-size:14px;">
						<th scope="col" class="col1 drag" id="drag1" draggable="true" data-idx="0" style="user-select:all; width:150px;">미디어 유형</th>
						<th scope="col" class="col2 drag" id="drag2" draggable="true" data-idx="1" style="user-select:all; width:135px;">미디어</th>
						<th scope="col" class="col3 drag" id="drag3" draggable="true" data-idx="2" style="user-select:all;">미디어 상품</th>
						<th scope="col" class="col4 drag" id="drag4" draggable="true" data-idx="3" style="user-select:all; width:185px;">노출 위치</th>
						<th scope="col" class="col5 drag" id="drag5" draggable="true" data-idx="4" style="user-select:all; width:95px;">광고료</th>
						<th scope="col" class="col6 drag" id="drag6" draggable="true" data-idx="5" style="user-select:all; width:110px;">타겟 OTS</th>
						<th scope="col" class="col7 drag" id="drag7" draggable="true" data-idx="6" style="user-select:all; width:110px;">총 OTS</th>
						<th scope="col" class="col8 drag" id="drag8" draggable="true" data-idx="7" style="user-select:all; width:95px;">시작일</th>
						<th scope="col" class="col9 drag" id="drag8" draggable="true" data-idx="8" style="user-select:all; width:95px;">종료일</th>
					</tr>
				</thead>
				<tbody class="notosansregular" id="tableBody" style="font-size:14px; ">
					<tr>
						<td class="col1" style="width:85px;"></td>
						<td class="col2"></td>
						<td class="col3" style="width:171px !important;"></td>
						<td class="col4"></td>
						<td class="col5">
	
						</td>
						<td class="col6">
	
						</td>
						<td class="col7">
	
						</td>
						<td class="col8">
	
	
						</td>
						<td class="col9">
	
	
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br><a class = "silkasemibold" style="font-size:16px; color:#282828">Media Performance</a><br>
		
		<div class="card pt-3 mov-card">
			<div class="card-body p-0">
				<div class="row ml-0 mr-0" style="width:1180px;">
					<div class="col p-0 mov-prib">
						<div class="nullalert0 p-3 py-4 mov-pri shadow border-radius-tr">	
							<div class="nonedata0" style="position:relative;">	
								<div class="float-right ml-3 ck0" style="position:absolute;left:126px;top:8px;">
									<div style="margin-top:-15px;"> <b class="media-perfomance">#1.</b> </div>
									<div class="fs-big-card" style="display:flex;"><div class="dvsn1nm_r0"></div> &nbsp-&nbsp <div class="dvsn2nm_r0"></div></div>
									<div><b class="rank0 fs-card-info"></b></div>
								</div>	
								<div class="dvsnimg0 card-circle">
									<img src="/resources/images/media_line/shelter_white.png" style="width:45px; height:45px; margin-left:23px; margin-top:22px;">							
								</div>									
							</div>
						</div>
					</div>
					<div class="col p-0 mov-prib ml-20">
						<div class="nullalert1 p-3 py-4 mov-pri shadow border-radius-tr">	
							<div class="nonedata1" style="position:relative;">
								<div class="float-right ml-3 ck1" style="position:absolute;left:126px;top:8px;">
									<div style="margin-top:-15px;">
										<b class="media-perfomance">#2.</b><br> 
										<div class="fs-big-card" style="display:flex;"><div class="dvsn1nm_r1"></div> &nbsp-&nbsp <div class="dvsn2nm_r1"></div></div>
									</div>
									<div><b class="rank1 fs-card-info"></b></div>
								</div>	
								<div class="dvsnimg1 card-circle">
									<img src="/resources/images/media_line/bus_white.png" style="width:45px; height:45px; margin-left:23px; margin-top:22px;">
								</div>
							</div>						
						</div>
					</div>
					<div class="col p-0 mov-prib ml-20">
						<div class="nullalert2 p-3 py-4 mov-pri shadow border-radius-tr">
							<div class="nonedata2" style="position:relative;">	
								<div class="float-right ml-3 ck2" style="position:absolute;left:126px;top:8px;">
									<div style="margin-top:-15px;">
										<b class="media-perfomance">#3.</b><br> 
										<div class="fs-big-card" style="display:flex;"><div class="dvsn1nm_r2"></div> &nbsp-&nbsp <div class="dvsn2nm_r2"></div></div>
									</div>
									<div><b class="rank2 fs-card-info"></b></div>
								</div>	
								<div class="dvsnimg2 card-circle">
									<img src="/resources/images/media_line/billboard_white.png" style="width:45px; height:45px; margin-left:23px; margin-top:22px;">
								</div>
							</div>			
						</div>
					</div>
				</div>
			</div>
		</div>
		<br><br><a class = "silkasemibold" style="font-size:16px; color:#282828">Location Performance</a><br>
		<div class="col-md-13 shodow" style="width:1180px; height:500px; margin-top:15px;">
			<div id="map" class="map shadow" style="width:100%; height:100%;">
			</div>
		</div>
		
		<div class="shadow" style="margin-top:30px; background-color: white;">
			<div style="display:flex;">
				<div class="loc0" style="width:20%; border: 0.1px solid #dee2e6;">
				</div>
				<div class="loc1" style="width:20%; border: 0.1px solid #dee2e6;">
				</div>
				<div class="loc2" style="width:20%; border: 0.1px solid #dee2e6;">
				</div>
				<div class="loc3" style="width:20%; border: 0.1px solid #dee2e6;">
				</div>
				<div class="loc4" style="width:20%; border: 0.1px solid #dee2e6;">
				</div>
			</div>
			<div style="display:flex;">
				<div class="loc5" style="width:20%; border: 0.1px solid #dee2e6;">
				</div>
				<div class="loc6" style="width:20%; border: 0.1px solid #dee2e6;">
				</div>
				<div class="loc7" style="width:20%; border: 0.1px solid #dee2e6;">
				</div>
				<div class="loc8" style="width:20%; border: 0.1px solid #dee2e6;">
				</div>
				<div class="loc9" style="width:20%; border: 0.1px solid #dee2e6;">
				</div>
			</div>	
		</div>
		
		<br><br><hr class="mt-1" style="padding-top:1px;"><br>
		<div>
			<a class = "silkasemibold" style="font-size:16px; color:#282828">Publication Report</a>
			<button class="btn btn-primary fas down-btn" id="savePpt">
				<img src="/resources/images/download_white.png">
				<span>다운로드</span>
			</button>
		</div><br>
		
		<div class="publication_parent" id="reportimg" style="width: 1150px; height: 300px;">
			<c:forEach var="ImgList" items="${ImgList}" begin="0" end="2">
				<div class="publication_child">
					<img src="/data/upload/img/${ImgList.fileSvrName}" style="width:381px; height:300px;">
				</div>
			</c:forEach>
		</div>
		<div class="no-data-grid" style="display:none;"> 
			<div class="data-grid-title">
				<span class="x-circle">
				</span>
			</div>
			<div class="data-grid-info">
				<span class="">관리자가 해당 캠페인에 대한 사진을 등록하지 않았습니다.</span>
			</div>
		</div>		
		<br><br>
		
		<center>
			<br><br>
			<button type="button" class="cmp_extension" data-toggle="modal" data-target="#ExtensionModal" style="width:300px; height:50px; background-color:#282828; border-color:#282828; color:white; display:none;">캠페인 연장요청</button>
		</center>
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
						<input type="hidden" id="stDt" name="sDt" value="${cmpDate.sDt }">
						<input type="hidden" id="edDt" name="eDt" value="${cmpDate.eDt }">
						<div style="margin-bottom:8px;">시작날짜</div>
						<div><h5>${cmpDate.sDt }</h5></div>
					</div>
					<div style="width:50%;padding:0 20% 0 0;">
						<div>종료날짜</div>
						<div class="input-group">
							<input type="text" name="extDatefilter" placeholder="기간 입력" class="form-control input-underline input-center" id="extDatefilter" value="${cmpDate.eDt }" /> 
								<label class="input-underline float-right lh-2 calendar-icon" for="extDatefilter">
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
<script>//d3js
	var defTable = [];
	var initTable = false;
	var delIndex = [4,5,6];
	
	function exportTable() {
		//테이블 내용 가져오기
		var table = document.getElementById('list');
	    var data = [];
	    var headers = [];
	    
	    var jsonArray = new Object();
	    var jsonData = new Object();
	    
	    for(var i=1; i<table.rows.length; i++) {
	        var tableRow = table.rows[i];
	        var rowData = new Object();
	        for(var j=0; j<tableRow.cells.length; j++) {
	        	if(i==0){
	        		rowData[j] = tableRow.cells[j].innerHTML.toLowerCase().replace(/ /gi,'');
	        	}else {
	        		rowData[j] = tableRow.cells[j].innerHTML.replace(/\t/gi,"").replace(/\n/gi,"");
	        	}
	        }
	        jsonArray[i] = JSON.stringify(rowData);
	        defTable.push(rowData);
	    }
	    initTable = true;
	}
</script>
<script src="/resources/lib/openlayers/ol.js"></script>
<script src="/resources/lib/daterangepicker/moment.min.js"></script>
<script src="/resources/lib/daterangepicker/daterangepicker.js"></script>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="/resources/lib/d3/d3.js"></script>
<script src="/resources/lib/c3/c3.min.js"></script>
<script src="/resources/lib/c3/c3.js"></script>
<script src="/resources/lib/draganddrop/draganddrop.js"></script>
<script src="/resources/lib/pdfjs/html2canvas.js"></script>
<script src="/resources/lib/pdfjs/jspdf.min.js"></script>
<script src="/resources/lib/chartJS/Chart.bundle.min.js"></script>
<script src="/resources/lib/chartJS/Chart.min.js"></script>
<script src="/resources/main/js/campaign/campaign_result.js"></script>
<script src="/resources/main/js/map/map2.js"></script>

<script>//public report ppt 저장
$(document).ready(function() {
	$('#savePpt').click(function() { // pdf저장 button id
		var downA = document.querySelector("#savePpt");
		var cId = $("#cid").val();
		location.href = "/campaign/ajax/downToPpt?fileName="+cId+".pptx";
	});
	
	var cPrgsStts = $("#cPrgsStts").val()*1; 
	
	switch(cPrgsStts){
	case 1:
		//생성중
		$('.cmp_reservation').css('display', '');
		$('.cmp_revise').css('display', '');
		break;
	case 2:
		//예약 제출
		break;
	case 3:
		//매체검토
		break;
	case 4:
		//캠페인 확정
		break;
	case 5:
		//소재검수
		break;
	case 6:
		//진행 live
		$('.cmp_extension').css('display', '');
		break;
	case 7:
		//종료
		$('.cmp_extension').css('display', '');
		break;
	}
	
	var imgCk = $("#imgList").val();
	if(imgCk=="[]" || !imgCk){//이미지 존재여부체크
		$('.publication_parent').css('display', 'none');
		$('.no-data-grid').css('display', '');
	}
})
</script>