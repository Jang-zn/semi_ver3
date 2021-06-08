<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="com.semi.member.model.vo.Member" %>
    <%
    Member m = (Member)request.getAttribute("pw");
    %>
<%@ include file="/../views/common/header.jsp"%>

  <%if(m==null) {%>
  <div id="">
  	<%=request.getAttribute("msg") %>
  	<div class="">
			<a href="<%=request.getContextPath()%>/member/signup">회원가입</a>
		</div>
	</div>
  <%}else{ %>
  <p><%=m.getMemberId()%>님의 비밀번호는 <%=m.getMemberPw() %> 입니다.</p>
  
  <%} %>
<%@ include file="/../views/common/footer.jsp"%>