<%@page import="com.semi.board.model.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	List<Board> list = (List<Board>)request.getAttribute("BoardList");
	String pageBar = (String)request.getAttribute("pageBar");
	//int boardListCount = (int)request.getAttribute("boardListCount");
%>

<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/boardList.css">
<div id="board_container">
<%@ include file="/views/board/boardListSearch.jsp" %>
		<div id="board_head">
			<ul>
				<li class="board_sort">
					<select id="classfication">
							<option value="전체">전체</option>
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
		<%-- <%if(list.isEmpty()){ %>
			<ul>
				<li>데이터가 없습니다.</li>
			</ul>
		<%}else{ %>
			<%for(Board b : list) {%> --%>
				<ul>
					<li class="board_type">자유</li>
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
		<%-- 	 <%} %>
		 <%} %> --%>
			<ul>
				<li class="board_type">눈바디</li>
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
			<ul>
				<li class="board_type">눈바디</li>
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
			<ul>
				<li class="board_type">눈바디</li>
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
			<ul>
				<li class="board_type">눈바디</li>
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
		$("#classfication").change(e=>{
			const type = $(e.target).val();
			if(type=="전체"){
				$("[class=board_type]").each((i,v)=>{
						$(v).parent("ul").css("display","flex");
				})
			}else{
			$("[class=board_type]").each((i,v)=>{
				$(v).parent("ul").css("display","flex");
				if($(v).html()!=type){
					$(v).parent("ul").css("display","none");
				}
			})
				
			}
			
		});
		
		
	
	</script>
	<%@ include file="/views/common/footer.jsp"%>