<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<input type="hidden" id="datarget" value="${_csrf.token}">

<div class="modal fade" id="inquireMSModal" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">메세지 보내기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="/admin/messageSend" method="get" name="inquireMSModal">
					<input type="hidden" id="adminId" name="adminId" value="">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">ID(이메일)</p>
							</div>
							<div class="col-8 form-group">
								<input type="email" class="form-control" id="inq-email"
									name="email" aria-describedby="emailHelp" value="">
							</div>
						</div>
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">제목</p>
							</div>
							<div class="col-8 form-group">
								<input type="text" class="form-control" id="inq-title"
									name="title" aria-describedby="titleHelp" placeholder="제목 입력">
							</div>
						</div>
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">내용</p>
							</div>
							<div class="col-8 form-group">
								<textarea class="form-control" id="inq-contents" name="contents"
									rows="5" placeholder="문의 내용 입력"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="modalMessageSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<!-- fileModal -->
<div class="modal fade" id="FileModal" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">이미지 업로드</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/insertFile?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="FileForm" id="FileForm"
					enctype="multipart/form-data">
					<input type="hidden" id="filelistOrgN1" name="filelistOrgN1" value="">
					<input type="hidden" id="filelistOrgN2" name="filelistOrgN2" value="">
					<input type="hidden" id="filelistOrgN3" name="filelistOrgN3" value="">
					<input type="hidden" id="filelistNo1" name="filelistNo1" value="">
					<input type="hidden" id="filelistNo2" name="filelistNo2" value="">
					<input type="hidden" id="filelistNo3" name="filelistNo3" value="">
					<input type="hidden" id="cCtxt" name="cCtxt" value=""> 
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">파일1</p>
							</div>
							<div class="col-8 form-group btn-file">
							<label class="btn btn-default btn-file">
								파일 추가</label>
								<input type="file" class="form-control" id="file1" name="file1"
									aria-describedby="titleHelp" onchange="javascript: document.getElementById('fileName1').value = this.value">
								<input type="text" id="fileName1" name="fileName1" style="width: 460px; height: 31px;">
							</div>
						</div>

						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">파일2</p>
							</div>
							<div class="col-8 form-group btn-file">
							<label class="btn btn-default btn-file">
								파일 추가</label>
								<input type="file" class="form-control" id="file2" name="file2"
									aria-describedby="titleHelp" onchange="javascript: document.getElementById('fileName2').value = this.value">
								<input type="text" id="fileName2" name="fileName2" style="width: 460px; height: 31px;">
							</div>
						</div>

						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">파일3</p>
							</div>
							<div class="col-8 form-group btn-file">
							<label class="btn btn-default btn-file">
								파일 추가</label>
								<input type="file" class="form-control" id="file3" name="file3"
									aria-describedby="titleHelp" onchange="javascript: document.getElementById('fileName3').value = this.value">
								<input type="text" id="fileName3" name="fileName3" style="width: 460px; height: 31px;">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a type="button" id="FileSubmit" class="btn btn-secondary mx-auto">확인</a>
					</div>
					<div>
						<p style="font-weight: bold; color: red;">
							이미지 업로드는 파일 3개 전부 추가해야 첨부 가능합니다.
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- BillboardExcelupload Modal -->
<div class="modal fade" id="BillboardExcelupload" tabindex="-1"
	role="dialog" data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">미디어 추가하기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/BillboardExcelupload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="BillboardExcelForm"
					enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">Excel 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="BillboardExcelSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
					<div>
						<p style="font-weight: bold;">해당 양식을 다운받아서 데이터를 입력 후 업로드 해주세요.</p>
						<p style="font-weight: bold; color: red;">*양식이 다를경우 업로드가 되지않습니다.</p>
						<a href="/admin/download?fileName=billboardUploadFile.xlsx">빌보드 양식 다운로드</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- ShelterExcelupload Modal -->
