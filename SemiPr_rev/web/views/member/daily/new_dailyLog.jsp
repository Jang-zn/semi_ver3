<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/dailyExc.css">

<div class="row">
	<div class="col-md-1"></div>
	<div id="dailyExc_title" class="col-md-10">
		<h2>운동일지</h2>
	</div>
	<div class="col-md-1"></div>
</div>


<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">

		<div class="row">
			<div id="personal_record_container">
				<h3>연속 x일째 계획 실천중</h3>
			</div>
		</div>

		<div id=dailyExc_content_container class="row">
			<div id="dailyExc_content" class="col-md-6">
				<div class="exc_plan_title row">
					<span>(제목)운동 계획 날짜 +요일+ 실행여부로 색표현</span>
				</div>
				<div class="exc_plan_list row">
					<span>운동이름</span><span>reps</span><span>sets</span>
				</div>
				<div class="exc_plan_list row">
					<span>운동이름</span><span>reps</span><span>sets</span>
				</div>
				<div class="exc_plan_list row">
					<span>운동이름</span><span>reps</span><span>sets</span>
				</div>
				<div class="exc_plan_list row">
					<span>운동이름</span><span>reps</span><span>sets</span>
				</div>
				<div class="exc_plan_list row">
					<span>운동이름</span><span>reps</span><span>sets</span>
				</div>
				<div class="exc_plan_list row">
					<span>운동이름</span><span>reps</span><span>sets</span>
				</div>
				<div class="row">
					<div class="col-md-5"></div>
					<div id="complete_exc" class="btn col-md-2">실천 완료</div>
					<div class="col-md-5"></div>
				</div>
			</div>
			<div id="dailyExc_list" class="col-md-6">
				<div class="exc_plan_title row">
					<span>No</span><span>기록일</span>
				</div>
				<div class="exc_list row">
					<span>No</span><span>운동 계획 날짜 +요일+실행여부로 색표현(이 위치는 항상 오늘날짜)</span>
				</div>
				<div class="exc_list row">
					<span>No</span><span>운동 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_list row">
					<span>No</span><span>운동 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_list row">
					<span>No</span><span>운동 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_list row">
					<span>No</span><span>운동 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_list row">
					<span>No</span><span>운동 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_list row">
					<span>No</span><span>운동 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div id="pageBar" class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6"><h4>◀ &nbsp1&nbsp &nbsp2&nbsp &nbsp3&nbsp &nbsp4&nbsp
						&nbsp5&nbsp ▶</h4></div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</div>


<div class="row">
	<div class="col-md-1"></div>
	<div id="dailyExc_title" class="col-md-10">
		<h2>식단일지</h2>
	</div>
	<div class="col-md-1"></div>
</div>


<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">

		<div class="row">
			<div id="personal_record_container">
				<h3>연속 x일째 계획 실천중</h3>
			</div>
		</div>

		<div id="dailyExc_content_container" class="row">
			<div id="dailyExc_content" class="col-md-6">

				<div class="exc_plan_title row">
					<span>(제목)운동 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_plan_list row">
					<span>메뉴명</span><span>kcal</span><span>영양정보</span>
				</div>
				<div class="exc_plan_list row">
					<span>메뉴명</span><span>kcal</span><span>영양정보</span>
				</div>
				<div class="exc_plan_list row">
					<span>메뉴명</span><span>kcal</span><span>영양정보</span>
				</div>
				<div class="exc_plan_list row">
					<span>메뉴명</span><span>kcal</span><span>영양정보</span>
				</div>
				<div class="exc_plan_list row">
					<span>메뉴명</span><span>kcal</span><span>영양정보</span>
				</div>
				<div class="exc_plan_list row">
					<span>메뉴명</span><span>kcal</span><span>영양정보</span>
				</div>

				<div class="row">
					<div class="col-md-5"></div>
					<div id="complete_exc" class="btn col-md-2">실천 완료</div>
					<div class="col-md-5"></div>
				</div>
			</div>
			<div id="dailyExc_list" class="col-md-6">
				<div class="exc_plan_title">
					<span>No</span><span>기록일</span>
				</div>
				<div class="exc_list">
					<span>No</span><span>식단 계획 날짜 +요일+실행여부로 색표현(이 위치는 항상 오늘날짜)</span>
				</div>
				<div class="exc_list">
					<span>No</span><span>식단 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_list">
					<span>No</span><span>식단 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_list">
					<span>No</span><span>식단 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_list">
					<span>No</span><span>식단 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_list">
					<span>No</span><span>식단 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div class="exc_list">
					<span>No</span><span>식단 계획 날짜 +요일+실행여부로 색표현</span>
				</div>
				<div id="pageBar" class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6"><h4>◀ &nbsp1&nbsp &nbsp2&nbsp &nbsp3&nbsp &nbsp4&nbsp
						&nbsp5&nbsp ▶</h4></div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-1"></div>
</div>
<%@ include file="/views/common/footer.jsp"%>