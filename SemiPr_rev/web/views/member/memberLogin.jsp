<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberLogin.css">


<div class="logo"></div>

<section class="login">
	<h2>로그인</h2>
	<form action="" method="POST">
		<ul class="login_page">
			<li><input type="text" name="userId" id="userId"
				placeholder="아이디" title="아이디입력"></li>
			<li><input type="password" name="password" id="password"
				placeholder="비밀번호" title="비밀번호입력"></li>
			<li><input type="checkbox" name="saveId" id="saveId"><label
				for="saveId">아이디저장</label></li>
			<li><input type="submit" id="login_btn" value="로그인"></li>

		</ul>
	</form>
	<div id="sign_page">
		<a href="<%=request.getContextPath()%>/views/member/memberSignup.jsp">회원가입 | </a> <a href="<%=request.getContextPath()%>/views/member/memberForgot.jsp">아이디 찾기 | 비밀번호 찾기 </a>
			
	</div>

</section>


<%@ include file="/../views/common/footer.jsp"%>