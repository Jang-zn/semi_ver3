<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	boolean result = (boolean)request.getAttribute("result");
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForMuscle : 아이디 중복확인</title>
</head>
<body>
<div>
	<%if(result){ %>
	[<span><%=request.getParameter("userId") %></span>]는 사용가능한 아이디입니다.
	<br><br><br>
	<button type="button" onclick="fn_close();">닫기</button>
	
	<%}else{ %>
		[<span id="duplicated"><%=request.getParameter("userId") %></span>]는 사용중인 아이디입니다.
		<br><br>
		
		<form action="<%=request.getContextPath() %>/checkDuplciateId" method="post">
			<input type="text" name="userId" id="userId">
			<input type="submit" value="중복검사">
		</form>
<%} %>
</div>

</body>
<script>
	const fn_close=()=>{
		opener.document.getElementById("userId_").value='<%=request.getParameter("userId")%>';
		opener.document.getElementById("pswd1").focus();
		window.close();
	}
</script>
</html>