<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/../views/common/header.jsp"%>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    
	<div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <img src="dummyImage.png"  alt="" style="width: 100%; height:45rem">
            </div>
        </div>        
    </div>
    
    <br>
    <br>
    
    <div class="container">
        <!-- 카테고리 버튼 -->
        <div class="row">
            <div class="col-md-2">버튼 1</div>
            <div class="col-md-2">버튼 2</div>
            <div class="col-md-2">버튼 3</div>
        </div>
        <br><br>

        <!-- 주간 달성 현황 -->
        <div class="row">
            <div class="col-md-10"> 그래프</div>
            <div class="col-md-2"> 
                <!-- 항목 -->
                <div class="row">
                    <div class="col-md-12">운동</div>
                </div>
                <div class="row">
                    <div class="col-md-12">식단</div>
                </div>
                <div class="row">
                    <div class="col-md-12">체중</div>
                </div>
                <div class="row">
                    <div class="col-md-12">체지방량</div>
                </div>
                <div class="row">
                    <div class="col-md-12">골격근량</div>
                </div>
                <div class="row">
                    <div class="col-md-6"><a>공유하기 버튼</a></div>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- Trend 입력 -->
        </div>

    </div>



	<!-- 참고용 임시 css스타일 -->
	<style>
        .btn{
            background-color: orangered;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: bold;
            color: white;
        }
        .photo01{
            background-color: lightgrey !important;
        } 
        .content01{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 2.3rem;
            padding-bottom: 2rem;
        }
        .content02{
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 1.7rem;
        }
        .title01{
            font-family: "Press Start 2P" ;    
            font-size: 1.9rem; 
            padding-bottom: 1rem;               
        }

        #header_container{
            font-family: "Press Start 2P";
            color: white;
            background-color: black !important;
            font-size: 1.3rem;
            line-height: 50px;
            text-align: center;
            font-weight: 700;
        }    
        .container{
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left:auto;
        }        
        .container-fluid{
            margin-right: auto;
            margin-left: auto;
            background: lightgrey;
        }

        [class|="col"] {
        /* background: #2db34a; */
        border: 1px solid red;
        height: fit-content;        
        }

    </style>


<%@ include file = "/../views/common/footer.jsp"%>