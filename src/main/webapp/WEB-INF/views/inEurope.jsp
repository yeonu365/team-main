<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>hello travelers♡</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<style>

body {
	background-image: url("${appRoot}/resources/images/topCloud2.jpg");
	background-size: 100%;
	font-family: 'Nanum Brush Script', cursive;
}
.tom {
	color: white;
	position: absolute; left: 50%; top: 58%;
	transform: translate(-50%, -50%); text-align: center;
	font-size: 28px;
}
h1 {
	text-shadow: 5px 5px 5px black;
	font-size: 78px;
}
#mark {
	font-size: 1.2em;
	font-weight: bold;
}
h1:hover {color: darkblue;
}

a:link {
	text-decoration: none;
	color: white;
}
a:visited {
	color: white;
}
a:hover {
	color: hotpink;
}

</style>

</head>
<body>

<div class="tom">

	<h1>그 때, 그 곳, 그 여행..</h1><br>
	
	<div id="mark">

<span id="signup"><a href="${appRoot }/member/signup">free티켓팅(회원가입)</a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="login"><a href="${appRoot }/member/login">출발(로그인)</a></span>
	</div>
</div>
	
</body>
</html>