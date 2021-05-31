<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/../views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberForgot.css">
<section class="forgot">
	<div class="email">
		<h2>아이디찾기</h2>
		<legend>본인확인 이메일로 인증</legend>
		<p style="line-height: 0.1">&emsp;&emsp;&emsp;본인확인 이메일 주소와 입력한 이메일
			주소가 같아야, 인증번호를 받을 수 있습니다.</p>
		<ul class="list">
			<li><label for="emailNm" class="label_txt">이름 : </label><input
				type="text" name="forgot_name" id="forgot_name" title="이름"></li>
			<li><label for="emailNm" class="label_txt">이메일 주소 :</label><input
				type="text" name="forgot_email" id="forgot_email" title="이메일주소">
				<button type="button" id="forgot_btn" value="">인증번호 받기</button></li>
		</ul>
	</div>
	<span class="forgot_btn"> <input type="submit" class=""
		value="확인" title="확인">

	</span> <span class="forgot_btn2"> <input type="button" class=""
		value="취소" title="취소">
	</span> <br>
	<hr>
	<br>
	<div class="question">
		<h2>비밀번호찾기</h2>
		<legend>회원정보에 등록한 질문 답변 인증</legend>
		<p style="line-height: 0.1">&emsp;&emsp;&emsp;회원정보에 등록한 질문에 대한 답변을
			적어주세요.</p>

		<ul class="list">
			<li><label for="emailNm" class="label_txt">이름 :</label> <input
				type="text" name="forgot_name" id="forgot_name" title="이름">
			</li>
			<li><label for="emailNm" class="label_txt">질문 : </label><input
				type="text" name="forgot_name" id="forgot_name" title="질문"></li>
			<li><label for="emailNm" class="label_txt">답변 : </label><input
				type="text" name="forgot_email" id="forgot_email" title="답변">

			</li>
		</ul>
	</div>
	<span class="forgot_btn"> <input type="submit" class=""
		value="확인" title="확인">

	</span> <span class="forgot_btn2"> <input type="button" class=""
		value="취소" title="취소">
	</span>


</section>

<%@ include file = "/../views/common/footer.jsp"%>