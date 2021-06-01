<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberLogin.css">


<div class="logo row"></div>
<div class="col-md-4"></div>
<div class="login col-md-4">


	<div class="row">
		<h2>로그인</h2>
	</div>

	<div class="row">
		<form action="" method="POST">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<input type="text" name="userId" id="userId" placeholder="아이디"
						title="아이디입력">
				</div>
				<div class="col-md-1"></div>
			</div><br>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<input type="password" name="password" id="password"
						placeholder="비밀번호" title="비밀번호입력">
				</div>
				<div class="col-md-1"></div>
			</div><br>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<input type="checkbox" name="saveId" id="saveId"><label
						for="saveId">아이디저장</label>
				</div><br>
				<div class="col-md-1"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<input type="submit" id="login_btn" value="로그인">
				</div>
				<div class="col-md-1"></div>
			</div><br>

		</form>
	</div>

	<div id="sign_page row">
		<div class="col-md-4">
			<a href="<%=request.getContextPath()%>/views/member/memberSignup.jsp">회원가입</a>
		</div>
		<div class="col-md-4">
			<a href="">아이디 찾기</a>
		</div>
		<div class="col-md-4">
			<a href="">비밀번호찾기</a>
		</div>
	</div>
	<br>
	<div class="row">
<!-- 				<div id="sns_page">
			<br><div class="row">
				<a href="">구글로그인</a>
			</div><br>
			<div class="row">
				<a href="">네이버로그인</a>
			</div><br>
			<div class="row">
				<a href="">카카오로그인</a>
			</div>
		</div> -->
	</div>

</div>
<div class="col-md-4"></div>

<%@ include file="/../views/common/footer.jsp"%>