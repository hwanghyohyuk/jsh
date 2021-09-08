<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="container-fluid bg-footer h-350">
	<div class="container footer">
		<div class="row pt-80">
			<div class="col-2">
				<a class="" href="#"> <img src="/resources/images/logo-d.png">
				</a>
			</div>
			<div class="col" style="font-size: 15px;">
				<p>
					<b>회사명</b> 올이즈웰
				</p>
				<p>
					<b>대표</b> 한주원
				</p>
				<p>
					<b>사업자등록번호</b> 214-88-85886
				</p>
				<p>
					<b>주소지</b> 서울특별시 용산구 보광로60길 3 이화빌딩 5-7층
				</p>
				<p>
					<b>운영시간</b> 09:30 - 18:30
				</p>
				<p>datarget@alliswell.co.kr</p>
			</div>
			<div class="col-4 text-right">
				<a class="mr-4" href="#" data-toggle="modal" data-target="#pippModal"> <span>개인정보 처리방침</span>
				</a> <a class="" href="#" data-toggle="modal" data-target="#tosModal"> <span>서비스 이용약관</span>
				</a>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="inquireModal" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content no-border-radius">
			<div class="modal-header no-border-bottom">
				<h2 class="modal-title mx-auto fw-bold" id="inquireModalLabel">문의하기</h2>
			</div>
			<div class="modal-body">
				<form action="/inquire?_csrf=${_csrf.token }" method="post" name="inquireForm">
				<div class="container-fluid">
					<div class="row">
						<div class="col-1 no-padding-right">
							<p class="inquire-p">e-mail</p>
						</div>
						<div class="col-11 form-group">
							<sec:authorize access="isAuthenticated()">
								<input type="email" class="form-control no-border-radius border-color-primary" id="inq-email" name="email" aria-describedby="emailHelp" value="<sec:authentication property="details.user_id"/>">
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<input type="email" class="form-control no-border-radius border-color-primary" id="inq-email" name="email" aria-describedby="emailHelp">
							</sec:authorize>
						</div>
					</div>
					<div class="row">
						<div class="col-1 no-padding-right">
							<p class="inquire-p">제목</p>
						</div>
						<div class="col-11 form-group">
							<input type="text" class="form-control no-border-radius border-color-primary" id="inq-title" name="title" aria-describedby="titleHelp">
						</div>
					</div>
					<div class="row">
						<div class="col-1 no-padding-right">
							<p class="inquire-p">내용</p>
						</div>
						<div class="col-11 form-group">
							<textarea class="form-control no-border-radius border-color-primary" id="inq-contents" name="contents" rows="5"></textarea>
						</div>
					</div>
				</div>
				</form>
			</div>
			<div class="modal-footer no-border-top">
				<div class="w-50 mx-auto">
					<button type="button" data-dismiss="modal" aria-label="Close" class="btn btn-secondary bg-secondary w-49 border-radius-100 float-left">닫기</button>
					<button type="button" id="inquireSubmit" class="btn btn-primary bg-primary w-49 border-radius-100 float-right">보내기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="pippModal" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="pippModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="pippModalLabel">개인정보 처리방침</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body serviceRule p-4">
				<table>
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col>
					</colgroup>
					<tbody style="vertical-align: baseline;">
						<tr><td>1.</td><td colspan="3">개인정보의 처리 목적<br> (‘http://datarget.kr’이하 ‘데이타겟’)은 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.<br> - 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별, 인증, 회원자격 유지, 관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급, 배송 등 </td></tr>
						<tr><td>2.</td><td colspan="3">개인정보의 처리 및 보유 기간</td></tr>
						<tr><td></td><td>①</td><td colspan="2">데이타겟은 정보주체로부터 개인정보를 수집할 때 동의받은 개인정보 보유, 이용기간 또는 법령에 따른 개인정보 보유, 이용기간 내에서 개인정보를 처리, 보유합니다.</td></tr>
						<tr><td></td><td>②</td><td colspan="2">구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.<br> -전자상거래에서의 계약, 청약철회, 대금결제, 재화 등 공급기록 : 5년</td></tr>
						<tr><td>3.</td><td colspan="3">정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.</td></tr>
						<tr><td></td><td>①</td><td colspan="2">정보주체는 데이타겟에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.</td></tr>
						<tr><td></td><td></td><td>1.</td><td>개인정보 열람요구</td></tr>
						<tr><td></td><td></td><td>2.</td><td>오류 등이 있을 경우 정정요구</td></tr>
						<tr><td></td><td></td><td>3.</td><td>삭제요구</td></tr>
						<tr><td></td><td></td><td>4.</td><td>처리정지요구</td></tr>
						<tr><td>4.</td><td colspan="3">처리하는 개인정보의 항목</td></tr>
						<tr><td></td><td>①</td><td colspan="2">데이타겟은 다음의 개인정보 항목을 처리하고 있습니다.</td></tr>
						<tr><td></td><td>②</td><td colspan="2">필수항목 : 이메일, 휴대전화번호, 로그인ID, 이름, 회사명, 접속로그, 쿠키, 접속 IP정보</td></tr>
						<tr><td></td><td>③</td><td colspan="2">선택항목 : 회사전화번호</td></tr>
						<tr><td>5.</td><td colspan="3">개인정보의 파기<br>데이타겟은 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.</td></tr>
						<tr><td></td><td>①</td><td colspan="2">파기 절차<br>이용자가 입력한 정보는 목적 달성 후 별도의 DB 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</td></tr>
						<tr><td></td><td>②</td><td colspan="2">파기 기한<br>이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</td></tr>
						<tr><td></td><td>③</td><td colspan="2">선택항목 : 회사전화번호</td></tr>
						<tr><td>6.</td><td colspan="3">개인정보 자동수집장치의 설치·운영 및 거부에 관한 사항</td></tr>
						<tr><td></td><td>①</td><td colspan="2">데이타겟은 개별적인 맞춤 서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.</td></tr>
						<tr><td></td><td>②</td><td colspan="2">쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에 보내는 소량의 정보이며 이용자들의 PC 컴퓨터 내의 하드디스크에 저장되기도 합니다.</td></tr>
						<tr><td></td><td></td><td>1.</td><td>쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.</td></tr>
						<tr><td></td><td></td><td>2.</td><td>쿠키의 설치·운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부할 수 있습니다.</td></tr>
						<tr><td></td><td></td><td>3.</td><td>쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</td></tr>
						<tr><td>●</td><td colspan="3">개인정보처리책임자의 지정</td></tr>
						<tr><td></td><td>1.</td><td colspan="2">회사는 회원의 개인정보를 보호하기 위해 개인정보처리방침을 수립하고 개인정보보호책임자를 지정하여 이를 게시하고 운영합니다. 회사가 이용자에 대해 관련 개인정보를 안전하게 처리하기 위한 구체적인 내용은 회사가 별도로 정한 개인정보처리방침에 따릅니다.</td></tr>
						<tr><td></td><td>2.</td><td colspan="2">개인정보보호책임자의 구체적인 사항은 아래와 같습니다.</td></tr>
						<tr><td></td><td>3.</td><td colspan="2">데이타겟이 제공하는 모든 정보는 참고용도로만 사용할 수 있습니다. 데이타겟의 자료를 통해서 입은 어떠한 피해도 책임지지 않습니다.</td></tr>
						<tr><td></td><td></td><td>○</td><td>성명 : 이 동길</td></tr>
						<tr><td></td><td></td><td>○</td><td>직책 : 팀장</td></tr>
						<tr><td></td><td></td><td>○</td><td>직급 : 차장</td></tr>
						<tr><td></td><td></td><td>○</td><td>이메일 주소 : leedonggil@alliswell.co.kr</td></tr>
						<tr><td></td><td></td><td>○</td><td>연락처 : 02-586-0072</td></tr>
						<tr><td>7.</td><td colspan="3">개인정보 처리방침 변경</td></tr>
						<tr><td></td><td>①</td><td colspan="2">이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</td></tr>
						<tr><td>8.</td><td colspan="3">개인정보의 안전성 확보 조치<br>데이타겟은 개인정보보호법 제29 조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.</td></tr>
						<tr><td></td><td>①</td><td colspan="2">개인정보 취급 직원의 최소화 교육<br>개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화하여 개인정보를 관리하는 대책을 시행하고 있습니다.</td></tr>
						<tr><td></td><td>②</td><td colspan="2">개인정보의 암호화<br>이용자의 개인정보는 비밀번호는 암호화되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</td></tr>
						<tr><td></td><td>③</td><td colspan="2">접속기록의 보관 및 위변조 방지<br>개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.</td></tr>
						<tr><td></td><td>④</td><td colspan="2">개인정보에 대한 접근 제한<br>개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단 시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</td></tr>
						<tr><td></td><td>⑤</td><td colspan="2">문서보안을 위한 잠금장치 사용<br>개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.</td></tr>
						<tr><td></td><td>⑥</td><td colspan="2">비인가자에 대한 출입 통제<br>개인정보를 보관하고 있는 물리적 보관장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</td></tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary mx-auto" data-dismiss="modal"
					aria-label="Close">확인</button>
			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="tosModal" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="tosModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="tosModalLabel">서비스 이용약관</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body serviceRule p-4">
				<table>
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col>
					</colgroup>
					<tbody style="vertical-align: baseline;">
						<tr><td>●</td><td colspan="3">총칙</td></tr>
						<tr><td></td><td>1.</td><td colspan="2">목적<br>본 약관은 회원(서비스 약관에 동의한 자를 말합니다. 이하 “회원”)이 주식회사 올이즈웰(이하 “회사”)가 제공하는 데이타겟 서비스(이하 “서비스”)를 이용함에 있어 회사와 회원의 권리ㆍ의무 및 책임사항을 규정함을 목적으로 합니다.</td></tr>
						<tr><td></td><td>2.</td><td colspan="2">데이타겟이 제공하는 옥외 광고물의 위치에 따른 인구 관련 정보(광고 노출 가능 인구 등)는 서울시에서 제공하는 공공 자료를 토대로 제공됩니다. 그 밖의 자료는 정부 기관 및 지자체에서 제공하는 공공 자료를 토대로 가공하여 제공됩니다.</td></tr>
						<tr><td></td><td>3.</td><td colspan="2">데이타겟이 제공하는 모든 정보는 참고용도로만 사용할 수 있습니다. 데이타겟의 자료를 통해서 입은 어떠한 피해도 책임지지 않습니다.</td></tr>
						<tr><td>●</td><td colspan="3">이용약관의 효력 및 변경</td></tr>
						<tr><td></td><td>1.</td><td colspan="2">본 약관은 서비스를 신청한 이용자가 본 약관에 동의하고 회사가 정한 소정의 절차에 따라 서비스의 회원으로 등록함으로써 효력이 발생합니다.</td></tr>
						<tr><td></td><td>2.</td><td colspan="2">회원이 온라인에서 본 약관의 “동의하기” 버튼을 클릭하였을 경우 본 약관의 내용을 모두 읽고 이를 충분히 이해하였으며, 그 적용에 동의한 것으로 봅니다.</td></tr>
						<tr><td></td><td>3.</td><td colspan="2">회사는 개인정보의 보호 및 이용 등에 관한 법률, 콘텐츠산업 진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 소비자 기본법 약관의 규제에 관한 법률 등 관련법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.</td></tr>
						<tr><td></td><td>4.</td><td colspan="2">회사가 약관을 개정할 경우에는 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 7일 전부터 적용일 이후 상당한 기간동안 공지만을 하고, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 30일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 게시하거나 회원에게 전자적 형태(전자우편, SMS, 웹사이트 내 메시지)로 약관 개정 사실을 발송하여 고지합니다.</td></tr>
						<tr><td></td><td>5.</td><td colspan="2">회사가 전항에 따라 회원에게 통지하면서 공지 또는 공지ㆍ고지일로부터 개정약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 이용약관에 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 이용계약을 해지할 수 있습니다.</td></tr>
						<tr><td>●</td><td colspan="3">관계법령의 적용<br>본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 관계법령 또는 상관례에 따릅니다.</td></tr>
						<tr><td>●</td><td colspan="3">서비스의 내용<br>회사가 제공하는 서비스는 아래와 같습니다.</td></tr>
						<tr><td></td><td>○</td><td colspan="2">서비스명 : 데이타겟</td></tr>
						<tr><td></td><td>○</td><td colspan="2">서비스 내용 : 옥외 광고물 및 광고물의 위치에 관련된 관련 정보를 지도와 함께 제공하는 서비스</td></tr>
						<tr><td>●</td><td colspan="3">서비스의 이용요금</td></tr>
						<tr><td></td><td>1.</td><td colspan="2">회사가 제공하는 서비스는 기본적으로 무료입니다. 단, 옥외 광고의 집행의 경우 해당 옥외 광고물의 광고 요금을 지불하여야 합니다.</td></tr>
						<tr><td></td><td>2.</td><td colspan="2">옥외 광고의 집행의 경우 대금지급방법은 상호간의 합의에 따라 정할 수 있습니다.</td></tr>
						<tr><td></td><td>3.</td><td colspan="2">옥외 광고 집행을 통하여 결제된 대금에 대한 취소 및 환불은 회사의 결제 이용 약관 등 관계법에 따릅니다.</td></tr>
						<tr><td></td><td>4.</td><td colspan="2">회원의 개인정보도용 및 결제사기로 인한 환불요청 또는 결제자의 개인정보 요구는 법률이 정한 경우 외에는 거절될 수 있습니다.</td></tr>
						<tr><td></td><td>5.</td><td colspan="2">서비스 이용에 따라 발생하는 데이터 통신료는 별도이며 가입한 각 이동통신사의 정책에 따릅니다.</td></tr>
						<tr><td>●</td><td colspan="3">서비스 내용변경 통지 등</td></tr>
						<tr><td></td><td>1.</td><td colspan="2">회사가 서비스 내용을 변경하거나 종료하는 경우 웹사이트를 통해 공지하거나 회원의 등록된 전자우편 주소로 이메일을 통하여 서비스 내용의 변경사항 또는 종료를 통지할 수 있습니다.</td></tr>
						<tr><td>●</td><td colspan="3">서비스 이용의 제한 및 중지</td></tr>
						<tr><td></td><td>1.</td><td colspan="2">회사는 아래 각 호의 1에 해당하는 사유가 발생한 경우에는 회원의 서비스 이용을 제한하거나 중지시킬 수 있습니다.</td></tr>
						<tr><td></td><td></td><td>1.</td><td>회원이 회사 서비스의 운영을 고의 또는 중과실로 방해하는 경우</td></tr>
						<tr><td></td><td></td><td>2.</td><td>서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우</td></tr>
						<tr><td></td><td></td><td>3.</td><td>전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우</td></tr>
						<tr><td></td><td></td><td>4.</td><td>국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때</td></tr>
						<tr><td></td><td></td><td>5.</td><td>기타 중대한 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는 경우</td></tr>
						<tr><td></td><td>2.</td><td colspan="2">회사는 전항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 회원에게 알려야 합니다.</td></tr>
						<tr><td>●</td><td colspan="3">손해배상</td></tr>
						<tr><td></td><td>1.</td><td colspan="2">회사는 서비스를 이용함에 있어 회사의 고의 또는 과실로 인해 손해가 발생한 경우에는 민법 등 관련 법령이 규율하는 범위 내에서 그 손해를 배상합니다. 다만, 회사는 아래와 같은 손해에 대해서는 회사의 고의 또는 중대한 과실이 없는 한 책임을 부담하지 않습니다. 또한 회사는 법률상 허용되는 한도 내에서 간접 손해, 특별 손해, 결과적 손해, 징계적 손해 및 징벌적 손해에 대한 책임을 부담하지 않습니다.</td></tr>
						<tr><td></td><td></td><td>1.</td><td>천재지변 또는 이에 준하는 불가항력의 상태에서 발생한 손해</td></tr>
						<tr><td></td><td></td><td>2.</td><td>이용자의 귀책사유로 서비스 이용에 장애가 발생한 경우</td></tr>
						<tr><td></td><td></td><td>3.</td><td>서비스에 접속 또는 이용과정에서 발생하는 개인적인 손해</td></tr>
						<tr><td></td><td></td><td>4.</td><td>제3 자가 불법적으로 회사의 서버에 접속하거나 서버를 이용함으로써 발생하는 손해</td></tr>
						<tr><td></td><td></td><td>5.</td><td>제3 자가 회사 서버에 대한 전송 또는 회사 서버로부터의 전송을 방해함으로써 발생하는 손해</td></tr>
						<tr><td></td><td></td><td>6.</td><td>제3 자가 악성 프로그램을 전송 또는 유포함으로써 발생하는 손해</td></tr>
						<tr><td></td><td></td><td>7.</td><td>전송된 데이터의 생략, 누락, 파괴 등으로 발생한 손해, 명예훼손 등 제3 자가 서비스를 이용하는 과정에서 발생한 손해</td></tr>
						<tr><td></td><td></td><td>8.</td><td>기타 회사의 고의 또는 과실이 없는 사유로 인해 발생한 손해</td></tr>
						<tr><td></td><td>2.</td><td colspan="2">회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 회원의 손해에 대하여는 책임을 부담하지 아니합니다.</td></tr>
						<tr><td></td><td>3.</td><td colspan="2">회사는 법령상 허용되는 한도 내에서 서비스와 관련하여 본 약관에 명시되지 않은 어떠한 구체적인 사항에 대한 약정이나 보증을 하지 않습니다. 또한, 회사는 자료에 대한 사실의 신뢰도 및 정확성 등에 대해서는 보증을 하지 않으며, 회사의 고의 또는 중대한 과실 없이 발생된 이용자의 손해에 대하여는 책임을 부담하지 않습니다.</td></tr>
						<tr><td></td><td>4.</td><td colspan="2">회원이 본 약관의 규정을 위반하여 회사에 손해가 발생한 경우 회사는 회원에 대하여 손해배상을 청구할 수 있습니다. 이 경우 회원은 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.</td></tr>
						<tr><td>●</td><td colspan="3">분쟁해결</td></tr>
						<tr><td></td><td>1.</td><td colspan="2">회사는 분쟁이 발생하였을 경우에 이용자가 제기하는 정당한 의견이나 불만을 반영하여 적절하고 신속한 조치를 취합니다. 다만, 신속한 처리가 곤란한 경우에 회사는 이용자에게 그 사유와 처리일정을 통보합니다.</td></tr>
						<tr><td>●</td><td colspan="3">개인정보처리책임자의 지정</td></tr>
						<tr><td></td><td>1.</td><td colspan="2">회사는 회원의 개인정보를 보호하기 위해 개인정보처리방침을 수립하고 개인정보보호책임자를 지정하여 이를 게시하고 운영합니다. 회사가 이용자에 대해 관련 개인정보를 안전하게 처리하기 위한 구체적인 내용은 회사가 별도로 정한 개인정보처리방침에 따릅니다.</td></tr>
						<tr><td></td><td>2.</td><td colspan="2">개인정보보호책임자의 구체적인 사항은 아래와 같습니다.</td></tr>
						<tr><td></td><td></td><td>○</td><td>성명 : 이 동길</td></tr>
						<tr><td></td><td></td><td>○</td><td>직책 : 팀장</td></tr>
						<tr><td></td><td></td><td>○</td><td>직급 : 차장</td></tr>
						<tr><td></td><td></td><td>○</td><td>이메일 주소 : leedonggil@alliswell.co.kr</td></tr>
						<tr><td></td><td></td><td>○</td><td>연락처 : 02-586-0072</td></tr>
						<tr><td>●</td><td colspan="3">회사의 연락처<br>회사의 상호 및 주소 등은 다음과 같습니다.</td></tr>
						<tr><td></td><td>○</td><td colspan="2">상호 : 주식회사 올이즈웰</td></tr>
						<tr><td></td><td>○</td><td colspan="2">대표자 : 한주원, 양광철</td></tr>
						<tr><td></td><td>○</td><td colspan="2">주소 : 서울특별시 서초구 효령로 318, 202</td></tr>
						<tr><td></td><td>○</td><td colspan="2">대표전화 : 02-586-0072</td></tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary mx-auto" data-dismiss="modal"
					aria-label="Close">확인</button>
			</div>
		</div>
	</div>
</div>
