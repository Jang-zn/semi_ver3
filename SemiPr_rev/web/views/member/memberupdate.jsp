<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<%@ page import="com.semi.member.model.vo.Member" %>
<%
 	Member m=(Member)request.getAttribute("m");
%>
<%-- <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberSignup.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/02memberSignup.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/font.css">
<input type="hidden" name="date" value="<%=m.getBirth()%>">
<div id="logo" class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<h2>ForMuscle</h2>
	</div>
	<div class="col-md-4"></div>
</div>


<div class="row">
	<div class="col-md-4"></div>
	
	<div class="col-md-4">	
		<form name="insertform" action="<%=request.getContextPath()%>/member/memberinfoupdateEnd?memberid=<%=m.getMemberId() %>" method="post" enctype="multipart/form-data" style="border:none;">
			

			<!-- content-->
			<div id="content" class="row">


				<!-- ID -->
				<div class="row">
					<div class="join_title col-md-12">
						<label for="id">아이디</label>
					</div>
					<div class="col-md-12">
						<div class="box int_id col-md-12"> 
							<input type="text" id="userId_" name="userId" class="int" maxlength="13" placeholder="아이디" readonly value="<%=m.getMemberId()%>">
						</div>
						<div id="idCheck" class="col-md-12">
							<input type="hidden" name="idDuplication" value="idUncheck">
						</div>
						<div class="error_next_box col-md-12"></div>
					</div>
				<div class="error_next_box"></div>
				</div>


				<!-- PW1 -->
				<div class="row">
					<div class="join_title col-md-12">
						<label for="pswd1">비밀번호</label>
					</div>
					<div class="col-md-12">
						<div class="box int_pass col-md-12"> 
							<input type="password" id="pswd1" name="password" placeholder="비밀번호" class="int" maxlength="16"> 
						</div> 
						<div id="pw-chk" class="col-md-12"></div>
					</div>
				</div>


				<!-- PW2 -->
				<div class="row">
					<div class="join_title col-md-12">
						<label for="pswd2">비밀번호 재확인</label>
					</div>
					<div class="col-md-12">
						<div class="box int_pass_check col-md-12"> 
							<input type="password" id="pswd2" class="int" maxlength="16">
						</div> 
						<div id="pw-chk2" class="col-md-12"></div>
					</div>
				</div>

					
				<!-- EMAIL -->
				<div class="row">
					<div class="join_title col-md-12">
						<label for="email">이메일</label>
					</div>
					<div class="col-md-12">
						<div class="box int_email col-md-12""> 
							<input type="text" id="email" name="email" class="int" maxlength="50" placeholder="이메일입력" value="<%=m.getEmail()%>">
						</div> 
						<div class="error_next_box col-md-12">
							
						</div>
					</div>
					<div id="email_chk" class="col-md-12"> </div>
					<div class="col-md-12">
						<div id="email-chk"	class="col-md-4" value="이메일 인증" onclick="emailCheck(insertform.email.value);" >
							이메일 인증
						</div>
					</div>				
				</div>
		


				<!-- NAME -->
				<div class="row">
					<div class="join_title col-md-12">
						<label for="name">이름</label>
					</div>
					<div class="col-md-12">
						<div class="box int_name col-md-12"> 
							<input type="text" id="name" name="name" class="int" maxlength="12" required value="<%=m.getName()%>">
						</div> 
						<div class="error_next_box col-md-12"></div>
					</div>
				</div>
			
			
				<!--NickName -->
				<div class="row">
					<div class="join_title col-md-12">
							<label for="name">닉네임</label>
					</div>
					<div class="col-md-12"> 
						<div class="box int_Nickname col-md-12"> 
							<input type="text" id="nickName_" name="nickName" placeholder="닉네임" class="int" maxlength="12" required value="<%=m.getNickname()%>">
							
						</div>
					</div> 
					<div class="error_next_box col-md-12"></div>
					<div id="nickCheck" class="col-md-12"></div>
					<div class="error_next_box col-md-12"></div>
				</div>
				
				
				<!-- BIRTH -->
				<div class="row">
					<div class="join_title col-md-12">
						<label for="yy">생년월일</label>
					</div>				
					<div id="bir_wrap" class="col-md-12">
						<!-- BIRTH_YY -->
						<div id="bir_yy" class="col-md-4">						
							<div class="box02 col-md-12"> 
								<input type="text" id="yy" class="int" name="yy" maxlength="4" placeholder="년(4자)" required value="">
							</div>
						</div>

						<!-- BIRTH_MM -->
						<div id="bir_mm" class="col-md-4">
							<div class="box02 col-md-12"> 
								<select id="mm" class="sel" name="mm" required style="width:100%; height:100%" value="">
									<option>월</option>
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
							</div>
						</div>


						<!-- BIRTH_DD -->
						<div id="bir_dd" class="col-md-4">
							<div class="box02 col-md-12"> 
								<input type="text" id="dd" class="int" name="dd" maxlength="2" placeholder="일" required>
							</div>
						</div>					
					</div>
					<div class="error_next_box"></div>
				</div>


				<!-- GENDER -->
				<div class="row">
					<div class="join_title col-md-12">
						<label for="gender">성별</label>
					</div>
					<div class="col-md-12">
						<div class="box gender_code col-md-12"> 
							<select id="gender" name="gender" required class="sel" style="width:100%; height:100%">
								<option>성별</option>
								<option value="M" <%=m.getGender()!=null&&m.getGender().equals("M")?"selected":"" %>>남자</option>
								<option value="F" <%=m.getGender()!=null&&m.getGender().equals("F")?"selected":"" %>>여자</option>
							</select>
						</div> 
						<div class="error_next_box col-md-12">
						</div>
					</div>
				</div>

		
				<!-- MOBILE -->
				<div class="row">
					<div class="join_title col-md-12">
						<label for="phoneNo">휴대전화</label>
					</div>
					<div class="col-md-12">
						<div class="box int_mobile col-md-12"> 
							<input type="tel" id="mobile" name="phone" class="int"  placeholder="(-)하이픈 없이 입력" required value="<%=m.getPhone()%>">
						</div> 
						<div class="error_next_box col-md-12"></div>
					</div>
				</div>


					<!-- height -->
				<div class="row">
					<div class="join_title col-md-12">
						<label>키</label>
					</div>
					<div class="col-md-12">
						<div class="box int_mobile col-md-11">
							<input type="text" id="height" placeholder="키 입력" name="height" maxlength="3" required value="<%=m.getHeight()%>">
						</div>
						<div class="col-md-1">
							<div class="sta_height col-md-12">cm</div>
						</div>
					</div>
				</div>


				<!-- weight-->
				<div class="row">
					<div class="join_title col-md-12">
						<label>체중</label>
					</div>
					<div class="col-md-12">
						<div class="box int_mobile col-md-11">
							<input type="text" id="weight" placeholder="체중 입력" name="weight" required maxlength="3" value="<%=m.getWeight()%>">
						</div>
						<div class="col-md-1">
							<div class="sta_weight col-md-12">kg</div>
						</div>
					</div>
				</div>
			
			
				<!-- 프로필 사진 -->
				<div class="row">
					<div class="join_title col-md-12">
						<label>프로필 사진</label>
					<!-- onchange="setThumbnail(event);" -->
					</div>
					<input type=hidden name="old_file" value="<%=m.getProfileImg()%>">
					<div class="col-md-12"><input type="file" id="image" name="userProfile"/></div>
					<div id="image_container" class="col-md-12"><%=m.getProfileImg()!=null?"이미 등록된 사진이 있습니다":"아직프로필사진을 등록하지 않"%></div>
					<!-- <button class="btn-delete">삭제</button> -->
					<div id="btn-container" class="col-md-12"></div>
				</div>
			

				<!-- JOIN BTN-->
				<div class="btn_area row">
					<div class="col-md-12">
						<button type="submit" id="btnJoin">
							수정하기
						</button>
					</div>
				</div>
			</div>
			<!-- content-->

		</form>
	</div>
	<div class="col-md-4"></div>
