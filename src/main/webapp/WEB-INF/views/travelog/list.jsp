<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="nv" tagdir="/WEB-INF/tags" %>

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
	background-color: MintCream;
	font-family: 'Nanum Brush Script', cursive;
	font-size: 1.5em;
}

a:link {
	text-decoration: none;
	color:black;
}
a:visited {
	color:black;
}
a:hover {
	color:hotpink;
}
</style>
<script>
$(document).ready(function() {
	$("#list-pagenation1 a").click(function(e) {
		e.preventDefault();
		console.log("a clicked");
		
		var actionForm = $("#actionForm");
		actionForm.find("[name=pageNum]").val($(this).attr("href"));
		actionForm.submit();
	});
});
</script>

</head>
<body>
<nv:navbar></nv:navbar>
<div class="container">
<br><br><br><br>
 	<h1 style="text-align:center;">여행 기억,,</h1><br>

	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">방문도시</th>
				<th scope="col">이용회사</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>		
		<tbody>
			<c:forEach items="${list }" var="travelog">
			<tr>
				<td>${travelog.bno }</td>
					<c:url value="/travelog/read" var="readUrl">
						<c:param name="bno" value="${travelog.bno }"></c:param>
						<c:param name="pageNum" value="${cri.pageNum }"></c:param>
						<c:param name="amount" value="${cri.amount }"></c:param>
						<c:param name="type" value="${cri.type }"></c:param>
						<c:param name="keyword" value="${cri.keyword }"></c:param>
					</c:url>
				
				<td class="ellipsis"><a href="${readUrl }" target="_blank">${travelog.title }
					<c:if test="${travelog.replyCnt > 0 }">[${travelog.replyCnt }]</c:if>
				</a></td>
				
				<td class="ellipsis">${travelog.city }</td>
				<td class="ellipsis">${travelog.company }</td>
				<td class="ellipsis">${travelog.writerName }</td>
				<td class="ellipsis">
					<fmt:formatDate pattern="yyyy-MM-dd" value="${travelog.regdate }" />
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
</div>
<!--  pagenation -->
<nav aria-label="Page navigation example">
  <ul id="list-pagenation1" class="pagination justify-content-center">
	<c:if test="${pageMaker.prev }">
	  <li class="page-item">
	  <a class="page-link" href="${pageMaker.startPage -1}">Previous</a></li>
	</c:if>
	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
    	<li class="page-item ${num == cri.pageNum ? 'active' : '' }"><a class="page-link" href="${num }">${num }</a></li>
	</c:forEach>  
	<c:if test="${pageMaker.next }">
	  <li class="page-item"><a class="page-link" href="${pageMaker.endPage +1 }">Next</a></li>
	</c:if>
  </ul>
</nav>
<%-- page link 용 form --%>
<div style="display:none;">
	<form id="actionForm" action="${appRoot }/travelog/list" method="get">
		<input name="pageNum" value="${cri.pageNum }" />
		<input name="amount" value="${cri.amount }" />
		<input name="type" value="${cri.type }" />
		<input name="keyword" value="${cri.keyword }" />
	</form>
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
		<%-- Travelog Controller의 insertSelectKey() 수정
		<p>${list.writerName } 님의 여행기가 등록 되었습니다.</p>
		--%>
    	<p>${pinfo.member.username } 님의 여행기가 등록 되었습니다.</p>
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
