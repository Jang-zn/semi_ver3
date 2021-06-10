<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   body { 
    	background-image: url('<%=request.getContextPath() %>/Resource/img/400.png');
    	background-repeat: no-repeat;  
    	}
   #back{
   		margin:250px 0 0 200px;
   		padding:10px 15px;
   		border-radius:10px;
   		background-color: black;
   		color :white;
   } 	
</style>
</head>
<body>
<button id="back">뒤로 가기</button>
<script>
	  document.getElementById('back').addEventListener('click', () => {
	  window.history.back();
	});
</script>

</body>
</html>