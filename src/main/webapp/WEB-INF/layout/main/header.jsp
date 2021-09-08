<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Navigation -->
<meta http-equiv="Cache-Control" content="No-Cache">
<meta http-equiv="Pragma" content="No-Cache">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<sec:authorize access="isAuthenticated()"><c:set var="authority"><sec:authentication property="details.authority" /></c:set></sec:authorize>
<div class="container-fluid bg-dark">
	<nav class="navbar navbar-dark navbar-expand">
		<a class="navbar-brand d-logo" href="/campaign"></a>
		<div class="collapse navbar-collapse" id="navbarNav">

			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${pageinfo eq 'detail' }">
						<li class="nav-item link-bar"><a class="nav-link text-center">${campaignInfo.cTit }</a></li>
						<li class="nav-item link-bar bl-0 hover-black"><a class="nav-link text-center" href="/campaign/info/${cid }">캠페인 정보</a></li>
						<li class="nav-item link-bar bl-0 hover-black" style="cursor:pointer"><a class="nav-link text-center" onclick="cmppf();">캠페인 성과</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item link-bar hover-black"><a class="nav-link text-center new-campaign"
							href="/campaign/create"><span class="create-icon"></span>
							<span class="create-name">새 캠페인</span></a></li>
						<c:if test="${authority eq 'B' }">
						<li class="nav-item ml-3">
							<div class="search-bar">
							<div class="search-icon">
							<span class="new-search-icon"></span>
							</div> <select class="chosen" multiple data-placeholder="캠페인 검색">
								<c:forEach var="c" items="${campaignList }">
									<c:choose>
										<c:when test="${c.cPrgsStts eq '1'}">
											<option data-color="st-creating" data-href="edit" value="${c.cCtxt }">${c.cTit }</option>
										</c:when>
										<c:when
											test="${c.cPrgsStts eq '2' or c.cPrgsStts eq '3' or c.cPrgsStts eq '4' or c.cPrgsStts eq '5'}">
											<option data-color="st-booking" data-href="info" value="${c.cCtxt }">${c.cTit }</option>
										</c:when>
										<c:when test="${c.cPrgsStts eq '6'}">
											<option data-color="st-progressing" data-href="info" value="${c.cCtxt }">${c.cTit }</option>
										</c:when>
										<c:when test="${c.cPrgsStts eq '7'}">
											<option data-color="st-finished" data-href="info" value="${c.cCtxt }">${c.cTit }</option>
										</c:when>
									</c:choose>
								</c:forEach>
						</select>
						</div>
						</li>
						</c:if>
					</c:otherwise>
				</c:choose>
			</ul>
			<ul class="navbar-nav">
				<c:if test="${authority eq 'B' }">
				<li class="nav-item mr-2"><a class="nav-link nav-submenu"
					data-toggle="modal" data-target="#inquireModal"><i
						class="far fa-envelope"></i></a></li>
				<li class="nav-item dropdown mr-2"><a
					class="nav-link nav-submenu" id="alarmDropdown" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
						class="far fa-bell"></i>
						<c:if test="${cntAlarm.recAlarm > 0}">
							<span class="badge badge-pill badge-pink" id="unRead">
							<c:if test="${cntAlarm.recAlarm > 9}">
							<i class="fas fa-plus"></i>
							<c:out value=""></c:out>
							</c:if>
							<c:if test="${cntAlarm.recAlarm < 10}">
								<c:out value="${cntAlarm.recAlarm }"></c:out>
							</c:if>
							</span>
						</c:if>
						</a>
					<div class="dropdown-menu dropdown-menu-right alarm"
						aria-labelledby="alarmDropdown" style="width: 350px;">
						<div class="card-header">
							<div class="title-content">
								<span class="card-title">알림</span>
								<button type="button" class="close" aria-label="Close"></button>
							</div>
						</div>
						<c:if test="${cntAlarm.totAlarm eq 0}">
						<div class="card-header">
							<span class="card-title">새로운 알림이 없습니다</span>
						</div>
						</c:if>
						<c:if test="${fn:length(alarmList) > 0}">
						<div class="card-body back-30 alarm-body">
							<ul>
							<c:forEach items="${alarmList }" var="i" varStatus="vs">
								<li class="show">
									<c:if test="${vs.first}">
										<div class="rounded <c:if test="${i.recieveDate ne null}">readed</c:if>" onclick="readMessage('${i.idx }',true,<c:if test="${i.idx eq cntAlarm.min }">true</c:if><c:if test="${i.idx ne cntAlarm.min }">false</c:if>,this)">
									</c:if>
									<c:if test="${!vs.first}">
										<div class="rounded <c:if test="${i.recieveDate ne null}">readed</c:if>" onclick="readMessage('${i.idx }',false,<c:if test="${i.idx eq cntAlarm.min }">true</c:if><c:if test="${i.idx ne cntAlarm.min }">false</c:if>,this)">
									</c:if>
									
										<div class="card-content">
											<input type="hidden" class="alarm-idx" value="${i.idx }">
											<span><p>${i.title }</p></span>
											<span class="card-text"><small><p>${i.contents}</p></small></span>
										</div>
										<div class="card-del" onclick="event.cancelBubble=true;">
											<button type="button" class="delAlarm" aria-label="delAlarm" onclick="delAlarm('${i.idx }',<c:if test="${i.recieveDate eq null }">true</c:if><c:if test="${i.recieveDate ne null }">false</c:if>)"></button>
										</div>
							    	</div>
								</li>
							</c:forEach>
							</ul>
						</div>
						<div class="card-footer text-center">
							<a class="btn btn-default previous disabled" ><img src="/resources/images/al_left.png"></a> 
							<c:if test="${cntAlarm.totAlarm le 3}">
							<a class="btn btn-default next disabled"><img src="/resources/images/al_right.png"></a>
							</c:if>
							<c:if test="${cntAlarm.totAlarm gt 3}">
							<a class="btn btn-default next"><img src="/resources/images/al_right.png"></a>
							</c:if>
							
							<input type="hidden" class="alarm-cnt" id="alarmCnt" value="${cntAlarm.cntPage }">
							<input type="hidden" class="alarm-tot" id="alarmTot" value="${cntAlarm.totPage }">
						</div>
						</c:if>
					</div>
					
					
					<!--  -->
					<div class="dropdown-menu dropdown-menu-right message"
						aria-labelledby="alarmDropdown" style="width: 350px;">
						<div class="card-header">
							<div class="title-content">
								<span class="card-title">알림</span>
								<input type="hidden" id="msgIdx" value="">
								<button type="button" class="close" aria-label="Close"></button>
							</div>
						</div>
						<div class="card-body back-30 message-body">
							<ul>
							<li class="show">
									<span id="titleInfo" style="font-size: 15px; font-weight: 500;">title None</span>
									<span class="card-text"><small><p id="timeInfo">time None</p></small></span>
									<div class="overflow-auto scroll"  id="contentInfo" style="height:150px; font-size: 14px;">
									통신오류 입니다. 관리자에게 문의해주십시요.
									</div>
								</li>
							</ul>
						</div>
						<div class="card-footer text-center">
							<a class="btn msgPrevious" ><i class="fas fa-chevron-left"> 이전</i></a>
							<a class="btn msgList" >목록</a> | <a class="btn msgDel" id="msgDel">삭제</a>
							<a class="btn msgNext">다음 <i class="fas fa-chevron-right"></i></a>
						</div>
					</div>
				</li>
				</c:if>
				<li class="nav-item dropdown"> 
					<c:if test="${authority eq 'B' }">
						<sec:authorize access="isAuthenticated()">
							<a class="nav-link" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><sec:authentication property="details.user_id"/></a>
							<div class="dropdown-menu dropdown-menu-right"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#" onclick="logout();return false;">로그아웃</a> 
								<a class="dropdown-item" href="#" id="MODIFY">회원정보수정</a>
								<a class="dropdown-item" href="#" id="manuals" onClick="$('#manualModal').modal();">매뉴얼</a>
							</div>
						</sec:authorize>
					</c:if>
					<c:if test="${authority eq 'R' }">
						<sec:authorize access="isAuthenticated()">
							<a class="nav-link" href="/admin/admin" id="userDropdown">관리자 메인</a>
						</sec:authorize>
					</c:if>
					<sec:authorize access="isAnonymous()">
						<a class="nav-link" href="/index">Login</a>
					</sec:authorize>
					
					</li>
			</ul>
			<form id="logout" action="/logout?${_csrf.parameterName}=${_csrf.token}" method="post">
			</form>
			<script>
			function logout() {
				if(confirm("로그아웃 하시겠습니까?")){
					var pageUrl = location.href;
					var referUid = '<sec:authorize access="isAuthenticated()"><sec:authentication property="details.user_id"/></sec:authorize>';
					//localStorage.setItem("referUrl",pageUrl);
					//localStorage.setItem("referUid",referUid);
					$("#logout").submit();					
				}
			}
			</script>
		</div>
	</nav>
