<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.semi.member.model.vo.Member" %>
    <%
    Member m = (Member)request.getAttribute("id");
    %>
    
    
<%@ include file = "/../views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberForgot.css">
<section class="forgot">
	<form action="<%=request.getContextPath()%>/member/findId"  name="insertform"
		method="post">
		<div class="email">
			<h2>아이디찾기</h2>
			본인확인 이메일로 인증
			<p style="line-height: 0.1">&emsp;&emsp;&emsp;</p>
			<ul class="list">
				<li><label for="emailNm" class="label_txt">이름 : </label><input
					type="text" name="forgot_name" id="forgot_name" title="이름"></li>
				<li><label for="emailNm" class="label_txt">이메일 :</label><input
					type="text" name="forgot_email" id="forgot_email" title="이메일주소">
			</ul>
		</div>
		<span class="forgot_btn"> <input type="submit" class=""
			value="확인" title="확인" >

		</span> <span class="forgot_btn2"> <input type="button" class=""
			value="취소" title="취소">
		</span> <br>
	</form>
	<hr>
	<br>
	<form name="insertform2" action="<%=request.getContextPath()%>/member/findPw"
		method="post">
		<div class="question">
			<h2>비밀번호찾기</h2>
			회원정보에 등록한 이메일 인증

			<ul class="list">
				<li><label for="emailNm" class="label_txt">이름 :</label> <input
					type="text" name="forgot_name" id="forgot_name" title="이름">
				</li>
				<li><label for="emailNm" class="label_txt">아이디 : </label><input
					type="text" name="forgot_name" id="forgot_name" title="질문"></li>
				<li><label for="emailNm" class="label_txt">이메일 :  </label><input
					type="text" name="forgot_email" id="forgot_email2" title="답변">
					
					<button type="button" id="email-chk" 
					value="이메일 인증" style="width: 100px; height: 25px" onclick="emailCheck(insertform2.forgot_email2.value);" >이메일 인증</button>
				</li>
			</ul>
		</div>
		<span class="forgot_btn"> <input type="submit" class=""
			value="확인" title="확인">

		</span> <span class="forgot_btn2"> <input type="button" class=""
			value="취소" title="취소">
		
		</span>
	</form>
</section>


<script>
	$("#forgot_email2").blur(function() {
			
					var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					var email = $("#forgot_email2").val()
					var email2 = email.replace(/(\s*)/g, "");
					if (email != email2) {
							alert("공백없이 입력해주세요");
					}
					if (!emailReg.test(email)) {
							alert("잘못된 형식의 이메일주소입니다.");
					}

				})
	$("#forgot_email2").click(function() {
		var emailChk = $("#forgot_email2").val();
		if (emailChk == "") {
			alert("이메일을 입력 후 눌러주세요.");

			return;
		}
	});

	function emailCheck(forgot_email2) {
		if (forgot_email2 == "") {
			alert("이메일을 입력 후 눌러주세요.");
			return;
		}
		console.log(email);
		let url = "findPw.jsp?email=" + forgot_email2;
		
		open(url, "emailwindow",
				"statusbar=no, scrollbar=no, menubar=no, width=400, height=200");
		
	}
</script>

<%@ include file = "/../views/common/footer.jsp"%>