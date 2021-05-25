<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/dailyExc.css">
	<div id="dailyExc_title">
                <h2>운동일지</h2>
            </div>
            <div>
                <div id="personal_record_container">
                    <h3>연속 x일째 계획 실천중</h3>
                </div>
            <div id = dailyExc_content_container>
                <div id="dailyExc_content">
                    <ul id="exc_plan_list">
                        <li class="exc_plan_title"><span>(제목)운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class="exc_plan_list"><span>운동이름</span><span>reps</span><span>sets</span></li>
                        <li class="exc_plan_list"><span>운동이름</span><span>reps</span><span>sets</span></li>
                        <li class="exc_plan_list"><span>운동이름</span><span>reps</span><span>sets</span></li>
                        <li class="exc_plan_list"><span>운동이름</span><span>reps</span><span>sets</span></li>
                        <li class="exc_plan_list"><span>운동이름</span><span>reps</span><span>sets</span></li>
                        <li class="exc_plan_list"><span>운동이름</span><span>reps</span><span>sets</span></li>
                    </ul>
                    <div id="complete_exc">
                        <button>실천 완료</button>
                    </div>
                </div>
                <div id="dailyExc_list">
                    <ul id="exc_list">
                        <li class = "exc_plan_title"><span>No</span><span>기록일</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현(이 위치는 항상 오늘날짜)</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                    </ul>
                    <div id="pageBar">
                        <h4>◀ &nbsp1&nbsp &nbsp2&nbsp &nbsp3&nbsp &nbsp4&nbsp &nbsp5&nbsp ▶</h4>
                    </div>
                </div>
            </div>
        </div>
        <div id="dailyExc_title">
                <h2>식단일지</h2>
            </div>
            <div>
                <div id="personal_record_container">
                    <h3>연속 x일째 계획 실천중</h3>
                </div>
            <div id = dailyExc_content_container>
                <div id="dailyExc_content">
                    <ul id="exc_plan_list">
                        <li class="exc_plan_title"><span>(제목)운동 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class="exc_plan_list"><span>메뉴명</span><span>kcal</span><span>영양정보</span></li>
                        <li class="exc_plan_list"><span>메뉴명</span><span>kcal</span><span>영양정보</span></li>
                        <li class="exc_plan_list"><span>메뉴명</span><span>kcal</span><span>영양정보</span></li>
                        <li class="exc_plan_list"><span>메뉴명</span><span>kcal</span><span>영양정보</span></li>
                        <li class="exc_plan_list"><span>메뉴명</span><span>kcal</span><span>영양정보</span></li>
                        <li class="exc_plan_list"><span>메뉴명</span><span>kcal</span><span>영양정보</span></li>
                    </ul>
                    <div id="complete_exc">
                        <button>실천 완료</button>
                    </div>
                </div>
                <div id="dailyExc_list">
                    <ul id="exc_list">
                        <li class = "exc_plan_title"><span>No</span><span>기록일</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현(이 위치는 항상 오늘날짜)</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                        <li class = "exc_list"><span>No</span><span>식단 계획 날짜 +요일+ 실행여부로 색표현</span></li>
                    </ul>
                    <div id="pageBar">
                        <h4>◀ &nbsp1&nbsp &nbsp2&nbsp &nbsp3&nbsp &nbsp4&nbsp &nbsp5&nbsp ▶</h4>
                    </div>
                </div>
            </div>
        </div>
<%@ include file = "/views/common/footer.jsp"%>