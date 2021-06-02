<%@page import="java.util.List"%>
<%@page import="com.semi.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String searchKeyword=(String)request.getAttribute("searchKeyword");
	String searchType=(String)request.getAttribute("searchType");
	int boardListCount = (int)request.getAttribute("boardListCount");
	Board b = (Board)request.getAttribute("board");
	List<Board> list = (List<Board>)request.getAttribute("boardList");
	String[] list2 = (String[])request.getAttribute("selectBoardFile");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/boardList.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/boardContent.css">
<div id="board_container">
	
	<div id="content_count">
			<p style="font-weight: bolder; width: 75%;">
				글 수 <span style="color: orange; font-weight: bolder;"><%=boardListCount %></span>
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
	
	<%if(b==null){ %>
		게시글이 삭제되었습니다.
	<%} else{%>
		<section id = "board_content_area">
			<div id="content_title">
			<span id="title"><%=b.getTitle() %></span><span class="content_info"><%=b.getWriter() %></span><span class="content_info"><%=b.getWriteDate() %></span><span class="content_info"><%=b.getReadCount() %></span>
			</div>
			<div id="content_file">
				<p class="slidefile">첨부파일 보기</p>
				<%if(list2==null){ %>
					<ul>
							<li>첨부파일이 없습니다.</li>
					</ul>
				<%}else{ %>
						<ul>
							<%for(int i=0; i<list2.length; i++) {%>
									<%if(i==0&&list2[i]==null){ %> 
									<li>첨부파일이 없습니다.</li>
									<%break;} else{ %>
										<%if(list2[i]==null) {%>
										<%break; }%>
										<li><%=list2[i] %></li>
									<%} %>
							<%} %>
						</ul>
				<%} %>
				
			</div>
			<div id="content_detail">
					<div id="content_text"><div style="height:400px;"><%=b.getContent()%></div><!-- <textarea rows="30" cols="100" readonly></textarea> --></div>
					<div id="content_btn_area">
						<div class="content_btn"><button>수정하기</button></div>
						<div class="content_btn"><button>삭제하기</button></div>
					</div>
			</div>
			<div id="reply_area">
				
				<div id="reply_count">
					<span> 댓글 : x개</span>
				</div>
				<ul class="reply_content_area">
					<li class="reply">
						<div class="lv1"><img src="<%=request.getContextPath()%>/Resource/img/list-arrow.png"></div>
						<div class="reply_img"><img src="<%=request.getContextPath()%>/Resource/img/no_image.png">
						</div>
						
						<div class="reply_writer_info">
							<p class="reply_writer_info_nickname">닉네임01</p>
							<p class="reply_writer_info_etc">2021.05.28 17:35:28</p>
						</div>
							
						<div class="reply_content">
							<div class="reply_content_area">
								<p>lv1:dddddd</p>
							</div>
							<div class="reply_btn_area">
								<div class="reply_btn"><button>댓글달기</button></div>
								<div class="reply_btn"><button>삭제하기</button></div>
								<div class="reply_btn"><button>수정하기</button></div>
							</div>
						</div>
					</li>
					<%-- <li class="reply">
						<div class="lv2"><img src="<%=request.getContextPath()%>/Resource/img/list-arrow.png">
						</div>
						<div class="reply_img"><img src="<%=request.getContextPath()%>/Resource/img/no_image.png">
						</div>
						
						<div class="reply_writer_info">
							<p class="reply_writer_info_nickname">닉네임01</p>
							<p class="reply_writer_info_etc">2021.05.28 17:35:28</p>
						</div>
							
						<div class="reply_content">
							<div class="reply_content_area">
								<p>lv2:dddddd</p>
							</div>
							<div class="reply_btn_area">
								<div class="reply_btn"><button>댓글달기</button></div>
								<div class="reply_btn"><button>삭제하기</button></div>
								<div class="reply_btn"><button>수정하기</button></div>
							</div>
						</div>	
					</li> --%>
					
					<%-- <li class="reply">
						<div class="lv3"><img src="<%=request.getContextPath()%>/Resource/img/list-arrow.png">
						</div>
						<div class="reply_img"><img src="<%=request.getContextPath()%>/Resource/img/no_image.png">
						</div>
						
						<div class="reply_writer_info">
							<p class="reply_writer_info_nickname">닉네임01</p>
							<p class="reply_writer_info_etc">2021.05.28 17:35:28</p>
						</div>
						<div class="reply_content">
							<div class="reply_content_area">
								<p>lv3:dddddd</p>
							</div>
							<div class="reply_btn_area">
								<div class="reply_btn"><button>댓글달기</button></div>
								<div class="reply_btn"><button>삭제하기</button></div>
								<div class="reply_btn"><button>수정하기</button></div>
							</div>
						</div>	
					</li> --%>
					<li class="reply">
						<div class="lv1"><img src="<%=request.getContextPath()%>/Resource/img/list-arrow.png">
						</div>
						<div class="reply_img"><img src="<%=request.getContextPath()%>/Resource/img/no_image.png">
						</div>
						<div class="reply_writer_info">
							<p class="reply_writer_info_nickname">닉네임01</p>
							<p class="reply_writer_info_etc">2021.05.28 17:35:28</p>
						</div>
							
						<div class="reply_content">
							<div class="reply_content_area">
								<p>lv1:dddddd</p>
							</div>
							<div class="reply_btn_area">
								<div class="reply_btn"><button>댓글달기</button></div>
							</div>
						</div>	
					</li>			
				</ul>
			</div>
			<div id="reply_write_area">
				<form action="" method="post">
					<div class="reply_write_content"><textarea rows="10" cols="180" style="resize:none"></textarea></div>
					<hr>
					<div class="reply_write_btn"><input type="submit" value="댓글 등록"></div>
					<input type="hidden" name="userId" value="">
					<input type="hidden" name="boardNo" value="">
				</form>
			</div>	
		</section>
	<%} %>
	<div id="board_head">
		
		<ul>
			<li class="board_sort"><select>
					<option value="">전체</option>
					<option value="자유">자유</option>
					<option value="눈바디">눈바디</option>
			</select></li>
			<li class="board_title"
				style="display: inline-block; text-align: center;"><span>제목</span>
			</li>
			<li class="board_content_info"><span>글쓴이</span></li>
			<li class="board_content_info"><span>날짜</span></li>
			<li class="board_content_info"><span>조회수</span></li>
		</ul>
	</div>
	<div id="board_body">
	 <%if(list==null){ %>
			<ul>
				<li>데이터가 없습니다.</li>
			</ul>
		<%}else{ %>
			<%for(Board b1 : list) {%> 
				<ul>
					<li class="board_type"><%=b1.getCategory() %></li>
					<li class="board_title" onclick="boardContent(<%=b1.getContentNo()%>);">
						<div class="board_file_img">
							<img src="">
						</div>
						<span><%=b1.getTitle() %></span>
					</li>
					<li class="board_content_info"><span><%=b1.getWriter() %></span></li>
					<li class="board_content_info"><span><%=b1.getWriteDate() %></span></li>
					<li class="board_content_info"><span><%=b1.getReadCount() %></span></li>
					<%--<%if(loginm.getUserId().equlas("admin")){ 
					<li><button>삭제</button></li>
					<%} %>--%>
				</ul>
		 	 <%} %>
		 <%} %> 
	</div>
	<div id="board_pageBar">
		<%=pageBar %>
		<%--<span>◀ 1 2 3 4 5 6 7 8 9 10 ▶</span> --%><button onclick="location.assign('<%=request.getContextPath()%>/board/write');">글쓰기</button>
	</div>
</div>
<script>
	$(".slidefile").next("ul").css("display","none");
	
	$(".slidefile").click(e=>{
		$(e.target).next("ul").slideDown(800);
	})
	
	const boardContent=(e)=>{
		location.assign("<%=request.getContextPath()%>/board/content?no="+e);
	}
	
	
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