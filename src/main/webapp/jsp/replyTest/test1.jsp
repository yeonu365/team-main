<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
<script type="text/javascript">
$(function() {
	var data = {
			bno : 162,
			reply: "새로운 댓글",
			replyer: "living39"
	}
	$("#btn1").click(function() {
		$.post({
			url: "${appRoot}/replies/new",
			data: JSON.stringify(data),
			contentType: "application/json",
			success: function(data) {
				console.log(data);
			},
			error: function(data) {
				console.log("등록 실패");
			}
		})
	})
})
</script>
<button id="btn1">TEST CREATE</button>
</div>
<div>
<script>
$(function(){
	$("#btn3").click(function() {
		var bno = 162;
		$.get({
			url: "${appRoot}/replies/pages/" + bno,
			success: function(data) {
				console.log(data);
			}
		})
	})
})
</script>	
<button id="btn3">List Test</button>
</div>
<div>
<script>
$(function(){
	$("#btn4").click(function() {
		var rno = 3;
		$.get({
			url: "${appRoot}/replies/" + rno,
			success: function(data) {
				console.log(data);
			}
		})
	})
})
</script>	
<button id="btn4">READ() Test</button>
</div>
<div>
<script>
$(function(){
	$("#btn5").click(function() {
		var rno = 6;
		$.ajax({
			type:"delete",
			url: "${appRoot}/replies/" + rno,
			success: function() {
				console.log("delete success");
			},
			error: function() {
				console.log("delete fail");
			}
		})
	})
})
</script>	
<button id="btn5">DELETE() Test</button>
</div>
<div>
<script>
$(function(){
	$("#btn6").click(function() {
		var rno = 8;
		var data = {
				rno : rno,
				bno: 162,
				reply: "수정된 댓글",
				replyer: "user39"
		};
		$.ajax({
			type:"put",
			url: "${appRoot}/replies/" + rno,
			data: JSON.stringify(data),
			contentType: "application/json",
			success: function() {
				console.log("update success");
			},
			error: function() {
				console.log("update fail");
			}
		})
	})
})
</script>	
<button id="btn6">UPDATE() Test</button>
</div>
<div>
<script>
$(function(){
	$("#btn7").click(function() {
		var rno = $("#input1").val();
		var bno = $("#input2").val();
		var reply = $("#input3").val();
		var replyer = $("#input4").val();
		var data = {
				rno : rno,
				bno : bno,
				reply : reply,
				replyer : replyer
		};
		$.ajax({
			type:"put",
			url: "${appRoot}/replies/" + rno,
			data: JSON.stringify(data),
			contentType: "application/json",
			success: function() {
				console.log("update success");
			},
			error: function() {
				console.log("update fail");
			}
		})
	})
})
</script>	
<input id="input1" name="rno" value="7" readonly><br>
<input id="input2" name="bno" value="162" readonly><br>
<input id="input3" name="reply" placeholder="댓글 입력 input"><br>
<input id="input4" name="replyer" placeholder="user input" ><br>
<button id="btn7">UPDATE() Test using INPUT</button>
</div>


</body>
</html>