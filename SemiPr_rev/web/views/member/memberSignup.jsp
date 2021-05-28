<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberSignup.css">
<div id="logo">
	<h2>ForMuscle</h2>
</div>

<form action="<%=request.getContextPath()%>/memberSignup" method="post">
	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="content">

			<!-- ID -->
			<div>
				<h3 class="join_title">
					<label for="userId">아이디</label>
				</h3>
				<div id="wrap-idchk">
					<span class="box int_id" style="width: 100%;"> <input
						type="text" id="userId_" name="userId" class="int" maxlength="12" placeholder="아이디"
						style="width: 100%; HEIGHT: 100%"></span> <input type="hidden"
						name="idDuplication" value="idUncheck">
				</div>
				<button type="button" id="id-chk" onclick="fn_duplicateId();"
					value="아이디 중복확인" style="width: 110px; HEIGHT: 25px">아이디중복확인</button>
				<span class="error_next_box"></span>
			</div>

			<!-- PW1 -->
			<div>
				<h3 class="join_title">
					<label for="pswd1">비밀번호</label>
				</h3>
				<span class="box int_pass"> <input type="password" id="pswd1" name="password" placeholder="비밀번호"
					class="int" maxlength="16"> <span id="alertTxt">사용불가</span>

				</span> <span class="error_next_box"></span>
			</div>

			<!-- PW2 -->
			<div>
				<h3 class="join_title">
					<label for="pswd2">비밀번호 재확인</label>
				</h3>
				<span class="box int_pass_check"> <input type="password"
					id="pswd2" class="int" maxlength="16">

				</span> <span class="error_next_box"></span>
			</div>
				<!-- EMAIL -->
			<div>
				<h3 class="join_title">
					<label for="email">본인확인 이메일<span class="optional"></span></label>
				</h3>
				<span class="box int_email"> <input type="text" id="email" name="email"
					class="int" maxlength="100" placeholder="이메일입력">
				</span> <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
			</div>
			<!-- NAME -->
			<div>
				<h3 class="join_title">
					<label for="name">이름</label>
				</h3>
				<span class="box int_name"> <input type="text" id="name_" name="name" placeholder="이름"
					class="int" maxlength="20">
				</span> <span class="error_next_box"></span>
			</div>
	
				<!--NickName -->
			<div>
				<h3 class="join_title">
					<label for="Nickname">닉네임</label>
				</h3>
				<span class="box int_Nickname"> <input type="text" id="nickName_" name="nickName" placeholder="닉네임"
					class="int" maxlength="12">
				</span> <span class="error_next_box"></span>
			</div>
				<button type="button" id="Nick-chk" onclick="fn_duplicateNick();"
					value="닉네임 중복확인" style="width: 110px; HEIGHT: 25px">닉네임중복확인</button>
				<span class="error_next_box"></span>
	
			<!-- BIRTH -->
			<div>
				<h3 class="join_title">
					<label for="yy">생년월일</label>
				</h3>

				<div id="bir_wrap">
					<!-- BIRTH_YY -->
					<div id="bir_yy">
						<span class="box"> <input type="text" id="yy" class="int"
							maxlength="4" placeholder="년(4자)">
						</span>
					</div>

					<!-- BIRTH_MM -->
					<div id="bir_mm">
						<span class="box"> <select id="mm" class="sel">
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
					<div id="bir_dd">
						<span class="box"> <input type="text" id="dd" class="int"
							maxlength="2" placeholder="일">
						</span>
					</div>

				</div>
				<span class="error_next_box"></span>
			</div>

			<!-- GENDER -->
			<div>
				<h3 class="join_title">
					<label for="gender">성별</label>
				</h3>
				<span class="box gender_code"> <select id="gender"
					class="sel">
						<option>성별</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
				</select>
				</span> <span class="error_next_box">필수 정보입니다.</span>
			</div>

		

			<!-- MOBILE -->
			<div>
				<h3 class="join_title">
					<label for="phoneNo">휴대전화</label>
				</h3>
				<span class="box int_mobile"> <input type="tel" id="mobile"
					class="int" maxlength="11" placeholder="(-)하이픈 없이 입력">
				</span> <span class="error_next_box"></span>
			</div>

				<!-- height -->
			<div>
				<h3>키</h3>

				<span> <input type="text" id="height" placeholder="키 입력"
					maxlength="3"></span> <span class="sta_height">cm</span>


			<!-- weight-->

				<h3>체중</h3>

				<span> <input type="text" id="weight" placeholder="체중 입력"
					maxlength="3"></span> <span class="sta_weight">Kg</span>

			</div>

			<div id="profile2-wrap">
				<h3>프로필 사진</h3>
				<input type="file" id="image" accept="image/*"
					onchange="setThumbnail(event);" multiple />
				<div id="image_container"></div>


			</div>
			<!-- JOIN BTN-->
			<div class="btn_area">
				<button type="submit" id="btnJoin">
					<span>가입하기</span>
				</button>
			</div>
			<!-- content-->
		</div>

		<!-- wrapper -->
	</div>
</form>
<form name="duplicateFrm" action="" method="post">
	<input type="hidden" name="userId">
	<input type="hidden" name="nickName">
</form>







<script>
const fn_duplicateNick=()=>{
	const status="width=350px,height=250px, left=500px, top=500px";
	const title="duplicateNick";
	const url="<%=request.getContextPath()%>/views/member/checkDuplicateNick.jsp";
	
	open("",title,status);
	console.log(duplicateFrm.nickName);
	duplicateFrm.nickName.value=$("#nickName_").val();
	duplicateFrm.target=title;
	duplicateFrm.action=url;
	duplicateFrm.submit();
}



const fn_duplicateId=()=>{
	const status="width=300px,height=250px,left=500px,top=500px";
	const title="duplicateId";
	const url="<%=request.getContextPath()%>/views/member/checkDuplicateId.jsp";
	
	open("",title,status);
	duplicateFrm.userId.value=$("#userId_").val();
	duplicateFrm.target=title;
	duplicateFrm.action=url;
	duplicateFrm.submit();
	

}


function setThumbnail(event) { 
	var reader = new FileReader(); reader.onload = function(event) {
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); 
		};
		
		reader.readAsDataURL(event.target.files[0]); 
		}




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

var gender = document.querySelector('#gender');

var email = document.querySelector('#email');

var mobile = document.querySelector('#mobile');

var error = document.querySelectorAll('.error_next_box');

userId_.addEventListener("change", checkId);
pw1.addEventListener("change", checkPw);
pw2.addEventListener("change", comparePw);
userName.addEventListener("change", checkName);
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
mobile.addEventListener("change", checkPhoneNum);


/*콜백 함수*/


function checkId() {
    var idPattern = /[a-zA-Z0-9_-]{5,20}/;
    if(id.value === "") {
        error[0].innerHTML = "필수 정보입니다.";
        error[0].style.display = "block";
    } else if(!idPattern.test(id.value)) {
        error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
        error[0].style.display = "block";
    } else {
        error[0].innerHTML = "멋진 아이디네요!";
        error[0].style.color = "#08A600";
        error[0].style.display = "block";
    }
}

function checkPw() {
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
        pwImg1.src = "m_icon_safe.png";
    }
}

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

function checkPhoneNum() {
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

    
}

function checkPw() {
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
}
    </script>

<%@ include file="/../views/common/footer.jsp"%>