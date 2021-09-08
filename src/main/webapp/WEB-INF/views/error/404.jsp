<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DATARGET | ERROR</title>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/all.css">
<script>
	function fncGoAfterErrorPage() {
		history.back();
	}
</script>

</head>
<body>
	<div class="container text-center vh-100">
		<div class="row align-items-center h-100">
			<div class="col-6 mx-auto">
				<div class="jumbotron">
					<h1 class="display-4">Error</h1>
					<p class="lead my-5">페이지를 찾을 수 없습니다.</p>
					<p class="lead">
						<a href="#" class="btn btn-primary"
							onclick="fncGoAfterErrorPage()">&larr; 이전으로</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>