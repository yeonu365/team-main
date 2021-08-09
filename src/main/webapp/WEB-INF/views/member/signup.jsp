<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>hello travelers♡</title>
</head>
<body>
<bd:navbar></bd:navbar>
<div class="container">
<h1>회원가입</h1>
	<div class="row">
		<div class="col-12>">
			<form action="${appRoot }/member/signup" method="post">
			<div class="form-group">
				<label for="signup-input1">아이디</label>
				<input type="text" class="form-control" id="signup-input1" name="userid">
			</div>
			<div class="form-group">
				<label for="signup-input2">패스워드</label>
				<input type="text" class="form-control" id="signup-input2" name="userpw">
			</div>
			<div class="form-group">
				<label for="signup-input3">필명(게시판 노출)</label>
				<input type="text" class="form-control" id="signup-input3" name="userName">
			</div>
			<button type="submit" class="btn btn-primary" id="signup-btn1">회원 가입</button>
			</form>
		</div>
	</div>
	
</div>
</body>
</html>