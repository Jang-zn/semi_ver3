<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "com.semi.member.model.vo.*" %>
<%
	Member loginMember = (Member)session.getAttribute("logged");
%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ForMuscle</title>
        <%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/header.css"> --%>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/02header.css">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/font.css">
        <script src="<%=request.getContextPath()%>/Resource/js/jquery-3.6.0.min.js"></script>
        <script src="<%=request.getContextPath()%>/Resource/js/chart.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        
        <link rel="shortcut icon" href="<%=request.getContextPath()%>/Resource/img/favicon.ico" type="image/x-icon">
		<link rel="icon" href="<%=request.getContextPath()%>/Resource/img/favicon.ico" type="image/x-icon">
		
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
        <div id="header_container" class="row container-fluid">
<!-- ?????? 3 -->
            <div id="logo_area" class="col-md-2"><img src="<%=request.getContextPath()%>/Resource/img/logo.png" onclick="location.assign('<%=request.getContextPath()%>')"></div>
<!-- ?????? -->
			<div class="col-md-1"></div>
<!-- ?????????(6) -->           	
            <div id="menu_container" class="col-md-6">
                <div id="menu_line" class="row">
                    <div class="col-md-3" onclick="location.assign('<%=request.getContextPath()%>/member/main')">
                       	My Page
                    </div>
                    <div class="col-md-3">Plan
                        <div class="sub">
                        	<div class="plan_menu"><a href="<%=request.getContextPath()%>/member/myList">My List</a></div>
                            <div class="plan_menu"><a href="<%=request.getContextPath()%>/member/excPlan?numPerpage=6">?????? ?????? ??????</a></div>
                            <div class="plan_menu"><a href="<%=request.getContextPath()%>/member/menuPlan?numPerpage=6">?????? ?????? ??????</a></div>
                        </div>
                    </div>
                    <div class="col-md-3">Progress
                        <div class="sub">
                        	<div class="progress_menu"><a href="<%=request.getContextPath()%>/member/dailyLog">?????? ??????</a></div>
                            <div class="progress_menu"><a href="<%=request.getContextPath()%>/member/weeklyTrend">?????? ?????? ??????</a></div>
                            <div class="progress_menu"><a href="<%=request.getContextPath()%>/member/monthlyTrend">?????? ?????? ??????</a></div>
                            <!-- <div class="progress_menu"><a href="">My Data</a></div> -->
                            <div class="progress_menu"><a href="<%=request.getContextPath()%>/gallary/list?numPerpage=6">?????????</a></div>
                        </div>
                    </div>
                    <div class="col-md-3">Community
                        <div class="sub">
                            <div class="community_menu"><a href="<%=request.getContextPath()%>/board/boardList?numPerpage=15">???????????????</a></div>
                        </div>
                    </div>
                </div>
            </div>
<!-- ????????? 3->1  -->            
            <% if(loginMember!=null){ %>
            	<div id="profile_area" class="col-md-3">
            		<div class="row">
            		<div class="col-md-1"></div>
            			<div class="col-md-6">
            				<div class="nickName"><%=loginMember.getNickname()%> ???</div> 
            			</div>
            			<div class="col-md-4">            				
            				<div class="logout" onclick="location.assign('<%=request.getContextPath()%>/member/logout')">????????????</div>
            			</div>
            			
            		</div>
            	</div>
            <%}else{ %>
            	<!-- <div class="col-md-1"></div> -->
            	<div id="login_area" class="col-md-3" onclick="login();">
            		login
            	</div>
            <%} %>            
        </div>
		<div class="container">
                <!-- ??? ????????? header -->