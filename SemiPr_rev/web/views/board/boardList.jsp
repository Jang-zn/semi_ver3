<%@page import="com.semi.common.PageBar2"%>

<%@page import="com.semi.common.PageBar"%>

<%@page import="com.semi.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String searchKeyword=(String)request.getAttribute("searchKeyword");
	String searchType=(String)request.getAttribute("searchType");
	
	List<Board> list = (List<Board>)request.getAttribute("boardList");
	List<Boolean> fileyumu = (List<Boolean>)request.getAttribute("fileyumu");
	String pageBar = (String)request.getAttribute("pageBar");
	int boardListCount = (int)request.getAttribute("boardListCount");
	String sortType = (String)request.getAttribute("sortType");
%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/02boardList.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/font.css">

<br>
<div class="row">
	<!-- <div class="col-md-1"></div> -->
	
	<div id="board_container" class="col-md-12">
		<!-- 글 수 + 검색창 -->
			<div id="content_count" class="row">
				<div class="col-md-1">전체 글 </div>
				<div style="color: orange;" class="col-md-1"><%=boardListCount %></div>
				<div class="col-md-5"></div>

				<div id="board_search" class="col-md-5">
					<div class="row">
						<div class="col-md-9">
									<div id="search-Title" >
										<form action="<%=request.getContextPath()%>/board/boardSearch" method="GET">
											<input type="text" placeholder="제목을 입력하세요" name="searchKeyword" 
											value=<%=searchType!=null&&searchType.equals("title")?searchKeyword:"" %> > 
											<input type="hidden" name="searchType" value="title">
											<input type="submit" value="검색">
										</form>
									</div>
							<div id="search-TitleContent">
								<form action="<%=request.getContextPath()%>/board/boardSearch" method="GET">
									<input type="text" placeholder="제목+내용을 입력하세요" name="searchKeyword"
									value=<%=searchType!=null&&searchType.equals("titlecontent")?searchKeyword:"" %>> 
									<input type="hidden" name="searchType" value="titlecontent">
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
							<div id="search-Writer">
								<form action="<%=request.getContextPath()%>/board/boardSearch" method="GET">
									<input type="text" placeholder="작성자를 입력하세요" name="searchKeyword"
									value=<%=searchType!=null&&searchType.equals("writer")?searchKeyword:"" %>>  
									<input type="hidden" name="searchType" value="writer">
									<input type="submit" value="검색">
								</form>
							</div>
						</div> 
						<div class="col-md-3">
							<select id="search-Type">
								<option value="Title" <%=searchType!=null&&searchType.equals("title")?"selected":"" %>>제목</option>
								<option value="Content"  <%=searchType!=null&&searchType.equals("content")?"selected":"" %>>내용</option>
								<option value="TitleContent" <%=searchType!=null&&searchType.equals("titlecontent")?"selected":"" %>>제목+내용</option>
								<option value="Writer"  <%=searchType!=null&&searchType.equals("Writer")?"selected":"" %>>작성자</option>
							</select> 
						</div>
					</div>
				</div>
			</div>
						



		<div id="board_head" class="row">
		<!-- 글 리스트 헤드 -->
			<div class="board_sort col-md-1">
				<select name="b_sort">
					<option value="전체" <%=sortType!=null&&sortType.equals("전체")?"selected":""%>>전체</option>
					<option value="자유" <%=sortType!=null&&sortType.equals("자유")?"selected":""%>>자유</option>
					<option value="눈바디" <%=sortType!=null&&sortType.equals("눈바디")?"selected":""%>>눈바디</option>
				</select>
			</div>
			<div class="board_title col-md-7"
				style="display: inline-block; text-align: center;">제목</div>
			<div class="board_content_info col-md-1">
				<span>글쓴이</span>
			</div>
			<div class="board_content_info col-md-1">
				<span>날짜</span>
			</div>
			<div class="board_content_info col-md-1">
				<span>조회수</span>
			</div>

		</div>
	
		

		<!-- 글 리스트 -->
		 	<%if(list==null) {%>
		 		데이터가 없습니다.
		 	<%} else{ %>
		 		<%-- <%for(Board b : list) {%> --%>
		 		<%for(int i=0; i<list.size(); i++){ %>
		 			<%Board b = (Board)list.get(i); %>
						<div id="board_body" class="row">
							<div class="board_sort col-md-1"><%=b.getCategory() %></div>
							<div class="board_title col-md-7"  onclick="boardContent(<%=b.getContentNo()%>);">
								<div class="board_file_img col-md-1">
										<%if(fileyumu==null) {%>
											불러온 request가 없네요
										<%} else{%>
											<%for(int j=0; j<fileyumu.size(); j++){ %>
				 								<%Boolean f = (Boolean)fileyumu.get(j); %>
												<%if((i==j)&&f==false){ %>
													<img style="width: 25px;position: absolute; height: 20px;" src="">
												<%break;} else{%>
													
												<%} %>
											<%} %>
										<%} %>
								</div>
								<div class="col-md-11"><%=b.getTitle() %></div>
							</div>
							<div class="board_content_info col-md-1">
								<%=b.getWriter() %>
							</div>
							<div class="board_content_info col-md-1">
								<%=b.getWriteDate() %>
							</div>
							<div class="board_content_info col-md-1">
								<%=b.getReadCount() %>
							</div>
							<%-- <%if(loginM.getUserId("admin")||loginM.getUserId(b.getWriter()) {%> --%>
							<div class="board_content_info col-md-1">
								<button value = "<%=b.getContentNo() %>" onclick="deleteBoard(event)">삭제하기</button>
							</div>
							<%-- <%} %> --%>
						</div>
					<%} %>
				<%} %>

		<div id="board_pageBar" class="row">
			<div class="col-md-5"></div>
			
			<div class="col-md-3"><%=pageBar %></div>
			<div class="col-md-3"></div>
			<div class="col-md-1 btn"
				onclick="location.assign('<%=request.getContextPath()%>/board/write');">글쓰기</div>
		</div>

	</div>
	
	<!-- <div class="col-md-1"></div> -->
</div>



<script>
	const deleteBoard=(e)=>{
		if(confirm("정말 삭제하실껀가요?")){
				location.assign('<%=request.getContextPath()%>/board/delete?no='+$(e.target).val());			
			}
	}
	$("[name=b_sort]").change(e=>{
			if($(e.target).val()!='전체'){
				location.assign('<%=request.getContextPath()%>/board/boardSort?type='+$(e.target).val());
			}else{
				location.assign('<%=request.getContextPath()%>/board/boardList');	
			}
			
		
	})
		
	const boardContent=(e)=>{
		location.assign("<%=request.getContextPath()%>/board/content?no="+e);
	}
	$("#search-Type").change(e=>{
		const Title = $("#search-Title");
		const Content = $("#search-Content");	
		const TitleContent = $("#search-TitleContent");	
		const Writer = $("#search-Writer");
		
		Title.css("display","none");
		Content.css("display","none");
		TitleContent.css("display","none");
		Writer.css("display","none");
		
		$("#search-"+$(e.target).val()).css("display","inline-block");
	});
	$(function(){
    	 $("#search-Type").change();
     });
</script>
<%@ include file="/views/common/footer.jsp"%>