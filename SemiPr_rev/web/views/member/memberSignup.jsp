<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<%-- <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberSignup.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/02memberSignup.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/font.css">
        
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
		
	<form name="insertform" action="<%=request.getContextPath()%>/member/memberSignup" method="post" onsubmit="return fn_invalidate" enctype="multipart/form-data" onsubmit="return fn_invalidate();">


			<!-- content-->
			<div id="content" class="row">

				<!-- ID -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="join_title">
							<label for="id">아이디</label>
						</h3>
					</div>
					<div class="col-md-12">
						<span class="box int_id"> <input
						type="text" id="userId_" name="userId" class="int" maxlength="13" placeholder="아이디" 
						style="width: 100%; height: 100%" required></span>
						<input type="hidden"
						name="idDuplication" value="idUncheck">
						 <span class="error_next_box"></span>
					</div>
					<div id="idCheck"></div>
				<span class="error_next_box"></span>
				</div>

				<!-- PW1 -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="join_title">
							<label for="pswd1">비밀번호</label>
						</h3>
					</div>
					<div class="col-md-12">
						<span class="box int_pass"> <input type="password" id="pswd1" name="password" placeholder="비밀번호"
					class="int" maxlength="16" required> 
						</span> 
						<div id="pw-chk"></div>
					</div>
				</div>

				<!-- PW2 -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="join_title">
							<label for="pswd2">비밀번호 재확인</label>
						</h3>
					</div>
					<div class="col-md-12">
						<span class="box int_pass_check"> <input type="password" 
							id="pswd2" class="int" maxlength="16" required>
						</span> 
						<div id="pw-chk2"></div>
					</div>
				</div>

					
				<!-- EMAIL -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="join_title">
							<label for="email">이메일</label>
						</h3>
					</div>
					<div class="col-md-12">
						<span class="box int_email"> <input type="text" id="email" name="email"
							class="int" maxlength="50" placeholder="이메일입력">
						</span> <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
					</div>
					<div id="email_chk"> </div>
					<div class="col-md-12">
						<button type="button" id="email-chk" 
					value="이메일 인증" style="width: 100px; height: 25px" onclick="emailCheck(insertform.email.value);" >이메일 인증</button>
					</div>				
				</div>
					</form>


				<!-- NAME -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="join_title">
							<label for="name">이름</label>
						</h3>
					</div>
					<div class="col-md-12">
						<span class="box int_name"> <input type="text" id="name" name="name"
							class="int" maxlength="12" required>
						</span> <span class="error_next_box"></span>
					</div>
				</div>
			
				<!--NickName -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="join_title">
							<label for="name">닉네임</label>
						</h3>
						<span class="box int_Nickname"> <input type="text"
							id="nickName_" name="nickName" placeholder="닉네임" class="int"
							maxlength="12" required>
						</span> <span class="error_next_box"></span>
					</div>
					<div id="nickCheck"></div>
					<span class="error_next_box"></span>
				</div>
				
				
			
			
				<!-- BIRTH -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="join_title">
							<label for="yy">생년월일</label>
						</h3>
					</div>				
					<div id="bir_wrap" class="col-md-12">
						<!-- BIRTH_YY -->
						<div id="bir_yy" class="col-md-4">						
							<span class="box02"> <input type="text" id="yy" class="int" name="yy"
								maxlength="4" placeholder="년(4자)" required>
							</span>
						</div>

						<!-- BIRTH_MM -->
						<div id="bir_mm" class="col-md-4">
							<span class="box02"> <select id="mm" class="sel" name="mm" required>
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
							</span>
						</div>

						<!-- BIRTH_DD -->
						<div id="bir_dd" class="col-md-4">
							<span class="box02"> <input type="text" id="dd" class="int" name="dd"
								maxlength="2" placeholder="일" required>
							</span>
						</div>					
					</div>
					<span class="error_next_box"></span>
				</div>

				<!-- GENDER -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="join_title ">
							<label for="gender">성별</label>
						</h3>
					</div>
					<div class="col-md-12">
						<span class="box gender_code"> <select id="gender" name="gender" required
							class="sel">
								<option>성별</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
						</select>
						</span> <span class="error_next_box">필수 정보입니다.</span>
					</div>
				</div>

		
				<!-- MOBILE -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="join_title">
							<label for="phoneNo">휴대전화</label>
						</h3>
					</div>
					<div class="col-md-12">
						<span class="box int_mobile"> <input type="tel" id="mobile" name="phone"
							class="int"  placeholder="(-)하이픈 없이 입력" required>
						</span> <span class="error_next_box"></span>
					</div>
				</div>


					<!-- height -->
				<div class="row">
					<div class="col-md-12">
						<h3>키</h3>
					</div>
					<div class="col-md-11 box03">
						<span> <input type="text" id="height" placeholder="키 입력" name="height"
							maxlength="3" required></span>
					</div>
					<div class="col-md-1">
						<span class="sta_height">cm</span>
					</div>
				</div>



				<!-- weight-->
				<div class="row">
					<div class="col-md-12">
						<h3>체중</h3>
					</div>
					<div class="col-md-11 box03">
						<span> <input type="text" id="weight" placeholder="체중 입력" name="weight" required
							maxlength="3"></span>
					</div>
					<div class="col-md-1">
						<span class="sta_weight">Kg</span>
					</div>
				</div>
			
				<!-- 프로필 사진 -->
				<div class="row">
					<div class="col-md-12">
						<h3>프로필 사진</h3>
						<input type="file" id="image" accept="image/*" name="userProfile"/>
					<!-- onchange="setThumbnail(event);" -->

					</div>
					<div id="image_container"></div>
					<!-- <button class="btn-delete">삭제</button> -->
					<div id="btn-container"></div>
				</div>
			

				<!-- JOIN BTN-->
				<div class="btn_area row">
					<div class="col-md-12">
						<button type="submit" id="btnJoin">
							<span>가입하기</span>
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
	<input type="hidden" name="userId">
	<input type="hidden" name="nickName">
