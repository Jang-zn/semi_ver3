<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String searchKeyword=(String)request.getAttribute("searchKeyword");
	String searchType=(String)request.getAttribute("searchType");
%>    

		<div id="content_count">
			<p style="font-weight: bolder; width: 75%;">
				글 수 <span style="color: orange; font-weight: bolder;"><%-- <%=boardListCount %> --%></span>
			</p>
			<div id="board_search">
					<select id="search-Type">
						<option value="Title" <%=searchType!=null&&searchType.equals("title")?"selected":"" %>>제목</option>
						<option value="Content"  <%=searchType!=null&&searchType.equals("content")?"selected":"" %>>내용</option>
						<option value="TitleContent" <%=searchType!=null&&searchType.equals("titlecontent")?"selected":"" %>>제목+내용</option>
						<option value="Nickname"  <%=searchType!=null&&searchType.equals("nickname")?"selected":"" %>>닉네임</option>
					</select> 
			</div>
			<div id="search-Title">
				<form action="<%=request.getContextPath()%>/board/boardSearch" method="GET">
					<input type="text" placeholder="제목을 입력하세요" name="searchKeyword"
					value=<%=searchType!=null&&searchType.equals("title")?searchKeyword:"" %>> 
					<input type="hidden" name="searchType" value="title">
					<input type="submit" value="검색">
				</form>
			</div>
			<div id="search-Content">
				<form action="<%=request.getContextPath()%>/board/boardSearch" method="GET">
					<input type="text" placeholder="내용을 입력하세요" name="searchKeyword"
					value=<%=searchType!=null&&searchType.equals("content")?searchKeyword:"" %>> 
					<input type="hidden" name="searchType" value="content">
					<input type="submit" value="검색">
				</form>
			</div>
				<div id="search-TitleContent">
				<form action="<%=request.getContextPath()%>/board/boardSearch" method="GET">
					<input type="text" placeholder="제목+내용을 입력하세요" name="searchKeyword"
					value=<%=searchType!=null&&searchType.equals("titlecontent")?searchKeyword:"" %>> 
					<input type="hidden" name="searchType" value="titlecontent">
					<input type="submit" value="검색" >
				</form>
			</div>
				<div id="search-Nickname">
				<form action="<%=request.getContextPath()%>/board/boardSearch" method="GET">
					<input type="text" placeholder="닉네임을 입력하세요" name="searchKeyword"
					value=<%=searchType!=null&&searchType.equals("nickname")?searchKeyword:"" %>>  
					<input type="hidden" name="searchType" value="nickname">
					<input type="submit" value="검색" >
				</form>
			</div>
		</div>
		
		<script>
		$("#search-Type").change(e=>{
			const Title = $("#search-Title");
			const Content = $("#search-Content");	
			const TitleContent = $("#search-TitleContent");	
			const Nickname = $("#search-Nickname");
			
			Title.css("display","none");
			Content.css("display","none");
			TitleContent.css("display","none");
			Nickname.css("display","none");
			
			$("#search-"+$(e.target).val()).css("display","inline-block");
		});
		$(function(){
	    	 $("#search-Type").change();
	     });
		</script>