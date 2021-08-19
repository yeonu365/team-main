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
	background-color: Turquoise;
}
.main {
	position: absolute;
	align-items: center;
	justify-content: center;
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
/* 배경화면으로 이미지 넣기?? 폴더를 맞게 넣었나?
 <img src="../images/theFirstDoor.jsp" alt="theFirstDoor">
*/
</style>

</head>
<body>

<div class="main">
그때, 그순간, 하나뿐인 여행.
<span id="signup"><a href="/member/signup">티켓팅(회원가입)</a></span>
<span id="login"><a href="/member/login">출발(로그인)</a></span>
</div>
	
</body>
</html>