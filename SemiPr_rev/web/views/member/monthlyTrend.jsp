<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/../views/common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/monthlyTrend.css">
    <div id="container_progress_trend">
        <nav>
            <ul>
                <li>이번주 계획</li>
                <li>달성현황</li>
                <li>건강기록</li>
            </ul>
        </nav>
        <div id="container_content_progress_trend">
            <div id="PracticeRate_img">
                <img
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_qscX8L2bnZfZhslTsvDavnGhH16jUEsTRw&usqp=CAU">
            </div>
            <div id="Practice_trend">
                trend
            </div>
            <div id="select_sort">
                <select id="dataType_select">
                    <option name="dataType" value="">운동 실천률</option>
                    <option name="dataType" value="">식단 실천률</option>
                    <option name="dataType" value="">운동량</option>
                    <option name="dataType" value="">일일 섭취 칼로리</option>
                    <option name="dataType" value="">몸무게</option>
                    <option name="dataType" value="">체지방률</option>
                    <option name="dataType" value="">근골격량</option>
                    <option name="dataType" value="">인바디점수</option>
                </select><br>
                <label><input type="radio" name="term" value="1m"> 1개월 </label><br>
                <label><input type="radio" name="term" value="3m"> 3개월 </label><br>
                <label><input type="radio" name="term" value="6m"> 6개월 </label><br>
                <label><input type="radio" name="term" value="12m"> 1년 </label><br>
                <button id="read_trend" name="read_trend">조회하기</button>
            </div>
        </div>
        <div id="calendar">
            달력
        </div>
        <div id="statistics_container">
            <h2>월간 실천 통계</h2>
            <div id="data_container">
            <div id="pieChart">

            </div>
            <div id="rank">

            </div>
        </div>
        </div>
    </div>

<%@ include file = "/../views/common/footer.jsp"%>