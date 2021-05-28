<%@page import="com.semi.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String searchKeyword=(String)request.getAttribute("searchKeyword");
	String searchType=(String)request.getAttribute("searchType");
	List<Board> list = (List<Board>)request.getAttribute("BoardList");
	String pageBar = (String)request.getAttribute("pageBar");
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/boardList.css">

	<div id="board_container">
		<div id="content_count">
			<p style="font-weight: bolder; width: 75%;">
				글 수 <span style="color: orange; font-weight: bolder;"><%-- <%= %> --%></span>
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
		<div id="board_head">
			<ul>
				<li class="board_sort">
					<select>
							<option>-분류-</option>
							<option value="자유">자유</option>
							<option value="눈바디">눈바디</option>
					</select>
				</li>
				<li class="board_title"style="display: inline-block; text-align: center;"><span>제목</span></li>
				<li class="board_content_info"><span>글쓴이</span></li>
				<li class="board_content_info"><span>날짜</span></li>
				<li class="board_content_info"><span>조회수</span></li>
			</ul>
		</div>
		<div id="board_body">
			<ul>
				<li class="board_sort">자유</li>
				<li class="board_title">
					<div class="board_file_img">
						<img src="">
					</div>
					<span>asfsafsafasfasfasf</span>
				</li>
				<li class="board_content_info"><span>글쓴이</span></li>
				<li class="board_content_info"><span>날짜</span></li>
				<li class="board_content_info"><span>13</span></li>
			</ul>
		</div>
		<div id="board_pageBar">
			<%=pageBar %>
		<!-- 	<span>◀ 1 2 3 4 5 6 7 8 9 10 ▶</span> -->
			<button onclick="location.assign('<%=request.getContextPath()%>/board/write');">글쓰기</button>
		</div>
	</div>
	<script>
		$(".board_title").click(e=>{
			location.assign("<%=request.getContextPath()%>/board/content");
		});
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
	<%@ include file="/views/common/footer.jsp"%>