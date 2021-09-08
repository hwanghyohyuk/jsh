<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 	
	

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- Modal -->
<div class="modal fade" id="manualModal" tabindex="-1" role="dialog" data-keyboard="false"
	aria-labelledby="manualModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header bb-1">
				<h5 class="modal-title" id="manualModalLabel">매뉴얼</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
			</div>
			<div class="modal-body p-0">
				<div class="container-fluid">
				<div class="row">
					<div class="col-2 modal-left-side">
						<ul class="manual-list">
						</ul>
					</div>
					<div class="col-10 manual-contents" style="min-height:600px">
						좌측의 메뉴를 통해 자세한 정보를 확인하실 수 있습니다.
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	var getManualList = function(e){
		$.ajax({
			url:'/campaign/ajax/manual/list',
			dataType:'json',
			type:'GET',
			error: function(request, status, error){
		         console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    },	   
			success : function(data) {
				var list = data.list;
				var manualList = $('.manual-list');
				var _li = $('<li></li>');
				var _button = $('<button class="btn btn-md btn-light"></button>');
				
				manualList.empty();
				
				/* 캠페인 목록 그리는 부분*/
				for(var i=0; i<list.length; i++){
					var mli = _li.clone();
					var mbt = _button.clone();
					mbt.text(list[i].title);
					mbt.val(list[i].mid);
					//클릭이벤트
					mbt.on("click",manualClick);
					mli.append(mbt);
					manualList.append(mli);
					
					if(i==0){
						mbt.click();
					}
				}
			}
		})
	}
	
	var manualClick = function(e){
		$('.manual-list .btn').removeClass("btn-primary");
		$('.manual-list .btn').addClass("btn-light");
		$(this).removeClass("btn-light");
		$(this).addClass("btn-primary");
		
		var dataSet = {
				mid : $(this).val()
		}
		
		$.ajax({
			url:'/campaign/ajax/manual/view',
			dataType:'json',
			type:'GET',
			data:dataSet,
			error: function(request, status, error){
		         console.log("데이터 조회 오류\ncode:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    },	   
			success : function(data) {
				var obj = data.contents;
				var manualContents = $('.manual-contents');
				
				manualContents.empty();
				
				/* 캠페인 목록 그리는 부분*/
				manualContents.html(obj.contents);
			}
		})
	}
	
	$("#manualModal").on("shown.bs.modal", getManualList);
	
	
</script>
