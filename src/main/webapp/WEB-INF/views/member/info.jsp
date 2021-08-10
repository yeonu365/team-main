<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="nv" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>hello travelers♡</title>
<script type="text/javascript">
$(function() {
	var oldPasswordModal = $("#old-password-modal");
	var whichButton ="";
	
	// 모달의 확인 버튼 클릭
	$("#old-password-modal-btn").click(function() {
		switch (whichButton) {
		case "modify-button" :
			$("#member-info-form1")
			.attr("action", "${appRoot}/member/modify")
			.submit();
		break;
		case "remove-button" :
			$("#member-info-form1")
			.attr("action", "${appRoot}/member/remove")
			.submit();
		break;
		}
	});
	// (회원) 정보수정 클릭시
	$("#member-info-modify-btn1").click(function(e) {
		e.preventDefault();
		whichButton = "modify-button";
		oldPasswordModal.modal('show');
	});
	// 회원탈퇴 클릭시
	$("#member-info-remove-btn1").click(function() {
		var ans = confirm("탈퇴시 게시글 및 댓글이 모두 삭제 됩니다.");
		whichButton = "remove-button";
		
		if(ans) {
			oldPasswordModal.modal('show');
		}
	});
	// 패스워드 확인
	$("#member-input2, #member-input4").keyup(function() {
		var pw1 = $("#member-input2").val();
		var pw2 = $("#member-input4").val();
		var modifyBtn = $("#member-info-modify-btn1");
		
		if(pw1 != pw2) {
			modifyBtn.attr("disabled", "disabled");
			$("#member-info-password-message").text("패스워드가 일치하지 않습니다.");
		} else {
			if (pw1 == "") {
				modifyBtn.attr("disabled", "disabled");
				$("#member-info-password-message").text("패스워드를 입력해주세요.");
			} else {
				modifyBtn.removeAttr("disabled");
				$("#member-info-password-message").empty();
			}
		}
	});
	
});

</script>

</head>
<body>
<nv:navbar></nv:navbar>
<div class="container">
	<c:if test="${param.status == 'success' }">
		<div id="alert1" class="alert alert-primary" role="alert">회원 정보를 수정하였습니다.</div>
	</c:if>
		<c:if test="${param.status == 'error' }">
		<div id="alert1" class="alert alert-danger" role="alert">회원 정보를 수정할 수 없습니다.</div>
	</c:if>
	
	<h1> 회원 정보 </h1>
	<div class="row">
		<div class="col-12">
			<form id="member-info-form1" action="${appRoot }/member/modify" method="post">
				<div class="form-group">
					<label for="signup-input1">아이디</label>
					<input readonly value="${member.userid }" type="text" class="form-control" id="signup-input1" name="userid">
				</div>
				<div class="form-group">
					<label for="member-input2">패스워드</label>
					<input type="password" class="form-control" id="member-input2" name="userpw">
				</div>
				<div class="form-group">
					<label for="member-input4">새 패스워드 확인</label>
					<input type="password" class="form-control" id="member-input4">
					<small id="member-info-password-message" class="form-text text-danger"></small>
				</div>				
				
				<div class="form-group">
					<label for="signup-input3">필명(활동명)</label>
					<input value="${member.username }" type="text" class="form-control" id="signup-input3" name="username">
				</div>
				<button disabled="disabled" type="submit" class="btn btn-primary" id="member-info-modify-btn1">정보 수정</button>
				<button type="button" class="btn btn-danger" id="member-info-remove-btn1">회원 탈퇴</button>
			</form>
		</div>
	</div>
</div>
<%-- 기존 패스워드 입력 모달 --%>
<div class="modal fade" id="old-password-modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" >기존 패스워드 입력</h5>
        <button type="button" class="close" data-dismiss="modal">
          <span>&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="form-group">
            <label for="old-password-input">기존 패스워드</label>
            <input form="member-info-form1" name="oldPassword" type="password" class="form-control" id="old-password-input">
          </div>
          </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" id="old-password-modal-btn" class="btn btn-danger">확인</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>