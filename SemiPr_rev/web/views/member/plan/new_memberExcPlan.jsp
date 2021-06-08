<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp"%>


<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberExcPlan.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/02memberExcPlan.css">
	<br>
	<div class=row>
		<div class="col-md-1"></div>
		<div id="sub_change" class="col-md-10">
		        <div class="btn col-md-2">운동 List</div>
		        <div class="btn col-md-2">나만의 운동 등록</div>
		        <div class="btn col-md-2">운동 등록하기(ADMIN)</div>
    	</div>
    </div>
    
    <div class=row>
    	<div class="col-md-1"></div>
	    <div id="list_container" class="col-md-10">
	        <div id="exc_list" class="col-md-5">
	            <div id="sort_container" class="row">
	                <div class="col-md-2">
	                	<select>
		                    <option id="chest" name="chest" value="가슴">가슴</option>
		                    <option id="back" name="back" value="등">등</option>
		                    <option id="lowerbody" name="lowerbody" value="하체">하체</option>
	                	</select>
	                </div>
	                <div class="btn col-md-2">인기 운동</div>
	            </div>
	            <br>
	            <div id="sort_list" class="row">
	            	<div class="border col-md-2"><img src=""><br><br><br><br></div>
	            	<div class="border col-md-10"><br>대충 운동이름<br> 대충 운동설명 <br> 어.. 암튼 암거나</div>
	            </div>
	            <div id="sort_list" class="row">
	            	<div class="border col-md-2"><img src=""><br><br><br><br></div>
	            	<div class="border col-md-10"><br>대충 운동이름<br> 대충 운동설명 <br> 어.. 암튼 암거나</div>
	            </div>
	            <div id="sort_list" class="row">
	            	<div class="border col-md-2"><img src=""><br><br><br><br></div>
	            	<div class="border col-md-10"><br>대충 운동이름<br> 대충 운동설명 <br> 어.. 암튼 암거나</div>
	            </div>
	            <div id="sort_list" class="row">
	            	<div class="border col-md-2"><img src=""><br><br><br><br></div>
	            	<div class="border col-md-10"><br>대충 운동이름<br> 대충 운동설명 <br> 어.. 암튼 암거나</div>
	            </div>
	            <div id="sort_list" class="row">
	            	<div class="border col-md-2"><img src=""><br><br><br><br></div>
	            	<div class="border col-md-10"><br>대충 운동이름<br> 대충 운동설명 <br> 어.. 암튼 암거나</div>
	            </div>
	            <div id="sort_list" class="row">
	            	<div class="border col-md-2"><img src=""><br><br><br><br></div>
	            	<div class="border col-md-10"><br>대충 운동이름<br> 대충 운동설명 <br> 어.. 암튼 암거나</div>
	            </div>
	            <div id="sort_list" class="row">
	            	<div class="border col-md-2"><img src=""><br><br><br><br></div>
	            	<div class="border col-md-10"><br>대충 운동이름<br> 대충 운동설명 <br> 어.. 암튼 암거나</div>
	            </div>
	            <div id="sort_list" class="row">
	            	<div id="pageBar" class="row" style="text-align:center;">
	            		◀ 1 2 3 4 5 6 7 8 ▶
	            	</div>
	            </div>
	            
	        </div>
	        <div id="exc_list_info" class="col-md-7">
	            <div id="exc_name" class="row">대충 운동이름</div>
	            <div id="exc_select" class="row">
	                <div id="exc_img" class="col-md-8"><img src=""></div>
	                <div class="col-md-1"></div>
	                <div id="exc_submit" class="col-md-3">
	                    <form action="" method="post">
	                        <select name="week">
	                            <option value="월">월</option>
	                            <option value="화">화</option>
	                            <option value="수">수</option>
	                            <option value="목">목</option>
	                            <option value="금">금</option>
	                            <option value="토">토</option>
	                            <option value="일">일</option>
	                        </select><br>
	                        <input type="number" name="weight" placeholder="kg"><br>
	                        <input type="number" name="reps" placeholder="횟수"><br>
	                        <input type="number" name="sets" placeholder="세트수"><br>
	                        <input type="submit" onclick="" value="등록하기">
	                    </form>
	                </div>
	            </div>
	            <div id="exc_detail_info_container" class="row">
	                <p>대충 운동정보</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	                <p>1</p>
	            </div>
	            <div id="exc_video" class="row">
					<a href="">대충 영상링크</a><br>
	                <p>아니면 영상 띄우기<p>
	                <a href="">대충 추가 정보 링크</a>
	            </div>
	        </div>
	    </div>
    </div>
<%@ include file = "/views/common/footer.jsp"%>
