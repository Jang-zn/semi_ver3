<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/monthlyTrend.css">
<div id="container_progress_trend" class="row">
	<br>
	<div class='row'>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="col-md-12">
				<div class="col-md-4">이번주 계획</div>
				<div class="col-md-4">달성현황</div>
				<div class="col-md-4">건강기록</div>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
	<br>


	<div class="row">
		<div class="col-md-1"></div>
		<div id="container_content_progress_trend" class="col-md-10">
			<div id="PracticeRate_img" class="col-md-2">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_qscX8L2bnZfZhslTsvDavnGhH16jUEsTRw&usqp=CAU">
			</div>
			<div id="Practice_trend" class="col-md-8">trend</div>
			<div id="select_sort" class="col-md-2">
				<select id="dataType_select">
					<option name="dataType" value="">운동 실천률</option>
					<option name="dataType" value="">식단 실천률</option>
					<option name="dataType" value="">운동량</option>
					<option name="dataType" value="">일일 섭취 칼로리</option>
					<option name="dataType" value="">몸무게</option>
					<option name="dataType" value="">체지방률</option>
					<option name="dataType" value="">근골격량</option>
					<option name="dataType" value="">인바디점수</option>
				</select><br> <label><input type="radio" name="term" value="1m">
					1개월 </label><br> <label><input type="radio" name="term"
					value="3m"> 3개월 </label><br> <label><input
					type="radio" name="term" value="6m"> 6개월 </label><br> <label><input
					type="radio" name="term" value="12m"> 1년 </label><br>
				<button id="read_trend" name="read_trend">조회하기</button>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div id="calendar" class="col-md-10">달력</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div id="statistics_container" class="col-md-10">
			<div class="row">월간 실천 통계</div>
			<div id="data_container" class = "row">
				<div id="pieChart" class="col-md-6"></div>
				<div id="rank" class="col-md-6"></div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</div>

<%@ include file="/../views/common/footer.jsp"%>