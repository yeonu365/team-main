<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nv" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>hello travelers♡</title>

<style type="text/css">
body {
	background-img: url("/images/topcloud1.jpg");
}

</style>
</head>
<body>
<nv:navbar></nv:navbar>
<div class="container">
<br>
<h3 style="text-align:center;color:skyblue;">${pinfo.member.username }님의 여행기</h3><br>
<div class="row">
	<div class="col-12">
		<form action="${appRoot }/travelog/insert" method="post">
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
				<textarea rows="10" id="textarea1" class="form-control" name="content"></textarea>
			</div>
			<div class="form-group">
				<label for="input2">작성자</label>
				<input id="input2" hidden value="${pinfo.member.userid }" readonly class="form-control" name="writer">
				<input value="${pinfo.member.username }" class="form-control" readonly>
			</div>
			<input class="btn btn-primary" type="submit" value="글올리기" />
		</form>
	</div>
</div>
	
</div>
</body>
</html>