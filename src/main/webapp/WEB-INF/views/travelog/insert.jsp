<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nv" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>hello travelers♡</title>

<style>
.container {
	background-color: Azure;
}
</style>

<script>
$(document).ready(function() {
	$("#submit-btn1").click(function(e) {
		e.preventDefault();
		
		var title = $("#input1").val().trim();
		var city = $("#input3").val().trim();
		var company = $("#input4").val().trim();
		var content = $("#textarea1").val().trim();
		
		if (title && city && company && content) {
			$("#insert-form1").submit();
		} else {
			alert("제목, 방문도시, 이용회사, 내용을 모두 입력하세요")
		}
	});
});
</script>

</head>
<body>
<nv:navbar></nv:navbar>
<br><br><br><br>
	<h3 style="text-align:center;color:DodgerBlue; font-family: monospace;">${pinfo.member.username }님의 유럽기억</h3><br>
<div class="container">
<br>
<div class="row">
	<div class="col-12">
		<form id="insert-form1" action="${appRoot }/travelog/insert" method="post">
			<div class="form-group">
				<label for="input1">제목</label>
				<input id="input1" class="form-control" name="title">
			</div>
			<div class="form-group">
				<label for="input3">방문도시</label>
				<input id="input3" class="form-control" name="city">
			</div><div class="form-group">
				<label for="input4">이용회사</label>
				<input id="input4" class="form-control" name="company">
			</div>
			<div class="form-group">
				<label for="textarea1">내용</label>
				<textarea rows="8" id="textarea1" class="form-control" name="content"></textarea>
			</div>
			<div class="form-group">
				<label for="input2">작성자</label>
				<input id="input2" hidden value="${pinfo.member.userid }" readonly class="form-control" name="writer">
				<input value="${pinfo.member.username }" class="form-control" readonly>
			</div>
			<input id="submit-btn1" class="btn btn-primary" type="submit" value="글올리기" />
			<button type="reset" class="btn btn-outline-primary"> 다시쓰기 </button> 
			<a style="float:right;" class="btn btn-outline-dark" href="${appRoot }/travelog/list">목록으로 돌아가기</a>
			<br><br>
		</form>
	</div>
</div>
	
</div>
</body>
</html>