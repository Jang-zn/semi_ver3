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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <link href="<%=request.getContextPath()%>/Resource/css/bootstrap.min.css" rel="stylesheet">	
        <script src="<%=request.getContextPath()%>/Resource/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#menu_line>div").mouseover(function () {
                    $(this).children(".sub").stop().slideDown(200);
                });
                $("#menu_line>div").mouseleave(function () {
                    $(this).children(".sub").stop().slideUp(200);
                });
            });
            const login=()=>{
            	location.assign("<%=request.getContextPath()%>/member/login");
            }
        </script>
    </head>

    <body>
        <div id="header_container" class="row">
            <div id="logo_area" class="col-md-3"><img src="<%=request.getContextPath()%>/Resource/img/logo.png" onclick="location.assign('<%=request.getContextPath()%>')"></div>
            <div id="menu_container" class="col-md-6">
                <div id="menu_line">
                    <div class="col-md-3">
                        <a href="<%=request.getContextPath()%>/member/main">My Page</a>

                    </div>
                    <div class="col-md-3">Plan
                        <div class="sub">
                        	<div class="plan_menu"><a href="<%=request.getContextPath()%>/member/myList">My List</a></div>
                            <div class="plan_menu"><a href="<%=request.getContextPath()%>/member/excPlan?numPerpage=10">운동 계획 관리</a></div>
                            <div class="plan_menu"><a href="">식단 계획 관리</a></div>
                        </div>
                    </div>
                    <div class="col-md-3">Progress
                        <div class="sub">
                        	<div class="progress_menu"><a href="<%=request.getContextPath()%>/member/dailyLog">일일 기록</a></div>
                            <div class="progress_menu"><a href="">주간 실천 현황</a></div>
                            <div class="progress_menu"><a href="<%=request.getContextPath()%>/member/monthlyTrend">월간 실천 현황</a></div>
                            <div class="progress_menu"><a href="">My Data</a></div>
                            <div class="progress_menu"><a href="<%=request.getContextPath()%>/gallary/list">눈바디</a></div>
                        </div>
                    </div>
                    <div class="col-md-3">Community
                        <div class="sub">
                            <div class="community_menu"><a href="<%=request.getContextPath()%>/board/boardList">자유게시판</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <% if(loginMember!=null){ %>
            	<div id="profile_area" class="col-md-3"><img src="<%=request.getContextPath()%>/Resource/img/blankProfile.png" style="border-radius:100%;"></div>
            <%}else{ %>
            	<div id="login_area" class="col-md-3">
            		<span onclick="login();">&#9786;로그인</span>
            	</div>
            <%} %>
            
        </div>
		<div id="aside_content" class="row">
      	  <div id="content_container" class="col-md-10">
                <!-- 이 위까지 header -->