</form>


<script>

//아이디 정규표현식

 	$("#userId_").blur(function(){
		var userId=$("#userId_").val();
		console.log(userId);
		var idPattern = /[a-zA-Z0-9_-]{5,13}/; //아이디 13자리까지 가능
		if(!idPattern.test(userId)){
			alert("5~13자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			userId="";
		}
		
	}); 
	
//아이디 중복 	
	$("#userId_").blur(function(userId){
	
			$.ajax({
				url:"<%=request.getContextPath()%>/member/idDuplication",
				type : "post",
				dataType:"text",
				data:{
					"userId":$("#userId_").val()
				},
				success:data=>{
					console.log(data);
					if(data=="fail"){
						$("#idCheck").css('color','red')
						$("#idCheck").html("사용할 수 없는 아이디입니다.")
					}else{
						$("#idCheck").css('color','green')
						$("#idCheck").html("아주 멋지네요!")
					}
				}
			})
	})
	
	
	
	
// 비밀번호 정규표현식 
	$("#pswd1").blur(function(){
    	var pw1 = $("#pswd1").val();
 		
    	console.log(pw1);
		var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
		if(pw1.trim().length==0){
			
			$("#pw-chk").css('color','red');
			$("#pw-chk").html("공백없이 패스워드를 입력하세요");
			
			
		}else if(!pwPattern.test(pw1)){
			alert("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			return;
		}else {
			$("#pw-chk").css('color','green');
			$("#pw-chk").html("아름다운 비밀번호입니다.");
		}
	});
	
	$("#pswd2").blur(function(){
		var pw1 = $("#pswd1").val();
		var pw2 = $("#pswd2").val();
		if(pw1 != pw2){
			$("#pw-chk2").css('color','red');
			$("#pw-chk2").html("비밀번호가 맞지않습니다. 다시 확인해주세요.");
		}
	})
    


	$("#mobile").blur(function(){
		var mobile = $("#mobile").val();
		console.log(mobile);
		 var isPhoneNum = /([01]{2,})-([0-9]{3,4})-([0-9]{4})/;
		 var isPhoneNum2 = /^\d{2,3}-\d{3,4}-\d{4}$/;
		 if(!isPhoneNum.test(mobile)&&!isPhoneNum2.test(mobile)) {
		        alert("잘못된 형식의 번호입니다.");
		        return;
		 }
	});
	
//전화번호 자동으로 하이픈 생성하기
$("#mobile").on('keyup',function(event){
	var value = $(this).val(),
		addValue = [];
	value = value.replace(/-/gi,'');

	if(value.length>=3){
		if(value.substring(0,2) == '02') {  //02로 시작하면
			addValue.push(value.substring(0,2));
		console.log(value);
			if(value.length>=3){
				var endKey = (value.length >= 10 ? 6 : 5); 
				addValue.push(value.substring(2, endKey));
				if(value.length>=6){
					if(value.length>=10){
						value = value.substring(0,10);
					}
					addValue.push(value.substring(endKey, value.length));
				}
			}
		}else{
			addValue.push(value.substring(0,3)); //010, 070 3글자로시작한다면
			if(value.length>=4){
				var endKey = (value.length>=11? 7 : 6);
				addValue.push(value.substring(3,endKey));
				if(value.length>=7){
					if(value.length>=11){
						value=value.substring(0,11);
					}
					addValue.push(value.substring(endKey,value.length));
				}
			}
		}
		$(this).val(addValue.join('-'));
  }	
});

//이메일이 입력되지 않고 이메일 인증버튼을 눌렀을 때 block

$("#email-chk").click(function(){
	var emailChk=$("#email-chk").val();
	if(emailChk == ""){
		alert("이메일을 입력 후 눌러주세요.");
	
		return;
	}
});



	//이메일 인증 창
 function emailCheck(email){
	 if(email == ""){
		 alert("이메일을 입력 후 눌러주세요.");
		 $("#email-chk").attr("disabled");
		 return;
	 } 
	console.log(email);
	let url="emailCheck.jsp?email="+email;
	open(url,"emailwindow","statusbar=no, scrollbar=no, menubar=no, width=400, height=200");
	
	<%-- location.assign("<%=request.getContextPath()%>/member/emailAuth?email="+email); --%>
	
}
//이메일 중복검사 ajax
$("#email").blur(function(email){
	 const email2 = $("#email").val();
	    if(email2 == ""){
	        alert("이메일을 입력해 주십시오");
	        return;
	    }else{
	$.ajax({
		url :"<%=request.getContextPath()%>/member/emailDuplication",
		type : 'post',
		dataType:"text",
		data:{
			"email":$('#email').val()
		},
		success:data=>{
				console.log(data);
				
				if(data=='fail'){
					$("#email_chk").css('color','red')
					$("#email_chk").html("사용할 수 없는 이메일입니다.")
					
				}else{
					$("#email_chk").css('color','blue')
					$("#email_chk").html("사용할 수 있는 이메일입니다.")
				}
				
				}
			})
	    }
	})


//number 최대길이 설정
function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
    }
}

