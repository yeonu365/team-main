<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nv" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<title>hello travelers!</title>
<style>
a:link {
	text-decoration: none;
	color:black;
}
a:hover {
	color:hotpink;
	}
</style>
</head>
<body>
<nv:navbar></nv:navbar>
<div class="container">
	<h1>글 목록</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>방문도시</th>
				<th>이용회사</th>
				<th>작성자</th>
				<th>작성일</th>
				
			</tr>
		</thead>		
		<tbody>
			<c:forEach items="${tlist }" var="travelog">
			<tr>
				<td>${travelog.bno }</td>
				<td><a href="${appRoot}/travelog/read?bno=${travelog.bno}">${travelog.title }</a></td>
				<td>${travelog.city }</td>
				<td>${travelog.company }</td>
				<td>${travelog.writer }</td>
				<td>
					<fmt:formatDate pattern="yyyy-MM-dd" value="${travelog.regdate }" />
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- 글쓰고 list 로 redirect 될때 작동하는 modal -->
<c:if test="${not empty result }">
<script>
$(document).ready(function() {
	$("#board-modal1").modal('show');
});
</script>
<div id="board-modal1" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">게시물 등록완료</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<%-- Travelog Controller의 insertSelectKey() 수정--%>
    	<p>${newwriter } 님의 여행기가 등록 되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</c:if>
</body>
</html>