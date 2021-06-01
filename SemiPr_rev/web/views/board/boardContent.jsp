<%@page import="com.semi.board.model.vo.Reply"%>
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
	List<Boolean> fileyumu = (List<Boolean>)request.getAttribute("fileyumu");
	String[] list2 = (String[])request.getAttribute("selectBoardFile");
	String pageBar = (String)request.getAttribute("pageBar");
	List<Reply> relist = (List<Reply>)request.getAttribute("commentList");
	int commentCount = (Integer)request.getAttribute("commentCount");
%>
	
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/boardList.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/boardContent.css">


<div class=" bord row">
	<div class="col-md-1"></div>

	<div id="board_container" class="col-md-10">
		<!-- 글 수 + 검색창 -->
		<div class="row">
			<div id="content_count" class="col-md-12">
				<div style="font-weight: bolder;" class="col-md-1">글 수</div>
				<div style="color: orange; font-weight: bolder;" class="col-md-1"><%=boardListCount %></div>
				<div class="col-md-6"></div>

				<div id="board_search" class="col-md-4">
						<div class="col-md-8">
									<div id="search-Title" >
										<form action="<%=request.getContextPath()%>/board/boardSearch" method="GET">
											<input type="text" placeholder="제목을 입력하세요" name="searchKeyword"
											value=<%=searchType!=null&&searchType.equals("title")?searchKeyword:"" %>> 
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
						<div class="col-md-4">
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






		<%if (b==null){%>
			게시글이 삭제 되었습니다.
		<%} else{%>
		<div id="board_content_area" class="row">
			<div id="title" class="col-md-1"><%=b.getCategory()%></div>
			<div id="title" class="col-md-8"><%=b.getTitle() %></div>
			<div class="content_info col-md-1"><%=b.getWriter() %></div>
			<div class="content_info col-md-1"><%=b.getWriteDate() %></div>
			<div class="content_info col-md-1"><%=b.getReadCount() %></div>
		</div>
		<%} %>



		<div id="content_file" class="row">
			<p class="slidefile">첨부파일 보기</p>
				<%if(list2==null){ %>
					
						첨부파일을 불러올수 없습니다.(서버이상)
				
				<%}else{ %>
						<ul>
							<%for(int i=0; i<list2.length; i++) {%>
									<%if(i==0&&list2[i]==null){ %> 
									<li>첨부파일이 없습니다.</li>
									<%break;} else{ %>
										<%if(list2[i]==null) {%>
										<%break; }%>
										<li><a href="<%=request.getContextPath()%>//board/fileDonwLoad?filename=<%=list2[i]%>"><%=list2[i] %></a></li>
									<%} %>
							<%} %>
						</ul>
				<%} %>
		</div>



		<div id="content_detail" class="row">
			<div id="content_text">
				<div style="height:400px;"><%=b.getContent()%></div>
			</div>
		</div>

		<div id="content_btn_area" class="row">
			<div class="col-md-5"></div>
			<!-- 관리자 or 작성자만 수정 삭제 가능하게 -->
			<%-- <%if(loginM.getUserId().equals("admin")||loginM.getUserId().equals(b.getMemberId())){ %> --%>
				<div class="btn col-md-1" onclick="location.assign('<%=request.getContextPath()%>/board/update?no=<%=b.getContentNo()%>');">수정하기</div>
				<div class="btn col-md-1" onclick="deleteBoard();">삭제하기</div>
			<%-- <%} %> --%>
			<div class="col-md-5"></div>
		</div>


		<div id="reply_area" class="col-md-12">
			<br>

			<div id="reply_count" class="row">
				<span> 댓글 : <%=commentCount %>개</span>
			</div>



			<!-- Lv1 -->
			<%if(relist==null){ %>
				자료가 없어요!
			<%} else{%>
				<%for(Reply re : relist) {%>
					<%if(re.getReplyLevel()==1) {%>
					<div class="reply row">
						<div class="reply_img col-md-1">
							<img src="<%=request.getContextPath()%>/Resource/img/no_image.png">
						</div>
		
						<div class="reply_writer_info col-md-1">
							<p class="reply_writer_info_nickname col-md-12"><%=re.getWriter() %></p>
							<p class="reply_writer_info_etc col-md-12"><%=re.getReplyDate() %></p>
						</div>
		
						<div class="reply_content col-md-10">
							<div class="reply_content_area row">
								<p><%=re.getReplyContent() %></p>
							</div>
							<div class="reply_btn_area row">
								<div class="col-md-9"></div>
								<div class="reply_btn col-md-1"><button value ="<%=re.getReplyNo()%>" class="lev1">댓글</button></div>
								<input type="hidden" value="<%=re.getReplyNo()%>">
								<!-- 관리자 or 작성자만 수정 삭제 가능하게 -->
							<%-- <%if(loginM.getUserId().equals("admin")||loginM.getUserId().equals(b.getMemberId())){ %> --%>
								<div class="reply_btn col-md-1 deleteComment" >삭제</div>
								<div class="reply_btn col-md-1 updateComment">수정</div>
							<%-- <%} %> --%>
							</div>
						</div>
					</div>
					<%} else if(re.getReplyLevel()==2) {%>
				
				<!-- Lv2 -->
				<div class="reply row">
					<div class="col-md-1">
						<img
							src="<%=request.getContextPath()%>/Resource/img/list-arrow.png"
							style="width: 25%">
					</div>
					<div class="reply_img col-md-1">
						<img src="<%=request.getContextPath()%>/Resource/img/no_image.png">
					</div>
	
					<div class="reply_writer_info col-md-1">
						<p class="reply_writer_info_nickname col-md-12"><%=re.getWriter() %></p>
						<p class="reply_writer_info_etc col-md-12"><%=re.getReplyDate() %></p>
					</div>
	
					<div class="reply_content col-md-9">
						<div class="reply_content_area row">
							<p><%=re.getReplyContent() %></p>
						</div>
						<div class="reply_btn_area row">
							<div class="col-md-9"></div>
							<div class="reply_btn col-md-1"><button  class="lev2" value="<%=re.getReplyNo()%>">댓글</button></div>
							<input type="hidden" value="<%=re.getReplyNo()%>">
							<!-- 관리자 or 작성자만 수정 삭제 가능하게 -->
							<%-- <%if(loginM.getUserId().equals("admin")||loginM.getUserId().equals(b.getMemberId())){ %> --%>
								<div class="reply_btn col-md-1 deleteComment" >삭제</div>
								<div class="reply_btn col-md-1 updateComment" >수정</div>
							<%-- <%} %> --%>
						</div>
					</div>
				</div>
				<%} else{%>
				
				
				<!-- Lv3 -->
				<div class="reply row">
					<div class="col-md-1"></div>
					<div class="col-md-1">
						<img
							src="<%=request.getContextPath()%>/Resource/img/list-arrow.png"
							style="width: 25%">
					</div>
					<div class="reply_img col-md-1">
						<img src="<%=request.getContextPath()%>/Resource/img/no_image.png">
					</div>
	
					<div class="reply_writer_info col-md-1">
						<p class="reply_writer_info_nickname col-md-12"><%=re.getWriter() %></p>
						<p class="reply_writer_info_etc col-md-12"><%=re.getReplyDate() %></p>
					</div>
	
					<div class="reply_content col-md-8">
						<div class="reply_content_area row">
							<p><%=re.getReplyContent() %></p>
						</div>
						<div class="reply_btn_area row">
							<div class="col-md-9"></div>
							<input type="hidden" value="<%=re.getReplyNo()%>">
							<!-- 관리자 or 작성자만 수정 삭제 가능하게 -->
							<%-- <%if(loginM.getUserId().equals("admin")||loginM.getUserId().equals(b.getMemberId())){ %> --%>
								<div class="reply_btn col-md-1 deleteComment" >삭제</div>
								<div class="reply_btn col-md-1 updateComment">수정</div>
							<%-- <%} %> --%>
						</div>
					</div>
				</div>
				<%} %>
			<%} %>
		<%} %>
			<div id="reply_write_area" class="row">
				<form action="<%=request.getContextPath() %>/board/InsertNoticeComment" method="post" onsubmit="return checkContent();">
					<div class="reply_write_content">
						<textarea rows="5" cols="180" name ="CommentContent"style="resize: none"></textarea>
					</div>
					<hr>
					<div class="reply_write_btn">
						<input type="submit" value="댓글 등록">
					</div>
					<input type="hidden" name="userId" value="aaa"> 
					<input type="hidden" name="boardNo" value="<%=b.getContentNo()%>">
					<input type="hidden" name="replyNoRef" value="0">
					<input type="hidden" name="replyLevel" value="1">
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</div>







