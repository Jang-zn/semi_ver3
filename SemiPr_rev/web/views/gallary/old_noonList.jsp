
<%@page import="java.util.List,com.semi.gallary.model.vo.Gallary"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% List<Gallary> list=(List<Gallary>)request.getAttribute("list");
	String pageBar=(String)request.getAttribute("pageBar");
	
%>
	
	
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/noonList.css">
	
	
<div id="n_title">
	<h2>눈바디</h2>
</div>

<div id="n_content_area">

	<div id="n_content">
		<div id="n_content_img">
			<img src="">
		</div>
		<div id="n_date">
			<p>21.5.26 / xxx님의 기록</p>
		</div>
		<div id="n_comment">
			<div id="comment_area">
				<textarea rows="10" cols="100"></textarea>
			</div>
		</div>
	</div>
	
	
	<div id="n_list">
		<div id="date_search">
			<button onclick="location.assign('<%=request.getContextPath()%>/gallary/write');">사진등록</button>
			<form action="" method="GET" style="width:70%">
				<input type="text" size="35"> 
				<input type="submit" value="검색" style="width:28%">
			</form>
		</div>
	<%if(list.isEmpty()){ %>
		<div></div>
	<%}else{
		
		for(Gallary g : list){
	%>
		
		<div id="n_img_list">
			<table>
				<tr>
					<td class="img_obj"></td><td class="img_obj"></td>
				</tr>
				<tr>
					<td class="img_obj"></td><td class="img_obj"></td>
				</tr>
				<tr>
					<td class="img_obj"></td><td class="img_obj"></td>
				</tr>
			</table>
		</div>
		<%} 
		} %>
		<div id="n_pageBar">
			<span><%=pageBar %></span>
		</div>
	</div>
	
	
	
</div>




<%@ include file="/views/common/footer.jsp"%>