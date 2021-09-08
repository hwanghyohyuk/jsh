<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<html>
  <body>
  <input type="hidden" id="mid" value="" />
  			<div class="content-box-large">
  				<article>
					<div class="container-fluid" role="main">
						<form id="contentsForm">
							<input type="hidden" name="_csrf" value="${_csrf.token}">
							<div class="form-group">
								<label for="title">매뉴얼 제목</label> 
								<input type="text" class="form-control" name="title" id="title" aria-describedby="">
							</div>
							<div class="board_content" style="margin-top:20px;">
							
								<label for="editor">매뉴얼 내용</label> 
								<textarea name="contents" id="editor"></textarea>
							</div>
							<div style="margin-top : 20px">
								<a class="btn btn-sm btn-primary" type="button" onClick="writeContents();">등록</a>
								<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
							</div>
						</form>
					</div>
				</article>
  			</div>
	<script src="/resources/admin/js/manual/manual.js"></script>
	<script src="/resources/lib/ckeditor/ckeditor.js"></script>
	<script>
	CKEDITOR.replace( 'editor',{
		filebrowserUploadUrl:'/admin/ajax/upload/image?_csrf=${_csrf.token}'
	});
    	
	</script>
  </body>
</html>