<div class="modal fade" id="ShelterExcelupload" tabindex="-1"
	role="dialog" data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">미디어 추가하기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/ShelterExcelupload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="ShelterExcelForm" enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">Excel 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="ShelterExcelSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
					<div>
						<p style="font-weight: bold;">해당 양식을 다운받아서 데이터를 입력 후 업로드 해주세요.</p>
						<p style="font-weight: bold; color: red;">*양식이 다를경우 업로드가 되지않습니다.</p>
						<a href="/admin/download?fileName=shelterUploadFile.xlsx">쉘터 양식 다운로드</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- PsdExcelupload Modal -->
<div class="modal fade" id="PsdExcelupload" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">미디어 추가하기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/PsdExcelupload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="PsdExcelForm" enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">Excel 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="PsdExcelSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
					<div>
						<p style="font-weight: bold;">해당 양식을 다운받아서 데이터를 입력 후 업로드 해주세요.</p>
						<p style="font-weight: bold; color: red;">*양식이 다를경우 업로드가 되지않습니다.</p>
						<a href="/admin/download?fileName=psdUploadFile.xlsx">PSD 양식 다운로드</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- GdiaExcelupload Modal -->
<div class="modal fade" id="GdiaExcelupload" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">미디어 추가하기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/GdiaExcelupload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="GdiaExcelForm" enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">Excel 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="GdiaExcelSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
					<div>
						<p style="font-weight: bold;">해당 양식을 다운받아서 데이터를 입력 후 업로드 해주세요.</p>
						<p style="font-weight: bold; color: red;">*양식이 다를경우 업로드가 되지않습니다.</p>
						<a href="/admin/download?fileName=gdiaUploadFile.xlsx">GDIA 양식 다운로드</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- BusExcelupload Modal -->
<div class="modal fade" id="BusExcelupload" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">미디어 추가하기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/BusExcelupload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="BusExcelForm" enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">Excel 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="BusExcelSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
					<div>
						<p style="font-weight: bold;">해당 양식을 다운받아서 데이터를 입력 후 업로드 해주세요.</p>
						<p style="font-weight: bold; color: red;">*양식이 다를경우 업로드가 되지않습니다.</p>
						<a href="/admin/download?fileName=busUploadFile.xlsx">버스래핑 양식 다운로드</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- MediaboardExcelupload Modal -->
<div class="modal fade" id="MediaboardExcelupload" tabindex="-1"
	role="dialog" data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">미디어 추가하기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/MediaboardExcelupload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="MediaboardExcelForm"
					enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">Excel 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="MediaboardExcelSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
					<div>
						<p style="font-weight: bold;">해당 양식을 다운받아서 데이터를 입력 후 업로드 해주세요.</p>
						<p style="font-weight: bold; color: red;">*양식이 다를경우 업로드가 되지않습니다.</p>
						<a href="/admin/download?fileName=mediaboardUploadFile.xlsx">포커스미디어 양식 다운로드</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- TownboardExcelupload Modal -->
<div class="modal fade" id="TownboardExcelupload" tabindex="-1"
	role="dialog" data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">미디어 추가하기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/TownboardExcelupload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="TownboardExcelForm"
					enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">Excel 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="TownboardExcelSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
					<div>
						<p style="font-weight: bold;">해당 양식을 다운받아서 데이터를 입력 후 업로드 해주세요.</p>
						<p style="font-weight: bold; color: red;">*양식이 다를경우 업로드가 되지않습니다.</p>
						<a href="/admin/download?fileName=townboardUploadFile.xlsx">타운보드 양식 다운로드</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- EdisplayExcelupload Modal -->
<div class="modal fade" id="EdisplayExcelupload" tabindex="-1"
	role="dialog" data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">미디어 추가하기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/EdisplayExcelupload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="EdisplayExcelForm"
					enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">Excel 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="EdisplayExcelSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
					<div>
						<p style="font-weight: bold;">해당 양식을 다운받아서 데이터를 입력 후 업로드 해주세요.</p>
						<p style="font-weight: bold; color: red;">*양식이 다를경우 업로드가 되지않습니다.</p>
						<a href="/admin/download?fileName=edisplayUploadFile.xlsx">디지털빌보드 양식 다운로드</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- OuterwallExcelupload Modal -->