//닉네임 중복검사 -> ajax로 교체할 예정
//onchange
$("#nickName_").blur(function(){
	var isNickname = /^(?!.*\.\.)(?!.*\.$)[^\W][\w.]{0,15}/; //인스타그램아이디 정규표현식 가운데 공백 제거추가필요
	var nickName =$('#nickName_').val();
	var nickName2 = nickName.replace(/(\s*)/g, "");
	console.log(nickName2); 
	console.log(nickName); 
	var nick = nickName.trim();
	
	if(nickName != nickName2){
		alert("공백없이 입력해주세요");
	}
	if(!isNickname.test(nickName2)){ 
		alert("잘못된 형식의 닉네임입니다.");
	     
		}else {
			$.ajax ({
				url:"<%=request.getContextPath()%>/member/nickNameDuplication",
				type : "post",
				dataType:"text",
				data:{
					
					"nickName":nickName2 //trim 처리하기
					
				},
				success:data=>{
					
					if(data=="fail"){
						$("#nickCheck").css('color','red')
						$("#nickCheck").html("이미 사용중인 닉네임입니다.")
					}else{
						$("#nickCheck").css('color','green')
						$("#nickCheck").html("아주 멋지네요!")
					}
				}
				})
		}
});


//프로필 사진 업데이트
function readInputFile(input){
	if(input.files){
		let reader = new FileReader();
		f=event.target.files[0]
		console.log(event.target.files[0].size);
		if(f.size>1024*1024*2){
			alert("2mb까지의 사지만 업데이트 할 수 있습니다.");
			return;
		}
			
		reader.onload = function(e){
			$("#image_container").html("<img src="+e.target.result+">");
		}
		reader.readAsDataURL(input.files[0]);
		
		
	}
}


//프로필 사진 미리보기 및 삭제버튼
$("#image").on('change',function(){
	readInputFile(this);
	
	var btnDel =$("<button class='btnDel' type='button'>삭제</button>");

	btnDel.click(e=>{
		$("#image_container").empty(); 
		$(".btnDel").remove();
	});
	if($('.btnDel').length == 0){//버튼 한 개만 생성하게 만들기 
	$("#btn-container").append(btnDel);
		
	}
});  //요소 생성시 중간에 값이 들어가므로 생성시에 이벤트를 걸어줘야 한다.

//등록 이미지 삭제 ( input file reset )






/* function setThumbnail(event) { 
	var reader = new FileReader(); reader.onload = function(event) {
		/* var img = document.createElement("img");  
		var btn = document.createElement("button");
		var btnText = document.createElement("삭제");
		btn.appendChild(btnText);
		img.setAttribute("src", event.target.result); 
		/* document.querySelector("div#image_container").appendChild(img); 
		$("#image").click(function(){
			$("#image_container").append("<image> </image>");
		})
		document.querySelector("div#image_container").appendChild(btn);
		};
		
		var f = event.target.files[0];
		if(!f.type.match("image*")){
			alert("이미지만 첨부할 수 있습니다.");
			$("#image").val();
			return;
		}
		
		if(f.size>1024*1024*2){
			alert("2mb까지의 사지만 업데이트 할 수 있습니다.");
			return;
		}
		
		
		reader.readAsDataURL(event.target.files[0]); 
	
		}
 */



