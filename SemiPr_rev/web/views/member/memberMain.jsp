<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberMain.css">
<div id="member_rank"></div>
<div id="weekly_container">
	<div id="member_info">
		<div id="profile_area_content">
			<img src="">
		</div>
		<div id="member_info_area">
			<p></p>
			<p></p>
			<p></p>
			<p></p>
			<p></p>
		</div>
	</div>
	<div id="weekly_check">
		<div id="weekly_check_title_main">
			<span>주간 달성 현황</span>
			<button>상세보기</button>
		</div>
		<div id="weekly_check_daybyday_exc">
			<div class="text_plan">운동 현황</div>
			<div class="day">일</div>
			<div class="day">월</div>
			<div class="day">화</div>
			<div class="day">수</div>
			<div class="day">목</div>
			<div class="day">금</div>
			<div class="day">토</div>
		</div>
		<div id="weekly_check_daybyday_menu">
			<div class="text_plan">식단 현황</div>
			<div class="day">일</div>
			<div class="day">월</div>
			<div class="day">화</div>
			<div class="day">수</div>
			<div class="day">목</div>
			<div class="day">금</div>
			<div class="day">토</div>
		</div>
	</div>
</div>
<div id="monthly_container">
	<div id="monthly_check_title_main">
		<span>월간 달성 현황</span>
		<button>상세보기</button>
	</div>
	<div id="monthly_check_content">
		<div id="monthly_plan_trend">월간 트렌드 넣을것</div>
		<div id="monthly_plan_analysis">분석결과?</div>
	</div>
</div>
<div id="noonbody_container_main">
	<div id="noonbody_title_main">
		<span>눈바디</span>
		<button>상세보기</button>
	</div>
	<div id="noonbody_thumb_area">
		<div id="noonbody_left"></div>
		<div class="noonbody_thumb"></div>
		<div class="noonbody_thumb"></div>
		<div class="noonbody_thumb"></div>
		<div class="noonbody_thumb"></div>
		<div class="noonbody_thumb"></div>
		<div id="noonbody_right"></div>
	</div>
</div>
<div id="daily_log_container_main">
	<div id="daily_log_exc_area">
		<div id="daily_log_exc_title_main">
			<span>운동일지</span>
			<button>상세보기</button>
		</div>
		<div id="daily_log_exc_list">
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
	<div id="daily_log_menu_area">
		<div id="daily_log_menu_title_main">
			<span>식단일지</span>
			<button>상세보기</button>
		</div>
		<div id="daily_log_menu_list">
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


<%@ include file="/../views/common/footer.jsp"%>