<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="com.semi.member.model.vo.Member" %>
    <%
    String num = (String)session.getAttribute("AuthenticationKey");
   
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
"<%=request.getContextPath()%>/member/emailAuth"
		</span> <span class="forgot_btn2"> <input type="button" class=""
			value="취소" title="취소">
		</span> <br>
	</form>
	<hr>
	<br>
	<form name="insertform2" method="post">
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
					value="이메일 전송" style="width: 110px; height: 25px" onclick="emailAuthint();" >인증번호 전송</button>
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
	
const emailAuthint=()=>{
	var emailAu = $("#forgot_email2").val();
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/member/emailAuth",
										
								data : {
									"email" : emailAu,
									
								},
								success : function(data) {
									console.log(data)
									
								}
							});
			
				};


	
	
	$("#forgot_email2").blur(function() {
			
					var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					var email = $("#forgot_email2").val()
					var email2 = email.replace(/(\s*)/g, "");
			
					if (!emailReg.test(email)) {
							alert("잘못된 형식의 이메일주소입니다.");
							return;
					}

				})
	
			
	
 	$("#forgot_email2").blur(function(){
		var email =$("#forgot_email2").val();
		var name =$("#forgot_name2").val();
		var id =$("#forgot_id2").val();
	
		$.ajax({
			type : "post",
			url : "<%=request.getContextPath()%>/member/findPwEnd",
											
									data : {
										"email" : email,
										"name" : name,
										"id" : id
									},
									success : function(data) {
										if (data == "fail") {
											alert("가입된 회원이 아닙니다. 확인 후 다시 시도해주세요.");
											$("#email-chk").attr("disabled",true);
										}else{
											alert("가입된 회원정보가 있습니다. 인증번호 인증을 받으세요!");
											$("#email-chk").attr("disabled",false);
										} 
									}
								});
				
					});

	$("#check").click(function() {
		var emailAuth = $("#emailAuth").val();
		$.ajax({
			type:'post',
			url : "<%=request.getContextPath()%>/member/passwordEmailAuth",
			data : {
				"emailAuth" : emailAuth
			},
			success : function(data){
				if(data=="success"){
					alert("이메일 인증에 성공하였습니다.")
				}else{
					alert("이메일 인증에 실패했습니다.")
				}
			}
		});	 

		
	});	
 
</script>

<%@ include file = "/../views/common/footer.jsp"%>