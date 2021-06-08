<%@page import="com.semi.member.model.vo.MemberExcList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	MemberExcList mel =(MemberExcList)request.getAttribute("exc");
    	
    %>
<!DOCTYPE html>
<html>
<head>
               <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>업데이트 창</title>
        <script src="<%=request.getContextPath()%>/Resource/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> </h2>
<div id="excUpdate-container">
   			
	                    <form action="<%=request.getContextPath() %>/member/myexclistupdateEnd" method="post">
	                    <input type="hidden" name="no" value="<%=mel.getExcNo()%>">
                       	<span>요일 : </span> <select name="week">
                            <option value="월" <%=mel.getExcWeek()!=null&&mel.getExcWeek().equals("월")?"selected":"" %>>월</option>
                            <option value="화" <%=mel.getExcWeek()!=null&&mel.getExcWeek().equals("화")?"selected":"" %>>화</option>
                            <option value="수" <%=mel.getExcWeek()!=null&&mel.getExcWeek().equals("수")?"selected":"" %>>수</option>
                            <option value="목" <%=mel.getExcWeek()!=null&&mel.getExcWeek().equals("목")?"selected":"" %>>목</option>
                            <option value="금" <%=mel.getExcWeek()!=null&&mel.getExcWeek().equals("금")?"selected":"" %>>금</option>
                            <option value="토" <%=mel.getExcWeek()!=null&&mel.getExcWeek().equals("토")?"selected":"" %>>토</option>
                            <option value="일" <%=mel.getExcWeek()!=null&&mel.getExcWeek().equals("일")?"selected":"" %>>일</option>
                        </select><br>
                       	<span>weight : </span> <input type="number" name="weight" placeholder="kg" value="<%=mel.getWeight()%>"><br>
                       	<span>reps : </span> <input type="number" name="reps" placeholder="횟수" value="<%=mel.getReps()%>"><br>
                        <span>sets : </span><input type="number" name="sets" placeholder="세트수" value="<%=mel.getSets()%>"><br>
                        <input type="submit" onsubmit="return fn_close();" value="수정하기">
                    </form>
</div>
</body>
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
</html>
