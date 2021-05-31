<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/boardList.css">

<br>
<div class="row">
	<div class="col-md-1"></div>
	
	<div id="board_container" class="col-md-10">
		<!-- 글 수 + 검색창 -->
		<div class="row">
			<div id="content_count" class="col-md-12">
				<div style="font-weight: bolder;" class="col-md-1">글 수</div>
				<div style="color: orange; font-weight: bolder;" class="col-md-1">124214</div>
				<div class="col-md-6"></div>

				<div id="board_search" class="col-md-4">
					<form action="" method="GET">
						<div class="col-md-7"><input type="text" style="width:100%"></div> 
						<div class="col-md-3">
							<select>
								<option>제목</option>
								<option>내용</option>
								<option>제목+내용</option>
								<option>닉네임</option>
							</select>
						</div> 
						<div class="col-md-2"><input type="submit" value="검색"></div>
					</form>
				</div>
			</div>
		</div>



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
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>

		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
		</div>
		
		<div id="board_body" class="row">
			<div class="board_sort col-md-1">자유</div>
			<div class="board_title col-md-8">
				<div class="board_file_img col-md-1">
					<img src="">
				</div>
				<div class="col-md-11">asfsafsafasfasfasf</div>
			</div>
			<div class="board_content_info col-md-1">
				글쓴이
			</div>
			<div class="board_content_info col-md-1">
				날짜
			</div>
			<div class="board_content_info col-md-1">
				13
			</div>
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