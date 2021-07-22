<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nv" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<title>hello travelers!</title>
<script>
$(document).ready(function() {
	var removeUrl = "${appRoot}/travelog/delete"
	$("#board-delete-btn1").click(function() {
		if (confirm("정말 삭제 하시겠습니까?")) {
			$("#for-delete").attr("action", removeUrl);
			$("#for-delete").submit();
		}
	});
	});
</script>
</head>
<body>
<nv:navbar></nv:navbar>
<div class="container">
<h1>글보기</h1>
<div class="row">
	<div class="col-12">
		<form id="for-delete" action="" method="post">
		<input hidden name="bno" value="${travelog.bno }">
			<div class="form-group">
				<label for="input1">제목</label>
				<input readonly id="input1" class="form-control" name="title" value="${travelog.title}">
			</div>
			<div class="form-group">
				<label for="input3">방문도시</label>
				<input readonly id="input3" class="form-control" name="city" value="${travelog.city}">
			</div><div class="form-group">
				<label for="input4">이용회사</label>
				<input readonly id="input4" class="form-control" name="company" value="${travelog.company}">
			</div>
			<div class="form-group">
				<label for="textarea1">내용</label>
				<textarea readonly id="textarea1" class="form-control" name="content"><c:out value="${travelog.content }"/></textarea>
			</div>
			<div class="form-group">
				<label for="input2">작성자</label>
				<input readonly id="input2" class="form-control" name="writer" value="${travelog.writer}">
			</div>
			<a class="btn btn-dark" href="${appRoot }/travelog/list">목록보기</a>
			<input id="board-delete-btn1" class="btn btn-danger" type="button" value="삭제"/>
		</form>
	</div>
</div>	
	
</div>
</body>
</html>