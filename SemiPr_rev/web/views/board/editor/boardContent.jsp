<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/boardList.css">
<div id="board_container">
	<div id="content_count">
		<p style="font-weight: bolder; width: 75%;">
			글 수 <span style="color: orange; font-weight: bolder;">124214</span>
		</p>
		<div id="board_search">
			<form action="" method="GET">
				<input type="text"> <select>
					<option>제목</option>
					<option>내용</option>
					<option>제목+내용</option>
					<option>닉네임</option>
				</select> <input type="submit" value="검색">
			</form>
		</div>
	</div>
	
	
	
	
	
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/boardContent.css">
	<section id = "board_content_area">
		<div id="content_title">
		<span id="title">제목</span><span class="content_info">작성자</span><span class="content_info">21.05.27</span><span class="content_info">13</span>
		</div>
		
		<div id="content_file">
			첨부파일 (누르면 슬라이드 / 파일명 보여줌)
			<ul>
				<li>사진1.jpg</li>
				<li>사진2.jpg</li>
			</ul>
		</div>
		<div id="content_detail">
				<div id="content_text"><textarea rows="30" cols="100"></textarea></div>
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
				<li class="reply">
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
				</li>
				<li class="reply">
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
				</li>
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
	
	
	
	
	
	
	
	
	<div id="board_head">
		<ul>
			<li class="board_sort"><select>
					<option>-분류-</option>
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
		<ul>
			<li class="board_sort">눈바디</li>
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
		<span>◀ 1 2 3 4 5 6 7 8 9 10 ▶</span><button onclick="location.assign('<%=request.getContextPath()%>/board/write');">글쓰기</button>
	</div>
</div>
<script>
	$(".board_title").click(e=>{
		location.assign("<%=request.getContextPath()%>/board/content");
	});
</script>
<%@ include file="/views/common/footer.jsp"%>