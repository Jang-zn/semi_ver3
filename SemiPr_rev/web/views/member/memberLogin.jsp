<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.semi.member.model.vo.Member" %>
	<%
	
	Member m = (Member)request.getAttribute("logged");
	
	Cookie[] cookies= request.getCookies();
	String saveId="";
	if(cookies!=null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
			}
		}
	}
	%>
<%@ include file="/../views/common/header.jsp"%>
<%-- <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberLogin.css">
 --%>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/02memberLogin.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/font.css">

<div class="logo row"></div>
<div class="col-md-4"></div>
<div class="login col-md-4">

	<div class="row">
		<h2>로그인</h2>
	</div>

	<div class="row">
		<form action="<%=request.getContextPath()%>/member/memberLogin" method="post">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<input type="text" name="userId" id="userId" placeholder=" 아이디"
						title="아이디입력" value="<%=saveId==null?"":saveId%>">
				</div>
				<div class="col-md-1"></div>
			</div><br>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<input type="password" name="password" id="password"
						placeholder=" 비밀번호" title="비밀번호입력">
				</div>
				<div class="col-md-1"></div>
			</div><br>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<input type="checkbox" name="saveId" id="saveId" <%=saveId!=null? "checked" : ""%>>
					<label for="saveId" style="font-family: 'GongGothicLight';">아이디 저장</label>
						
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
		<div class="col-md-4 signup">
			<a href="<%=request.getContextPath()%>/member/signup">회원가입</a>
		</div>
		<div class="col-md-8 signup">
			<a href="<%=request.getContextPath()%>/member/find">아이디 찾기 / 비밀번호 찾기</a>
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