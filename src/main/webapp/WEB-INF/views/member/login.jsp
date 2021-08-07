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
	<div class="row justify-content-center">
	<div class="col-md-12 col-6">
		<h1>로그인</h1>
		<form action="${appRoot }/login" method="post">
			<div class="form-group">
				<label for="input1">아이디</label>
				<input id="input1" class="form-control" name="userid" />
			</div>
			<div class="form-group">
				<input id="input2" class="form-control" name="password" type="password" />
			</div>
			<input type="submit" value="로그인" class="btn btn-primary">
		</form>
	</div>
	</div>
</div>
</body>
</html>