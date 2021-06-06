<%@page import="com.semi.member.model.vo.MemberMenuList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	MemberMenuList mml =(MemberMenuList)request.getAttribute("menu");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="excUpdate-container">
   			
	                    <form action="<%=request.getContextPath() %>/member/mymenulistupdateEnd" method="post">
	                    <input type="hidden" name="no" value="<%=mml.getMenuNo()%>">
                        <select name="week">
                            <option value="월" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("월")?"selected":"" %>>월</option>
                            <option value="화" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("화")?"selected":"" %>>화</option>
                            <option value="수" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("수")?"selected":"" %>>수</option>
                            <option value="목" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("목")?"selected":"" %>>목</option>
                            <option value="금" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("금")?"selected":"" %>>금</option>
                            <option value="토" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("토")?"selected":"" %>>토</option>
                            <option value="일" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("일")?"selected":"" %>>일</option>
                        </select><br>
                        <select name="daytime">
				<option value="아침" <%=mml.getMenuDaytime()!=null&&mml.getMenuDaytime().equals("아침")?"selected":"" %>>아침</option>
				<option value="점심" <%=mml.getMenuDaytime()!=null&&mml.getMenuDaytime().equals("점심")?"selected":"" %>>점심</option>
				<option value="저녁" <%=mml.getMenuDaytime()!=null&&mml.getMenuDaytime().equals("저녁")?"selected":"" %>>저녁</option>
						</select>
						<br>
                     <span> 양:</span>   <input type="number" name="amount" placeholder="양" value="<%=mml.getAmount()%>"><br>
       
                        <input type="submit" onclick="fn_close();" value="수정하기">
                    </form>
</div>
</body>
</html>