<br>
<br>
<div id="board_container" class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<div id="board_head" class="row">
			<!-- 글 리스트 헤드 -->
			<div class="board_sort col-md-1">
				<select>
					<option>-분류-</option>
					<option value="자유">자유</option>
					<option value="눈바디">눈바디</option>
				</select>
			</div>
			<div class="board_title col-md-8"
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
		 			<%Board bb = (Board)list.get(i); %>
						<div id="board_body" class="row">
							<div class="board_sort col-md-1"><%=bb.getCategory() %></div>
							<div class="board_title col-md-8"  onclick="boardContent(<%=bb.getContentNo()%>);">
								<div class="board_file_img col-md-1">
										<%if(fileyumu==null) {%>
											불러온 request가 없네요
										<%} else{%>
											<%for(int j=0; j<fileyumu.size(); j++){ %>
				 								<%Boolean f = (Boolean)fileyumu.get(j); %>
												<%if((i==j)&&f==false){ %>
													<img style="width: 25px;position: absolute;height: 20px;" src="">
												<%break;} else{%>
													
												<%} %>
											<%} %>
										<%} %>
								</div>
								<div class="col-md-11"><%=bb.getTitle() %></div>
							</div>
							<div class="board_content_info col-md-1">
								<%=bb.getWriter() %>
							</div>
							<div class="board_content_info col-md-1">
								<%=bb.getWriteDate() %>
							</div>
							<div class="board_content_info col-md-1">
								<%=bb.getReadCount() %>
							</div>
						</div>
					<%} %>
				<%} %>

		<div id="board_pageBar" class="row">
			<div class="col-md-5"></div>
			
			<div class="col-md-2">	<%=pageBar %> </div>
			<div class="col-md-4"></div>
			<div class="col-md-1 btn"
				onclick="location.assign('<%=request.getContextPath()%>/board/write');">글쓰기</div>
		</div>

	</div>
	
	<div class="col-md-1"></div>
