<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>hello travelers!</title>
</head>
<body>
<div class="container">
	<h1>글 목록</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>방문도시</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>이용한곳</th>
				
				
			</tr>	
		</thead>		
	
	</table>
</div>
</body>
</html>