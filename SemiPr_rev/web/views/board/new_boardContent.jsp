<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/boardList.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/boardContent.css">


<div class=" bord row">
	<div class="col-md-1"></div>

	<div id="board_container2" class="col-md-10">
		<div class="row">
			<div id="content_count" class="col-md-12">
				<div style="font-weight: bolder;" class="col-md-1">글 수</div>
				<div style="color: orange; font-weight: bolder;" class="col-md-1">124214</div>
				<div class="col-md-6"></div>

				<div id="board_search" class="col-md-4">
					<form action="" method="GET">
						<div class="col-md-7">
							<input type="text" style="width: 100%">
						</div>
						<div class="col-md-3">
							<select>
								<option>제목</option>
								<option>내용</option>
								<option>제목+내용</option>
								<option>닉네임</option>
							</select>
						</div>
						<div class="col-md-2">
							<input type="submit" value="검색">
						</div>
					</form>
				</div>
			</div>
		</div>







		<div id="board_content_area" class="row">
			<div id="title" class="col-md-1">분류</div>
			<div id="title" class="col-md-8">제목</div>
			<div class="content_info col-md-1">작성자</div>
			<div class="content_info col-md-1">21.05.27</div>
			<div class="content_info col-md-1">13</div>
		</div>



		<div id="content_file" class="row">
			<div class="col-md-12">첨부파일 (누르면 슬라이드 / 파일명 보여줌)</div>
		</div>



		<div id="content_detail" class="row">
			<div id="content_text">
				<textarea rows="30" cols="80"></textarea>
			</div>
		</div>

		<div id="content_btn_area" class="row">
			<div class="col-md-5"></div>
			<div class="btn col-md-1">수정하기</div>
			<div class="btn col-md-1">삭제하기</div>
			<div class="col-md-5"></div>
		</div>


		<div id="reply_area" class="col-md-12">
			<br>

			<div id="reply_count" class="row">
				<span> 댓글 : x개</span>
			</div>



			<!-- Lv1 -->
			<div class="reply row">
				<div class="reply_img col-md-1">
					<img src="<%=request.getContextPath()%>/Resource/img/no_image.png">
				</div>

				<div class="reply_writer_info col-md-1">
					<p class="reply_writer_info_nickname col-md-12">닉네임01</p>
					<p class="reply_writer_info_etc col-md-12">2021.05.28 17:35:28</p>
				</div>

				<div class="reply_content col-md-10">
					<div class="reply_content_area row">
						<p>lv1:dddddd</p>
					</div>
					<div class="reply_btn_area row">
						<div class="col-md-9"></div>
						<div class="reply_btn col-md-1">댓글</div>
						<div class="reply_btn col-md-1">삭제</div>
						<div class="reply_btn col-md-1">수정</div>
					</div>
				</div>
			</div>
			
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
					<p class="reply_writer_info_nickname col-md-12">닉네임01</p>
					<p class="reply_writer_info_etc col-md-12">2021.05.28 17:35:28</p>
				</div>

				<div class="reply_content col-md-9">
					<div class="reply_content_area row">
						<p>lv2:dddddd</p>
					</div>
					<div class="reply_btn_area row">
						<div class="col-md-9"></div>
						<div class="reply_btn col-md-1">댓글</div>
						<div class="reply_btn col-md-1">삭제</div>
						<div class="reply_btn col-md-1">수정</div>
					</div>
				</div>
			</div>
			
			
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
					<p class="reply_writer_info_nickname col-md-12">닉네임01</p>
					<p class="reply_writer_info_etc col-md-12">2021.05.28 17:35:28</p>
				</div>

				<div class="reply_content col-md-8">
					<div class="reply_content_area row">
						<p>lv3:dddddd</p>
					</div>
					<div class="reply_btn_area row">
						<div class="col-md-9"></div>
						<div class="reply_btn col-md-1">댓글</div>
						<div class="reply_btn col-md-1">삭제</div>
						<div class="reply_btn col-md-1">수정</div>
					</div>
				</div>
			</div>
			
			<!-- Lv1 -->
			<div class="reply row">
				<div class="reply_img col-md-1">
					<img src="<%=request.getContextPath()%>/Resource/img/no_image.png">
				</div>

				<div class="reply_writer_info col-md-1">
					<p class="reply_writer_info_nickname col-md-12">닉네임01</p>
					<p class="reply_writer_info_etc col-md-12">2021.05.28 17:35:28</p>
				</div>

				<div class="reply_content col-md-10">
					<div class="reply_content_area row">
						<p>lv1:dddddd</p>
					</div>
					<div class="reply_btn_area row">
						<div class="col-md-9"></div>
						<div class="reply_btn col-md-1">댓글</div>
						<div class="reply_btn col-md-1">삭제</div>
						<div class="reply_btn col-md-1">수정</div>
					</div>
				</div>
			</div>
			




			<div id="reply_write_area" class="row">
				<form action="" method="post">
					<div class="reply_write_content">
						<textarea rows="5" cols="180" style="resize: none"></textarea>
					</div>
					<hr>
					<div class="reply_write_btn">
						<input type="submit" value="댓글 등록">
					</div>
					<input type="hidden" name="userId" value=""> <input
						type="hidden" name="boardNo" value="">
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
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>


		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">글쓴이</div>
			<div class="board_content_info col-md-1">날짜</div>
			<div class="board_content_info col-md-1">13</div>
		</div>

		<div id="board_pageBar" class="row">
			<div class="col-md-5"></div>

			<div class="col-md-2">◀ 1 2 3 4 5 6 7 8 9 10 ▶</div>
			<div class="col-md-4"></div>
			<div class="col-md-1 btn"
				onclick="location.assign('<%=request.getContextPath()%>/board/write');">글쓰기</div>
		</div>

	</div>

	<div class="col-md-1"></div>
</div>
<script>
	$(".board_title").click(e=>{
		location.assign("<%=request.getContextPath()%>/board/content");
	});
</script>
<%@ include file="/views/common/footer.jsp"%>