<div class="modal fade" id="OuterwallExcelupload" tabindex="-1"
	role="dialog" data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">미디어 추가하기</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/OuterwallExcelupload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="OuterwallExcelForm"
					enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">Excel 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="OuterwallExcelSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
					<div>
						<p style="font-weight: bold;">해당 양식을 다운받아서 데이터를 입력 후 업로드 해주세요.</p>
						<p style="font-weight: bold; color: red;">*양식이 다를경우 업로드가 되지않습니다.</p>
						<a href="/admin/download?fileName=outerwallUploadFile.xlsx">빌딩외벽 양식 다운로드</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- cmp ppt upload Modal -->
<div class="modal fade" id="campaignpptUpload" tabindex="-1"
	role="dialog" data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">캠페인 게재보고서 업로드</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/CampaignPptUpload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="CampaignpptForm"
					enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<input type="hidden" id="cCtxt" name="cCtxt" value="">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">PPT 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="CampaignpptSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="introduction_Modal" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">미디어 소개서 업로드</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="/admin/introductionUpload?${_csrf.parameterName}=${_csrf.token}" method="post" name="introductionForm" enctype="multipart/form-data">					
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file" aria-describedby="titleHelp">
								<input type="hidden" id="gid" name="gid" value="">
								<input type="hidden" id="media" name="media" value="">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a type="button" id="introductionSubmit" class="btn btn-secondary mx-auto">확인</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="makeingGuide_Modal" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">제작가이드 업로드</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="/admin/makingGuideUpload?${_csrf.parameterName}=${_csrf.token}" method="post" name="makeingGuideForm" enctype="multipart/form-data">					
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file" aria-describedby="titleHelp">
								<input type="hidden" id="gid" name="gid" value="">
								<input type="hidden" id="media" name="media" value="">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a type="button" id="makeingGuideSubmit" class="btn btn-secondary mx-auto">확인</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="popupImg_Modal" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">팝업이미지 업로드</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="/admin/popImgUpload?${_csrf.parameterName}=${_csrf.token}" method="post" name="popupImgForm" enctype="multipart/form-data">					
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p floorPlan">파일1</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file" aria-describedby="titleHelp">
								<input type="hidden" id="gid" name="gid" value="">
								<input type="hidden" id="media" name="media" value="">
							</div>
							<div class="col-2 offset-1">
								<p class="inquire-p">파일2</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file2" name="file2" aria-describedby="titleHelp">
							</div>
							<div class="col-2 offset-1">
								<p class="inquire-p">파일3</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file3" name="file3" aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a type="button" id="popupImgSubmit" class="btn btn-secondary mx-auto">확인</a>
					</div>
					<div>
						<p style="font-weight: bold; color: red;">
							팝업 이미지는 한번에 최대 3개의 파일까지 업로드가 가능합니다.
						</p>
						<p style="font-weight: bold; color: red;">
							도면 파일 업로드시 꼭 파일 첨부창 가장 첫번째 도면 첨부공간에 업로드 해주세요.
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="integration_Modal" tabindex="-1" role="dialog"
	data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">통합 업로드</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="/admin/integrationUpload?${_csrf.parameterName}=${_csrf.token}" method="post" name="integrationForm" enctype="multipart/form-data">					
					<div class="container-fluid">
						<div class="row" id="mediaDiv">
							<div class="col-2 offset-1">
								<p class="inquire-p">구분</p>
							</div>
							<div class="col-8 form-group">
								<select id="integrationCombo" name="integrationCombo" onchange="setIntegrationModal()">
									<option value="pop">팝업이미지</option>              
									<option value="intro">미디어소개서</option>
									<option value="guide">제작가이드</option>
								</select>
							</div>
							<div class="col-2 offset-1 typeflag1" style="display:none;">
								<p class="inquire-p">미디어타입</p>
							</div>	
							<div class="col-8 form-group typeflag2" style="display:none;">
								<label><input type="radio" name="shelterType" value="A"> A</label>
								<label><input type="radio" name="shelterType" value="A-1"> A-1</label>
								<label><input type="radio" name="shelterType" value="A-2"> A-2</label>
								<label><input type="radio" name="shelterType" value="A-3"> A-3</label>
								<label><input type="radio" name="shelterType" value="B"> B</label>
								<label><input type="radio" name="shelterType" value="B-1"> B-1</label>
								<label><input type="radio" name="shelterType" value="B-2"> B-2</label>
								<label><input type="radio" name="shelterType" value="B-3"> B-3</label>
								<label><input type="radio" name="shelterType" value="기설"> 기설</label>
							</div>
							<div class="col-2 offset-1 typeflag3" style="display:none;">
								<p class="inquire-p">미디어타입</p>
							</div>
							<div class="col-8 form-group typeflag4" style="display:none;">
								<label><input type="radio" name="shelterType" value="수직"> 수직</label>
								<label><input type="radio" name="shelterType" value="수평"> 수평</label>
							</div>
							<div class="col-2 offset-1 typeflag5" style="display:none;">
								<p class="inquire-p">미디어타입</p>
							</div>
							<div class="col-8 form-group typeflag6" style="display:none;">
								<label><input type="radio" name="shelterType" value="TS"> TS</label>
								<label><input type="radio" name="shelterType" value="TS(시범)"> TS(시범)</label>
								<label><input type="radio" name="shelterType" value="TS(표준형)"> TS(표준형)</label>
							</div>
						</div>
						<div class="row" id="fileDiv">
							<div class="col-2 offset-1">
								<p class="inquire-p floorPlan">파일1</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file" aria-describedby="titleHelp">
								<input type="hidden" id="media" name="media" value="">
							</div>
							<div class="col-2 offset-1 popflag1" style="display:none;">
								<p class="inquire-p">파일2</p>
							</div>
							<div class="col-8 form-group popflag2" style="display:none;">
								<input type="file" class="form-control" id="file2" name="file2" aria-describedby="titleHelp">
							</div>
							<div class="col-2 offset-1 popflag3" style="display:none;">
								<p class="inquire-p">파일3</p>
							</div>
							<div class="col-8 form-group popflag4" style="display:none;">
								<input type="file" class="form-control" id="file3" name="file3" aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a type="button" id="integrationSubmit" class="btn btn-secondary mx-auto">확인</a>
					</div>
					<div class="popinfo" style="display:none;">
						<p style="font-weight: bold; color: red;">
							팝업 이미지는 한번에 최대 3개의 파일까지 업로드가 가능합니다.
						</p>
						<p style="font-weight: bold; color: red;">
							도면 파일 업로드시 꼭 파일 첨부창 가장 첫번째 도면 첨부공간에 업로드 해주세요.
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="reservationDB_shelter" tabindex="-1"
	role="dialog" data-backdrop="static" data-keyboard="false"
	aria-labelledby="inquireModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content ">
			<div class="modal-header">
				<h4 class="modal-title" id="inquireModalLabel">예약DB업로드</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form
					action="/admin/ShelterResDBupload?${_csrf.parameterName}=${_csrf.token}"
					method="post" name="ShelterResDBForm" enctype="multipart/form-data">
					<input type="hidden" id="datarget" value="${_csrf.token}">
					<div class="container-fluid">
						<div class="row">
							<div class="col-2 offset-1">
								<p class="inquire-p">Excel 파일</p>
							</div>
							<div class="col-8 form-group">
								<input type="file" class="form-control" id="file" name="file"
									aria-describedby="titleHelp">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="ShelterResDBSubmit"
							class="btn btn-secondary mx-auto">확인</button>
					</div>
					<div>
						<p style="font-weight: bold;">해당 양식을 다운받아서 데이터를 입력 후 업로드 해주세요.</p>
						<p style="font-weight: bold; color: red;">*양식이 다를경우 업로드가 되지않습니다.</p>
						<a href="/admin/download?fileName=reservationDBfile.xlsx">예약DB 다운로드</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	function logout() {
		$("#logout").submit();
	}
	$(document).ready(function() {
		$("#modalSubmit").on("click", function() {
			var inquireForm = document.inquireForm;

			inquireForm.submit();
		});
		$("#modalMessageSubmit").on("click", function() {
			var inquireMSModal = document.inquireMSModal;

			inquireMSModal.submit();
		});
		
		   $("#FileSubmit").on("click", function() {
				var fileName1 = $("#fileName1").val();
				var fileName2 = $("#fileName2").val();
				var fileName3 = $("#fileName3").val();
				if(fileName1 !="" && fileName2 !="" && fileName3 !=""){
				var FileForm = document.FileForm;
				alert("업로드가 완료되었습니다.");
				FileForm.submit();
				}else{
					alert("파일을 전부 첨부해주세요.")
				}
		});
		   $("#ShelterExcelSubmit").on("click", function() {
				var ShelterExcelForm = document.ShelterExcelForm;

				ShelterExcelForm.submit();
			});
		   $("#PsdExcelSubmit").on("click", function() {
				var PsdExcelForm = document.PsdExcelForm;

				PsdExcelForm.submit();
			});
		   $("#GdiaExcelSubmit").on("click", function() {
				var GdiaExcelForm = document.GdiaExcelForm;

				GdiaExcelForm.submit();
			});
		   $("#BusExcelSubmit").on("click", function() {
				var BusExcelForm = document.BusExcelForm;

				BusExcelForm.submit();
			});
		   $("#MediaboardExcelSubmit").on("click", function() {
				var MediaboardExcelForm = document.MediaboardExcelForm;

				MediaboardExcelForm.submit();
			});
		   $("#TownboardExcelSubmit").on("click", function() {
				var TownboardExcelForm = document.TownboardExcelForm;

				TownboardExcelForm.submit();
			});
		   $("#EdisplayExcelSubmit").on("click", function() {
				var EdisplayExcelForm = document.EdisplayExcelForm;

				EdisplayExcelForm.submit();
			});
		   $("#OuterwallExcelSubmit").on("click", function() {
				var OuterwallExcelForm = document.OuterwallExcelForm;
				
				OuterwallExcelForm.submit();
			});
		   $("#BillboardExcelSubmit").on("click", function() {
				var BillboardExcelForm = document.BillboardExcelForm;

				BillboardExcelForm.submit();
			});
		   $("#busGetOnoffExcelSubmit").on("click", function() {
				var busGetOnoffExcelForm = document.busGetOnoffExcelForm;

				busGetOnoffExcelForm.submit();
			});
		   $("#stationGetOnoffExcelSubmit").on("click", function() {
				var stationGetOnoffExcelForm = document.stationGetOnoffExcelForm;

				stationGetOnoffExcelForm.submit();
			});
		   $("#CampaignpptSubmit").on("click", function() {
				var CampaignpptForm = document.CampaignpptForm;
				
				CampaignpptForm.submit();
			});
		   
			$("#introductionSubmit").on("click", function() {
				var introductionFrom = document.introductionForm;	
				introductionFrom.submit();
			});
			
			$("#makeingGuideSubmit").on("click", function() {
				var makeingGuideForm = document.makeingGuideForm;	
				makeingGuideForm.submit();
			});
			
			$("#popupImgSubmit").on("click", function() {
				var popupImgForm = document.popupImgForm;	
				popupImgForm.submit();
			});
			
			$("#integrationSubmit").on("click", function() {
				var integrationForm = document.integrationForm;	
				integrationForm.submit();
			});
			
			$("#ShelterResDBSubmit").on("click", function() {
				var ShelterResDBForm = document.ShelterResDBForm;	
				ShelterResDBForm.submit();
			});
	});
</script>