<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nv" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>
<title>hello travelers♡</title>
<style>
#alert1 {
	width: 380px;
	margin: auto;
	padding: 50px 20px;
	text-align: center;
}
</style>

<script type="text/javascript">
var appRoot = "${appRoot}";
var travelogBno = "${travelog.bno}";
var userid = "${pinfo.member.userid}";
</script>

<script src="${appRoot }/resources/js/read.js"></script>


<script>
$(document).ready(function() {
	var removeUrl = "${appRoot}/travelog/delete";
	$("#board-delete-btn1").click(function() {
		if (confirm("정말 삭제 하시겠습니까?")) {
			$("#for-delete").attr("action", removeUrl);
			$("#for-delete").submit();
		}
	});
	});
</script>

</head>
<body>
<nv:navbar></nv:navbar>
<div class="row">
	<div class="col-12">
<div id="alert1" class="alert alert-info fade" role="alert"></div>
</div>
</div>
<div class="container">
<h1>글보기</h1>
<div class="row">
	<div class="col-12">
		<form id="for-delete" action="" method="post">
		<input hidden name="bno" value="${travelog.bno }">
			<div class="form-group">
				<label for="input1">제목</label>
				<input readonly id="input1" class="form-control" name="title" value="${travelog.title}">
			</div>
			<div class="form-group">
				<label for="input3">방문도시</label>
				<input readonly id="input3" class="form-control" name="city" value="${travelog.city}">
			</div><div class="form-group">
				<label for="input4">이용회사</label>
				<input readonly id="input4" class="form-control" name="company" value="${travelog.company}">
			</div>
			<div class="form-group">
				<label for="textarea1">내용</label>
				<textarea readonly id="textarea1" class="form-control" name="content"><c:out value="${travelog.content }"/></textarea>
			</div>
			<div class="form-group">
				<label for="input2">작성자</label>
				<input type="hidden" readonly id="input2" class="form-control" name="writer" value="${travelog.writer}">
				<input readonly="readonly" class="form-control" value="${travelog.writerName}">
			</div>
			
			<c:url value="/travelog/list" var="listUrl">
			<c:param name="bno" value="${travelog.bno }"></c:param>
				<c:param name="pageNum" value="${cri.pageNum }"></c:param>
				<c:param name="amount" value="${cri.amount }"></c:param>
				<c:param name="type" value="${cri.type }"></c:param>
				<c:param name="keyword" value="${cri.keyword }"></c:param>
			</c:url>
<!-- 			
		<input type="hidden" name="pageNum" value="${cri.pageNum }">
    	<input type="hidden" name="amount" value="${cri.amount }">
 -->
 	
		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#reply-insert-modal">댓글 작성</button>
		<c:if test="${pinfo.member.userid eq travelog.writer }">
			<input style="float:right; margin-left:8px;" id="board-delete-btn1" class="btn btn-danger" type="button" value="게시글삭제"/>   
		</c:if>
			<a style="float:right;" class="btn btn-dark" href="${listUrl }">목록으로 돌아가기</a>
		</form>
		
	</div>
</div>	
	
</div>
<div class="container">
	<div class="row">
		<div class="col-12">
			<ul class="list-unstyped" id="reply-list-container"></ul>
		</div>
	</div>
</div>
<%-- 댓글 입력 모달 --%>
<div class="modal fade" id="reply-insert-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">댓글 쓰기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
       	<input type="text" value="${travelog.bno }" readonly="readonly" id="reply-bno-input1" hidden>
          <div class="form-group">
            <label for="message-text" class="col-form-label">댓글</label>
            <textarea class="form-control" id="reply-reply-textarea1"></textarea>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">작성자</label>
            <input type="text" readonly value="${pinfo.member.username }" class="form-control">
            <input type="hidden" value="${pinfo.member.userid }" class="form-control" id="reply-replyer-input1">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-info" id="reply-insert-btn1">작성 완료</button>
      </div>
    </div>
  </div>
</div>
<%-- 댓글 수정/삭제 --%>
<div class="modal fade" id="reply-modify-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">댓글 수정/삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
        <input type="text" value="" readonly="readonly" id="reply-rno-input2" hidden>
       	<input type="text" value="${travelog.bno }" readonly="readonly" id="reply-bno-input2" hidden>
          <div class="form-group">
            <label for="message-text" class="col-form-label">댓글</label>
            <textarea class="form-control" id="reply-reply-textarea2"></textarea>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">작성자</label>
            <input type="hidden" class="form-control" id="reply-replyer-input2" readonly>
            <input type="text" class="form-control" id="reply-replyerName-input2" readonly>
          </div>
        </form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
      <span id="reply-modify-delete-btn-wrapper">
        <button type="button" class="btn btn-info" id="reply-modify-btn1">댓글 수정</button>
        <button type="button" class="btn btn-danger" id="reply-delete-btn1">댓글 삭제</button>
      </span>
      </div>
    </div>
  </div>
</div>

</body>
</html>