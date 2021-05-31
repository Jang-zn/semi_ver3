<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberMain.css">
<div class="row">
	<div class="col-md-1"></div>
	<div id="member_rank" class="col-md-10"></div>
</div>
<div class="row">
	<div class="col-md-1"></div>
	<div id="weekly_container" class="col-md-10">
		<div id="member_info" class="col-md-4">
			<div id="profile_area_content" class="col-md-6">
				<img src="">
			</div>
			<div id="member_info_area" class="col-md-6">
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
			</div>
		</div>
		<div id="weekly_check" class="col-md-8">
			<div id="weekly_check_title_main" class="row">
				<div class="col-md-10">주간 달성 현황</div>
				<div class="col-md-2"><button>상세보기</button></div>
			</div>
			<div id="weekly_check_daybyday_exc" class="row">
				<div class="text_plan col-md-4">운동 현황</div>
				<div class="day col-md-1">일</div>
				<div class="day col-md-1">월</div>
				<div class="day col-md-1">화</div>
				<div class="day col-md-1">수</div>
				<div class="day col-md-1">목</div>
				<div class="day col-md-1">금</div>
				<div class="day col-md-1">토</div>
				<div class="col-md-1"></div>
			</div>
			<div id="weekly_check_daybyday_menu" class="row">
				<div class="text_plan col-md-4">식단 현황</div>
				<div class="day col-md-1">일</div>
				<div class="day col-md-1">월</div>
				<div class="day col-md-1">화</div>
				<div class="day col-md-1">수</div>
				<div class="day col-md-1">목</div>
				<div class="day col-md-1">금</div>
				<div class="day col-md-1">토</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-1"></div>
	<div id="monthly_container" class="col-md-10">
		<div id="monthly_check_title_main" class="row">
			<div class="col-md-10">월간 달성 현황</div>
			<div class="col-md-2"><button	onclick="location.assign('<%=request.getContextPath()%>/member/monthlyTrend')">상세보기</button></div>
		</div>
		<div id="monthly_check_content" class="row">
			<div id="monthly_plan_trend" class="col-md-8">월간 트렌드 넣을것</div>
			<div id="monthly_plan_analysis" class="col-md-4">분석결과?</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-1"></div>
	<div id="noonbody_container_main" class="col-md-10">
		<div id="noonbody_title_main" class="row">
			<div class="col-md-10">눈바디</div>
			<div class="col-md-2"><button	onclick="location.assign('<%=request.getContextPath()%>/gallary/list')">상세보기</button></div>
		</div>
		<div id="noonbody_thumb_area" class="row">
			<div id="noonbody_left" class="col-md-1"></div>
			<div class="noonbody_thumb" class="col-md-2"></div>
			<div class="noonbody_thumb" class="col-md-2"></div>
			<div class="noonbody_thumb" class="col-md-2"></div>
			<div class="noonbody_thumb" class="col-md-2"></div>
			<div class="noonbody_thumb" class="col-md-2"></div>
			<div id="noonbody_right" class="col-md-1"></div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-1"></div>
	<div id="daily_log_container_main" class="col-md-10">
		<div id="daily_log_exc_area" class="col-md-6">
			<div id="daily_log_exc_title_main" class="row">
				<div class="col-md-10">운동일지</div>
				<div class="col-md-2"><button onclick="location.assign('<%=request.getContextPath()%>/member/dailyLog')">상세보기</button></div>
			</div>
			<div id="daily_log_exc_list" class="row">
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
			</div>
		</div>
		<div id="daily_log_menu_area" class="col-md-6">
			<div id="daily_log_menu_title_main" class="row">
				<div class="col-md-10">식단일지</div>
				<div class="col-md-2"><button onclick="location.assign('<%=request.getContextPath()%>/member/dailyLog')">상세보기</button></div>
			</div>
			<div id="daily_log_menu_list" class="row">
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
			</div>
		</div>
	</div>
</div>

<%@ include file="/../views/common/footer.jsp"%>