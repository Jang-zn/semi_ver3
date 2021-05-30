<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/noonList.css">

<div class="row">
	<div class="col-md-1"></div>
	<div id="n_title" class="col-md-10">
		<h2>눈바디</h2>
	</div>
	<div class="col-md-1"></div>
</div>
<div class="row">
	<div class="col-md-1"></div>

	<div id="n_content_area" class="col-md-10">

		<div id="n_content" class="col-md-8">
			<div id="n_content_img" class="col-md-12">
				<img src="">
			</div>
			<div id="n_date" class="col-md-12">
				<p>21.5.26 / xxx님의 기록</p>
			</div>
			<div id="n_comment" class="col-md-12">
				<div id="comment_area" class="col-md-12">
					<textarea rows="10" cols="100"></textarea>
				</div>
			</div>
		</div>


		<div id="n_list" class="col-md-4">
			<div class="row">
				<div class="col-md-2 btn" onclick="location.assign('<%=request.getContextPath()%>/gallary/write');">사진등록</div>
				
				<div class="col-md-10">
					<form action="" method="GET">
						<div class="col-md-10">
							<input type="text" style="width:100%;">
						</div>
						<div class="col-md-2 btn">검색</div>
						</form>
				</div>
			</div>


			<div id="n_img_list" class="col-md-12">
				
					<div class="row">
						<div class="img_obj col-md-6"></div>
						<div class="img_obj col-md-6"></div>
					</div>
					<div class="row">
						<div class="img_obj col-md-6"></div>
						<div class="img_obj col-md-6"></div>
					</div>
					<div class="row">
						<div class="img_obj col-md-6"></div>
						<div class="img_obj col-md-6"></div>
					</div>
			</div>

			<div id="n_pageBar" class="row">
				<div class="col-md-12">◀ 1 2 3 4 5 ▶</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</div>



<%@ include file="/views/common/footer.jsp"%>