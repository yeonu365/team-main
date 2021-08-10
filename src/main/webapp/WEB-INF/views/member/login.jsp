<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nv" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>hello travelers♡</title>
</head>
<body>
<nv:navbar></nv:navbar>
<div class="container">
	<div class="row justify-content-center">
	<div class="col-md-12 col-6">
		<h1>로그인</h1>
		<form action="${appRoot }/login" method="post">
			<div class="form-group">
				<label for="input1">아이디</label>
				<input id="input1" class="form-control" name="username" />
			</div>
			<div class="form-group">
				<label for="input2">비밀번호</label>
				<input id="input2" class="form-control" name="password" type="password" />
			</div>
			<input type="submit" value="로그인" class="btn btn-primary">
		</form>
	</div>
	</div>
	<div class="form-group form-check">
		<input name="remember-me" type="checkbox" class="form-check-input" id="checkbox1">
		<label for="checkbox1" class="form-check-label">remember me</label>
	</div>
</div>
</body>
</html>