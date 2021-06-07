<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="com.semi.member.model.vo.Member" %>
    <%
    Member m = (Member)request.getAttribute("id");
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
  <p>회원님의 아이디 조회결과</p>
  <%=m.getMemberId() %>
  <%} %>
<%@ include file="/../views/common/footer.jsp"%>