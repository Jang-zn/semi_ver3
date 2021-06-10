<%@page import="com.semi.member.model.vo.MemberMenuList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	MemberMenuList mml =(MemberMenuList)request.getAttribute("menu");
    %>
<!DOCTYPE html>
<html>
<head>
 <script src="<%=request.getContextPath()%>/Resource/js/jquery-3.6.0.min.js"></script>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/02memberMyList.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="excUpdate-container">
   			
	                    <form action="<%=request.getContextPath() %>/member/mymenulistupdateEnd" method="post">
	                    <input type="hidden" name="no" value="<%=mml.getMenuNo()%>">
	                    <span class="title01">요일 : </span>
                        <select name="week" class="updateList">
                            <option value="월" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("월")?"selected":"" %>>월</option>
                            <option value="화" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("화")?"selected":"" %>>화</option>
                            <option value="수" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("수")?"selected":"" %>>수</option>
                            <option value="목" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("목")?"selected":"" %>>목</option>
                            <option value="금" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("금")?"selected":"" %>>금</option>
                            <option value="토" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("토")?"selected":"" %>>토</option>
                            <option value="일" <%=mml.getMenuWeek()!=null&&mml.getMenuWeek().equals("일")?"selected":"" %>>일</option>
                        </select><br>
                        <span class="title01">언제 : </span>
                        <select name="daytime" class="updateList">
				<option value="아침" <%=mml.getMenuDaytime()!=null&&mml.getMenuDaytime().equals("아침")?"selected":"" %>>아침</option>
				<option value="점심" <%=mml.getMenuDaytime()!=null&&mml.getMenuDaytime().equals("점심")?"selected":"" %>>점심</option>
				<option value="저녁" <%=mml.getMenuDaytime()!=null&&mml.getMenuDaytime().equals("저녁")?"selected":"" %>>저녁</option>
						</select>
						<br>
                     <span class="title01">양 : </span>   <input type="number" name="amount" placeholder="양" value="<%=mml.getAmount()%>" class="updateList"><br>
       
                        <input type="submit" onsubmit="return fn_close();" value="수정하기" class="btn01" style="font-size:1.3rem;margin-top:0.5rem;">
                    </form>
</div>
<script type="text/javascript">
$("input[type=number]").change(e=>{
	if($(e.target).val()<0){
		alert("음수x");
		$(e.target).val("0");
	}
})
const fn_close=()=>{
	if($("input[type=number]").val()<0){
		alert("음수x")
		return false;
	}else{
		return true;
	}
}
</script>
</body>
</html>