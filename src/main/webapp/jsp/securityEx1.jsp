<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="pinfo"/>
		${pinfo.member.userid }<br>
		${pinfo.member.userpw }<br>
		${pinfo.member.username }<br>
	</sec:authorize>
	<sec:authorize access="!isAuthenticated()">
		<sec:authentication property="principal" var="pinfo"/>
		${pinfo }<br>
	</sec:authorize>	
</div>
</body>
</html>