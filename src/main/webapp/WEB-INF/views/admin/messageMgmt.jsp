<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
<head>
<link href="/resources/admin/css/styles.css" rel="stylesheet">
<link href="/resources/admin/bootstrap/css/messageMgmt.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
</head>
<body>
	<input type="hidden" id="adminId" name="adminId" value="${adminId }">
	<input type="hidden" id="userList" name="userList" value="${userList }">
	<div class="messaging">
		<div class="inbox_msg">
			<div class="inbox_people">
				<div class="headind_srch">
					<div class="recent_heading">
						<h4>Recent</h4>
					</div>
					<div class="srch_bar">
						<div class="stylish-input-group">
							<input onkeyup="filter()" type="text" id="value"
								class="search-bar" placeholder="Type to Search"> <span
								class="input-group-addon">
								<button type="button">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="inbox_chat">
					<c:forEach var="newMsgList" items="${newMsgList}">
						<div class="chat_list" id=${newMsgList.sender
							}  onclick="chatBoxOpen(<c:out value="${newMsgList.sender}"/>);">
			              		<div class="chat_people">
			                		<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
			                		<div class="chat_ib">
			                  			<h5><b class="userNm">${newMsgList.uId}</b> <span class="chat_date">${newMsgList.writeDate}</span></h5>
			                  			<b class="userRealNm">${newMsgList.uNm}</b>
			                  			<p>${newMsgList.contents}</p>
			                		</div>
			                		<input type="hidden" id="userNo" name="userNo" value="${newMsgList.sender}">
			              		</div>
			            	</div>
					</c:forEach>
				</div>
			</div>
			<%--메세지창 --%>
			<div class="mesgs" style="display: none;">
				<div class="msg_history" id="msgList"></div>
				<div class="type_msg">
					<div class="input_msg_write">
						<input type="text" class="write_msg" placeholder="Type a message" />
						<button class="msg_send_btn" type="button"
							onclick="messageSend();">
							<i class="fa fa-paper-plane-o" aria-hidden="true"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/resources/admin/js/messageMgmt/messageMgmt.js"></script>
</body>
</html>