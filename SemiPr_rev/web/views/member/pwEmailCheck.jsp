<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.semi.member.controller.EmailAuthentication" %>
	
<!DOCTYPE html>
<html>
<head>
<title>이메일 인증</title>
<script src="<%=request.getContextPath()%>/Resource/js/jquery-3.6.0.min.js"></script>
<%
String email=request.getParameter("email");
EmailAuthentication emailAuth = new EmailAuthentication();
String authNum=emailAuth.connectEmail(email);
System.out.println(authNum);
%>

</head>
<body>

<form method="post" action="<%=request.getContextPath()%>/member/findPwEnd" name="emailcheck">
	<table>
		<tr>
			<th colspan="2">인증번호를 입력하세요.</th>
		</tr>
		<tr>
			<td>
				<input type="text" name="emailconfirm">
			</td>
			<td>
				<input type="button" value="확인"  id="submit-btn"
                 onclick="return confirmemail(emailcheck.emailconfirm.value,
                                                               '<%=authNum%>')">
			</td>
		</tr>
	</table>
</form>

<script>
function confirmemail(emailconfirm, authNum ){
    // 입력한 값이 없거나, 인증코드가 일치 x
    console.log(authNum);
	if(emailconfirm != authNum ){
		alert("인증 실패하였습니다.");
		emailconfirm.value="";
		return false;
		opener.document.getElementById("forgot_email2").value="false";
    // 인증코드가 일치하는 경우
	}else if(emailconfirm==authNum ){
		alert("인증에 성공하셨습니다.");
		emailconfirm.value="";
		history.back();
		return true;
		
	}
}


</script>

</body>
</html>