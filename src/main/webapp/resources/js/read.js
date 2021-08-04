/*
 reply 관련 JS 코드
 */


$(function() {
	function showModifyModal(rno) {
		$.ajax({
			type: "get",
			url: appRoot + "/replies/" + rno,
			success: function(reply) {
				$("#reply-rno-input2").val(reply.rno);
				$("#reply-reply-textarea2").text(reply.reply);
				$("#reply-replyer-input2").val(reply.replyer);
				$("#reply-modify-modal").modal("show");
			},
			error: function() {
				console.log("댓글 가져오기 실패");
			}
		})
	}
	
	function showReplyList(list) {
		var container = $("#reply-list-container").empty();
		
		for (var reply of list) {
			var replyHTML = `
                <li class="media" id="reply${reply.rno}" data-rno="${reply.rno}">
                    <div class="media-body">
                        <p>${reply.reply}</p>
                        <h5>${reply.replyer}</h5>
                        <small>${new Date(reply.replyDate).toISOString().split("T")[0]}</small>
                    </div>        
                </li>`;
            var replyComponent = $(replyHTML).click(function() {
                showModifyModal($(this).attr("data-rno"));
            });

			container.append(replyComponent);
		}
	}

	function getReplyList() {
		$.ajax({
			type: "get",
			url: appRoot + "/replies/pages/" + travelogBno,
			success: function(list) {
				console.log(list);
				showReplyList(list);
			},
			error: function() {
				console.log("댓글 가져오는 중 에러.");
			}
		});	
	}
	
	getReplyList();

	/* 댓글 입력 버튼 execute */
	$("#reply-insert-btn1").click(function() {
		var bno = $("#reply-bno-input1").val();
		var reply = $("#reply-reply-textarea1").val();
		var replyer = $("#reply-replyer-input1").val();
		
		var data = {
				bno: bno,
				reply: reply,
				replyer: replyer
		};
		$.ajax({
			type: "post",
			url: appRoot +"/replies/new",
			data: JSON.stringify(data),
			contentType: "application/json",
			success: function() {
				console.log("입력 성공");
				$("#reply-insert-modal").modal("hide");
				getReplyList();
				$("#alert1").text("♡새 댓글을 입력하였습니다.♡").addClass("show");
				//alert("♡새 댓글을 입력하였습니다.♡");
			},
			error: function() {
				console.log("입력 실패");
			}
		});
	});
	
	/* 수정 submit 버튼 execute */
	$("#reply-modify-btn1").click(function() {
		var rno = $("#reply-rno-input2").val();
		var bno = $("#reply-bno-input2").val();
		var reply = $("#reply-reply-textarea2").val();
		var replyer = $("#reply-replyer-input2").val();
		
		var data = {
				rno: rno,
				bno: bno,
				reply: reply,
				replyer: replyer
		};
		$.ajax({
			type: "put",
			url: appRoot +"/replies/" + rno,
			data: JSON.stringify(data),
			contentType: "application/json",
			success: function() {
				console.log("수정 성공");
				$("#reply-modify-modal").modal("hide");
				getReplyList();
				$("#alert1").text("♡댓글을 수정하였습니다.♡").addClass("show");
				//alert("♡댓글을 수정하였습니다.♡");
			},
			error: function() {
				console.log("수정 실패");
			}
			})
		});
		
	/* 삭제 버튼 execute */
	$("#reply-delete-btn1").click(function() {
		var check = confirm("정말 삭제 하시겠습니까?")
		if(check) {
			var rno = $("#reply-rno-input2").val();
/*			
			var bno = $("#reply-bno-input2").val();
			var reply = $("#reply-reply-textarea2").val();
			var replyer = $("#reply-replyer-input2").val();
			
			var data = {
					rno: rno,
					bno: bno,
					reply: reply,
					replyer: replyer
			};
*/
		$.ajax({
			type: "delete",
			url: appRoot +"/replies/" + rno,
			
			success: function() {
				console.log("삭제 성공");
				$("#reply-modify-modal").modal("hide");
				getReplyList();
				$("#alert1").text("♡댓글을 삭제하였습니다.♡").addClass("show");
				//alert("♡댓글을 삭제하였습니다.♡");
			},
			error: function() {
				console.log("삭제 실패");
			}
		})
		}
	})
})