</div>
<script>
	$(".updateComment").off("click");
	$(".updateComment").click(e=>{
		const updateBefore = $(e.target).parent().siblings().find("p").html();
		const button = $("<button>").attr({
						onclick:"updateajax(event);"	
			}).html("수정");
		const input = $("<input>").attr({
			type:"text",
			name:"updateAfter"
		});
		input.val(updateBefore);
		if($(e.target).parent().siblings().find("input").length==0){
			$(e.target).parent().siblings().append(input).append(button);
			$(e.target).parent().siblings().find("p").hide();
		}
		$(e.target).off("click");
		
	})
	const updateajax=(e)=>{
		console.log("댓글 번호"+$(e.target).parent().next().find("input").val());		
		console.log("수정내용  :"+$(e.target).parent().find("input").val());	
			
		$.ajax({
				url:"<%=request.getContextPath()%>/board/commentUpdate",
				data:{
					"commentNo" : $(e.target).parent().next().find("input").val(),
					"updateContent" : $(e.target).parent().find("input").val()			
					},
				success:data=>{
					console.log(data);
					if(data=="true"){
						
						$(e.target).parent().find("p").html($(e.target).parent().find("input").val()).show();					
						$(e.target).parent().find("input").remove();
						$(e.target).parent().find("button").remove();
						
					}
				},
				error:(r,m,s)=>{
					console.log(r);
					console.log(s);
				}
			}) 
			
			$(".updateComment").on("click",e=>{
							alert("새로고침하고 다시하길 권합니다.");	
							const updateBefore = $(e.target).parent().siblings().find("p").html();
							const button = $("<button>").attr({
											onclick:"updateajax(event);"	
								}).html("수정");
							const input = $("<input>").attr({
								type:"text",
								name:"updateAfter"
							});
							input.val(updateBefore);
							if($(e.target).parent().siblings().find("input").length==0){
								$(e.target).parent().siblings().append(input).append(button);
								$(e.target).parent().siblings().find("p").hide();
							}
							$(e.target).off("click");
							
							
							
						})
		
	}
	
	const deleteBoard=()=>{
		if(confirm("정말 삭제하실껀가요?")){
			location.assign('<%=request.getContextPath()%>/board/delete?no=<%=b.getContentNo()%>');
		}
	}

	$(".deleteComment").click(e=>{
		if(confirm("댓글을 삭제할껀가요?")){
			const no = $(e.target).prev().val();
			location.assign('<%=request.getContextPath()%>/board/deleteComment?commentNo='+no+"&boardNo="+<%=b.getContentNo()%>);
			
	}})
	

	 $(".lev1").click(e=>{
		const form = $("#reply_write_area>form").clone();
		form.attr({
			onsubmit:"return checkContent1();"			
		})
		form.find("textarea").attr({
				rows:1,
				cols:100,
				id:"CommentContentLev1"
			});
			form.find('[name=replyLevel]').val("2");
			form.find('[name=replyNoRef]').val($(e.target).val());
			$(e.target).parent().parent().parent().append(form);	
			$(e.target).off("click");
		});
	 $(".lev2").click(e=>{
			const form = $("#reply_write_area>form").clone();
			form.attr({
				onsubmit:"return checkContent2();"			
			})
			form.find("textarea").attr({
					rows:1,
					cols:100,
					id:"CommentContentLev2"
				});
				form.find('[name=replyLevel]').val("3");
				form.find('[name=replyNoRef]').val($(e.target).val());
				$(e.target).parent().parent().parent().append(form);	
				$(e.target).off("click");
			});
		
	

	$(".slidefile").next("ul").css("display","none");
		
	$(".slidefile").click(e=>{
		$(e.target).next("ul").slideDown(800);
	});

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
	
	const checkContent=()=>{
		const content = $("[name=CommentContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요!");
		
			return false;
		}
	}
	const checkContent1=()=>{
		const content = $("[id=CommentContentLev1]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요!");
			$("[id=CommentContentLev1]").focus();
			return false;
		}
	}
	const checkContent2=()=>{
		const content = $("[id=CommentContentLev2]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요!");
			$("[id=CommentContentLev2]").focus();
			return false;
		}
	}
</script>
<%@ include file="/views/common/footer.jsp"%>