</div>
<form name="duplicateFrm" action="" method="post">
	<input type="hidden" name="email" id="id">
	<input type="hidden" name="nickName">
</form>


<script>



/* function checkPhoneNum() {
    var isPhoneNum = /([01]{2,})([01679]{1,})([0-9]{3,4})([0-9]{4})/;

    if(mobile.value === "") {
        error[7].innerHTML = "필수 정보입니다.";
        error[7].style.display = "block";
    } else if(!isPhoneNum.test(mobile.value)) {
        error[7].innerHTML = "형식에 맞지 않는 번호입니다.";
        error[7].style.display = "block";
    } else {
        error[7].style.display = "none";
    }

    
} */

/* function checkPw() {
    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(pw1.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        pwMsg.style.display = "block";
        pwMsgArea.style.paddingRight = "40px";
       
        error[1].style.display = "block";
    } else if(!pwPattern.test(pw1.value)) {
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
        pwMsg.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
        error[1].style.display = "block";
        pwMsg.style.color = "red";
        pwMsg.style.display = "block";
      
    } else {
        error[1].style.display = "none";
        pwMsg.innerHTML = "안전";
        pwMsgArea.style.paddingRight = "93px";
        pwMsg.style.color = "#03c75a";
        pwMsg.style.display = "block";
       
    }
} */
    </script>
    
    <script>
    	let date=$("input[name=date]").val();
    	let datearr=date.split("-");
    	$("input[name=yy]").val(datearr[0]);
    	$("select[name=mm]").val(datearr[1]);
    	$("input[name=dd]").val(datearr[2]);
    	
    	$("select[name=gender]").val(<%=m.getGender()%>);

         
    	
    </script>

<%@ include file="/../views/common/footer.jsp"%>