</div>
	<style>
		#member_modifyform input{
			padding-left:0px !important;
		}

		#member_modifyform button:hover {
  			background-color: rgb(88,102,255);
  			color: white;
  			border-color:rgb(0,125,242);
		}
		
		#uPw, #pwChk, #uHp{
			margin-bottom: 0 !important;
		}
		
		.error{
			font-size:14px;
		}
	</style>
	<sec:authorize access="isAuthenticated()">
<!-- 회원정보 수정 -->
	 <div class="sub-window shadow" id="bg-MODIFY">
		<div class="fixed-window12 ">
			<a type="button" class="closebtn" id="closebtn1" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</a>
		</div>
		<div class="create-window-part px-4" style="padding-left:5rem!important;padding-right:5rem!important;position: relative;top: 30%;left: 50%;transform: translate(-50%, -55%);">
			<div class="form-group">
				<div>
					<b class="LOGIN-font mr-2" style="font-size:35px; font:noto sans kr; font-weight: 700">회원정보 수정</b>
				</div>
				<br>
				<div class="protocol-join">
					<P style="font-size:15px;">
						연락처 혹은 회사 및 부서가 변경되었을 경우 <br>해당 정보를 수정해주세요.
					</P>
					<br>
					<P style="font-size: 18px; color:#4153FF; font-weight: 500;">
						<sec:authentication property="details.user_id"/>
					</p>
				</div>
				<br>
				<form id="member_modifyform" name="member_modifyform"
					action="/member/modify?${_csrf.parameterName}=${_csrf.token}" method="post">
				<div class="info-body mb-3">
					<div class="mb-2 ">
						<input type="hidden" id="uId" name="id" value='${id.uid}'>
						<div class="float-left w-100 mb-2">
						<input type="password" class="form-control input-underline mb-2" id="uPw" name="uPw" placeholder="비밀번호(8자리이상,소문자/숫자/특수기호를 포함)">
						</div>
						<div class="float-left w-100 mb-2"> 
						<input type="password" class="form-control input-underline mb-2" id="pwChk" name="pwChk" placeholder="비밀번호 재입력">
						</div>
						<div class="float-left w-50 mb-2 pr-1">
						<input type="text" class="form-control input-underline mb-2" id="cNm" name="cNm" placeholder="회사명" value="<sec:authentication property="details.user_cp"/>">
						</div>
						<div class="float-left w-50 mb-2 pl-1">
						<c:set var="cpno"><sec:authentication property="details.user_cp_no"/></c:set> 
						<select id="cCtgrNo" name="cCtgrNo" class="form-control input-underline mb-2">
							<option value="0" <c:if test="${cpno eq 0 }">selected</c:if>>category</option> 
							<option value="1" <c:if test="${cpno eq 1 }">selected</c:if>>광고 대행사</option>
							<option value="2" <c:if test="${cpno eq 2 }">selected</c:if>>미디어 랩</option>
							<option value="3" <c:if test="${cpno eq 3 }">selected</c:if>>광고주</option>
							<option value="4" <c:if test="${cpno eq 4 }">selected</c:if>>개인</option>
						</select> 
						</div>
						<div class="float-left w-100 mb-2">
						<input type="text" class="form-control input-underline mb-2" id="uHp" name="uHp" placeholder="휴대전화(-를 제외하고 입력해 주세요)" value="<sec:authentication property="details.user_hp"/>">
						</div>
					</div>
				</div>
				<br>
				<div class="float-left w-100 m-0 py-2" style="display: flex; justify-content: center; align-items: center;">
					<button	class="btn1 btm-primary-login w-50 font-11" style="border-radius:0;" id="submitModify">확인</button>
				</div>
			</form>
			</div>
		</div>
	</div> 
	</sec:authorize>
<input type="hidden" id="datarget" value="${_csrf.token}">
<input type="hidden" id="cid" name="cid" value="${cid }">
<input type="hidden" id="cPrgsStts" name="cPrgsStts" value="${campaignInfo.cPrgsStts}">

<script>
	$.ajaxSetup({
		  cache: false
	});

function cmppf(){
	var cid = $("#cid").val(); 
	var cPrgsStts = $("#cPrgsStts").val();
	if(cPrgsStts<5){
		alert("캠페인 성과는 진행중이거나 종료된 캠페인에 한해 제공됩니다.");
	}
	else{
		location.href="/campaign/result/"+cid;
	}
}
</script>
