<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
  <head>
    <link href="/resources/admin/css/dataMgmt.css" rel="stylesheet">
  </head>
  <body>
  			<div class="content-box-large">
  				<div class="panel-heading">
					<div class="panel-title" style="font-size:30px;">데이터 관리 - 생활인구(행정동)</div>
				</div>
				
				<div class="submenubtn" style="margin: 50px 0px 10px 0px; padding-left: 15px;">
					<button class="btn btn-primary" onclick="javascript:location.href='dataMgmt'">지하철승하차인원</button>
					<button class="btn btn-primary" style="background-color: white; color: black; pointer-events: none;">생활인구(행정동)</button>
					<button class="btn btn-primary" onclick="javascript:location.href='dataMgmt_JGG'">생활인구(집계구)</button>
				</div>
					
				<div class="panel-body">
					<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>API URL</th>
								<th>API 키값</th>
								<th>API 서비스</th>
								<th>API 요청타입</th>
								<th>변경</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="apiInfo" items="${apiInfo}" varStatus="status">
								<tr class="odd gradeX">
									<td id="apiUrl">${apiInfo.apiUrl}</td>
									<td id="apiKey">${apiInfo.apiKey}</td>
									<td id="apiService">${apiInfo.apiService}</td>
									<td id="apiType">${apiInfo.apiType}</td>
									<th style="width: 100px;">
										<button class="btn btn-info" style="width: 80px; height: 20px; padding: 0;" onclick="outerwall_dbupdate(<c:out value="${status.index}"/>);">
											<i class="glyphicon glyphicon-refresh"></i>변경
										</button>
									</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
  				<div class="panel-body">
					<div class="logList">
	  					<c:forEach var="log" items="${ScheduledLog}" varStatus="status">
							<div class="loginfo errorCk${status.index}">
								<div class="logMsg">수집일자 : ${log.workDt}</div>
								<div class="logMsg">사용일자 : ${log.useDt}</div>
								<div class="logMsg">수집한 데이터 갯수는 : ${log.listTotalCount}개</div>
								<div class="logMsg">사이즈는 : ${log.size}kB</div>
								<div class="logMsg msgCode${status.index}">코드 : ${log.code}</div> 
								<div class="logMsg">수집결과 : ${log.message}</div>
							</div>
						</c:forEach>
					</div>
  				</div>
  			</div>
	<script src="/resources/admin/js/dataMgmt/dataMgmt.js"></script>
</body>
</html>
