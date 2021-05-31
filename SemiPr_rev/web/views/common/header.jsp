<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "com.semi.member.model.vo.*" %>
<%
	Member loginMember = (Member)session.getAttribute("login");
%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/header.css">
        <script src="<%=request.getContextPath()%>/Resource/js/jquery-3.6.0.min.js"></script>
        <script src="<%=request.getContextPath()%>/Resource/js/chart.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#menu_line>li").mouseover(function () {
                    $(this).children(".sub").stop().slideDown(200);
                });
                $("#menu_line>li").mouseleave(function () {
                    $(this).children(".sub").stop().slideUp(200);
                });
            });
            const login=()=>{
            	location.assign("<%=request.getContextPath()%>/member/login");
            }
        </script>
    </head>

    <body>
        <header id="header_container">
            <div id="logo_area"><img src="<%=request.getContextPath()%>/Resource/img/logo.png" onclick="location.assign('<%=request.getContextPath()%>')"></div>
            <div id="menu_container">
                <ul id="menu_line">
                    <li>
                        <a href="<%=request.getContextPath()%>/member/main">My Page</a>
                    </li>
                    <li>Plan
                        <ul class="sub">
                        	<li class="plan_menu"><a href="<%=request.getContextPath()%>/member/myList">My List</a></li>
                            <li class="plan_menu"><a href="<%=request.getContextPath()%>/member/excPlan">운동 계획 관리</a></li>
                            <li class="plan_menu"><a href="<%=request.getContextPath()%>/member/dietPlan">식단 계획 관리</a></li>
                        </ul>
                    </li>
                    <li>Progress
                        <ul class="sub">
                        	<li class="progress_menu"><a href="<%=request.getContextPath()%>/member/dailyLog">일일 기록</a></li>
                            <li class="progress_menu"><a href="">주간 실천 현황</a></li>
                            <li class="progress_menu"><a href="<%=request.getContextPath()%>/member/monthlyTrend">월간 실천 현황</a></li>
                            <li class="progress_menu"><a href="">My Data</a></li>
                            <li class="progress_menu"><a href="<%=request.getContextPath()%>/gallary/list">눈바디</a></li>
                        </ul>
                    </li>
                    <li>Community
                        <ul class="sub">
                            <li class="community_menu"><a href="<%=request.getContextPath()%>/board/boardList">자유게시판</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <% if(loginMember!=null){ %>
            	<div id="profile_area"><img src="<%=request.getContextPath()%>/Resource/img/blankProfile.png" style="border-radius:100%;"></div>
            <%}else{ %>
            	<div id="login_area">
            		<span onclick="login();">&#9786;로그인</span>
            	</div>
            <%} %>
            
        </header>
        <section id="aside_content">
            <div id="content_container">
                <!-- 이 위까지 header -->