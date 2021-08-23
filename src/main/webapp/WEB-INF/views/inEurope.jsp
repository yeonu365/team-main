<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>hello travelers♡</title>

<style>
body {
	background-image: url("${appRoot}/resources/images/topCloud1.jpg");
	background-size: 100%;
}
.tom {
	color: blue;
	position: absolute; left: 50%; top: 68%;
	transform: translate(-50%, -50%); text-align: center;
	font-family: monospace;
}
#signup, #login {
	text-color: black;
}
a:link {
	text-decoration: none;
}
a: visited {
	color: black;
}
a: hover {
	color: hotpink;
}

</style>

</head>
<body>

<div class="tom">

	<h1>그 때, 그 순간, 그 여행.</h1><br>

<span id="signup"><a href="${appRoot }/member/signup">티켓팅(회원가입)</a></span>
<span id="login"><a href="${appRoot }/member/login">출발(로그인)</a></span>
</div>
	
</body>
</html>