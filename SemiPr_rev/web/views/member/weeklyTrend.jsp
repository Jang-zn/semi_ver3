<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/../views/common/header.jsp"%>
	
	<!-- 부트스트랩 확인용-->
	<!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	
	
	<!--------------- 배너 ---------->
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
            <div class="col-md-3">
                n월 n주 달성 현황
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-2">운동</div>
                    <div class="weeklyLog">
                        <div class="col-md-1"><a>월</a></div>
                        <div class="col-md-1"><a>화</a></div>
                        <div class="col-md-1"><a>수</a></div>
                        <div class="col-md-1"><a>목</a></div>
                        <div class="col-md-1"><a>금</a></div>
                        <div class="col-md-1"><a>토</a></div>
                        <div class="col-md-1"><a>일</a></div>
                    </div>
                    <div class="col-md-3">연속 n일 달성</div>
                </div>
            </div>  
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-2">식단</div>
                    <div class="weeklyLog">
                        <div class="col-md-1"><a>월</a></div>
                        <div class="col-md-1"><a>화</a></div>
                        <div class="col-md-1"><a>수</a></div>
                        <div class="col-md-1"><a>목</a></div>
                        <div class="col-md-1"><a>금</a></div>
                        <div class="col-md-1"><a>토</a></div>
                        <div class="col-md-1"><a>일</a></div>
                    </div>                    

                    <div class="col-md-3">연속 n일 달성</div>
                </div>
            </div>         
        </div>
        <br><br><br>

        <!-- 일일 계획 -->
        <div class="row">
            <div class="col-md-6">
                <!-- 운동 -->
                <div class="row">
                    <div class="col-md-4">날짜</div>
                    <div class="col-md-4">운동 계획</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        항목들
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        예상 소요 시간
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4"><button onclick="">달성 확인 버튼</button></div>
                </div>
            </div>
            <div class="col-md-6">
                <!-- 식단 -->
                <div class="row">
                    <div class="col-md-4">날짜</div>
                    <div class="col-md-4">식단 계획</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        항목들
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                     전체 kcal
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4"><button onclick="">달성 확인 버튼</button></div>
                </div>
            </div>
            <br><br><br><br><br><br>

            <!-- 주간 통계 -->
            <div class="col-md-6">
                <!-- 운동 -->
                <div class="row">
                    <div class="col-md-6">이번주 많이 한 운동 5</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">1</div>
                            <div class="col-md-12">2</div>
                            <div class="col-md-12">3</div>
                            <div class="col-md-12">4</div>
                            <div class="col-md-12">5</div>
                        </div>
                    </div>
                </div>                    
            </div>
            <div class="col-md-6">
                <!-- 식단 -->
                <div class="row">
                    <div class="col-md-6">식단 분석</div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        통계
                    </div>
                </div> 
            </div>
                

        </div>

    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
     
     
     <!-- 참고용 임시 style -->
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