var id = document.querySelector('#userId_');

var pw1 = document.querySelector('#pswd1');
var pwMsg = document.querySelector('#alertTxt');
var pwImg1 = document.querySelector('#pswd1_img1');

var pw2 = document.querySelector('#pswd2');
var pwImg2 = document.querySelector('#pswd2_img1');
var pwMsgArea = document.querySelector('.int_pass');

var userName = document.querySelector('#name_');

var yy = document.querySelector('#yy');
var mm = document.querySelector('#mm');
var dd = document.querySelector('#dd');
var pwMsg = document.querySelector('#alertTxt');

var gender = document.querySelector('#gender');

var email = document.querySelector('#email');

//var mobile = document.querySelector('#mobile');

var error = document.querySelectorAll('.error_next_box');



const fn_invalidate=()=>{
	
if(nickname.trim()==null){
	const nickname = $("#nickName_").val();
	alert("닉네임을 입력해주세요.");
	return false;
	}
}

/*id.addEventListener("change", checkId);
pw1.addEventListener("change", checkPw);
pw2.addEventListener("change", comparePw); */

yy.addEventListener("change", isBirthCompleted);
mm.addEventListener("change", isBirthCompleted);
dd.addEventListener("change", isBirthCompleted);
gender.addEventListener("change", function() {
    if(gender.value === "성별") {
        error[5].style.display = "block";
    } else {
        error[5].style.display = "none";
    }
})
email.addEventListener("change", isEmailCorrect);
//mobile.addEventListener("change", checkPhoneNum);


/*콜백 함수*/


/* function checkId() {
    var idPattern = /[a-zA-Z0-9_-]{5,20}/;
    if(id.value === "") {
        error[0].innerHTML = "필수 정보입니다.";
        error[0].style.display = "block";
    } else if(!idPattern.test(id.value)) {
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        error[0].style.display = "block";
    } else {
        error[0].innerHTML = "아주 멋지네요!";
        error[0].style.color = "#08A600";
        error[0].style.display = "block";
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
        alert("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
        pwMsg.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
        pwMsgArea.style.paddingTop = "250px";
        error[1].style.display = "block";
        pwMsg.style.color = "red";
        pwMsg.style.display = "block";
       
    } else {
        error[1].style.display = "none";
        pwMsg.innerHTML = "안전";
        pwMsgArea.style.paddingRight = "93px";
        pwMsg.style.color = "#03c75a";
        pwMsg.style.display = "block";
        pwImg1.src = "m_icon_safe.png";
    }
} */

function comparePw() {
    if(pw2.value === pw1.value) {
        
        error[2].style.display = "none";
    } else if(pw2.value !== pw1.value) {
        
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
    } 

    if(pw2.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
    }
}

function checkName() {
    var namePattern = /[a-zA-Z가-힣]/;
    if(userName.value === "") {
        error[3].innerHTML = "필수 정보입니다.";
        error[3].style.display = "block";
    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
        error[3].style.display = "block";
    } else {
        error[3].style.display = "none";
    }
}


function isBirthCompleted() {
    var yearPattern = /[0-9]{4}/;

    if(!yearPattern.test(yy.value)) {
        error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
        error[4].style.display = "block";
    } else {
        isMonthSelected();
    }


    function isMonthSelected() {
        if(mm.value === "월") {
            error[4].innerHTML = "태어난 월을 선택하세요.";
        } else {
            isDateCompleted();
        }
    }

    function isDateCompleted() {
        if(dd.value === "") {
            error[4].innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
        } else {
            isBirthRight();
        }
    }
}



function isBirthRight() {
    var datePattern = /\d{1,2}/;
    if(!datePattern.test(dd.value) || Number(dd.value)<1 || Number(dd.value)>31) {
        error[4].innerHTML = "생년월일을 다시 확인해주세요.";
    } else {
        checkAge();
    }
}

function checkAge() {
    if(Number(yy.value) < 1920) {
        error[4].innerHTML = "정말이세요?";
    } else if(Number(yy.value) > 2019) {
        error[4].innerHTML = "미래에서 오셨군요. ^^";
    } else if(Number(yy.value) > 2005) {
        error[4].innerHTML = "만 14세 미만의 어린이는 보호자 동의가 필요합니다.";
    } else {
        error[4].style.display = "none";
    }
}


function isEmailCorrect() {
    var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;

    if(email.value === ""){ 
        error[6].style.display = "none"; 
    } else if(!emailPattern.test(email.value)) {
        error[6].style.display = "block";
    } else {
        error[6].style.display = "none"; 
    }

}

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

<%@ include file="/../views/common/footer.jsp"%>