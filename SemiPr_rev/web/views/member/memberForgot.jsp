<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="com.semi.member.model.vo.Member" %>
    <%
    String num = (String)session.getAttribute("Number");
    Member m = (Member)session.getAttribute("m");
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
					type="text" name="forgot_name" id="forgot_name" required></li>
				<li><label for="emailNm" class="label_txt">이메일 :</label><input
					type="text" name="forgot_email" id="forgot_email" required>
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
	<form name="insertform2" action="<%=request.getContextPath()%>/member/findPwEnd"
		method="post">
		<div class="question">
			<h2>비밀번호찾기</h2>
			회원정보에 등록한 이메일 인증

			<ul class="list">
				<li><label for="emailNm" class="label_txt">이름 :</label> <input
					type="text" name="forgot_name2" id="forgot_name2" required>
				</li>
				<li><label for="emailNm" class="label_txt">아이디 : </label><input
					type="text" name="forgot_id2" id="forgot_id2" required></li>
				<li><label for="emailNm" class="label_txt">이메일 :  </label><input
					type="text" name="forgot_email2" id="forgot_email2" required>
					<button type="button" id="email-chk" 
					value="이메일 전송" style="width: 110px; height: 25px" onclick="emailCheck(insertform2.forgot_email2.value, insertform2.forgot_name2.value, insertform2.forgot_id2.value);" >인증번호 전송</button>
				</li>
				 <li><label for="emailNm" class="label_txt">인증번호 :  </label><input
					type="text" name="emailAuth" id="emailAuth"></li>
				<li id="emailBox"></li>
					
					
			</ul>
		</div>
		<span class="forgot_btn"> <input type="submit" class="" 
			value="확인" id="check">

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
							return;
					}
					if (!emailReg.test(email)) {
							alert("잘못된 형식의 이메일주소입니다.");
							return;
					}

				})
	
				
	
 	function emailCheck(forgot_email2, forgot_name2, forgot_id2) {

		var email =$("#forgot_email2").val();
		var name =$("#forgot_name2").val();
		var id =$("#forgot_id2").val();
		
		console.log(emailAuth);
		if (forgot_email2 == "") {
			alert("이메일을 입력 후 눌러주세요.");
			return;
		}else{
		console.log(forgot_email2);
		$.ajax({
			type : "post",
			url : "<%=request.getContextPath()%>/member/findPwEnd?email=" + forgot_email2+"&name="+forgot_name2+"&id="+forgot_id2,
			data : {
				"email":email,
				"name" : name,
				"id" : id
			},
					success : function(data){
					console.log(data)
				
						if(data=="fail"){
							alert("가입된 회원이 아닙니다. 확인 다시 시도해주세요.");
						}else{
							alert("인증번호 발송 완료");
							
						}
					}
			});
	}
}	
	
	
	$("#check").click(function(){
		
		
		var email = $("#emailAuth").val();
		
		if(email = ""){
			alert("인증번호를 입력하세요");
			return;
		}
		
		if(email != <%=num%> ){
				alert("이메일 인증번호가 틀립니다.");
				return;
			}else{
				alert("이메일 인증완료");
			}
	});	
 
</script>

<%@ include file = "/../views/common/footer.jsp"%>