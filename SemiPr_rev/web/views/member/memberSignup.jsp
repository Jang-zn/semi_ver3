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
		<form name="insertform" action="<%=request.getContextPath()%>/member/memberSignup" method="post" enctype="multipart/form-data"  style="border:none;">
			

			<!-- content-->
			<div id="content" class="row">


				<!-- ID -->
				<div class="row">
					<div class="join_title col-md-12">
						<label for="id">아이디</label>
					</div>
					<div class="col-md-12">
						<div class="box int_id col-md-12"> 
							<input type="text" id="userId_" name="userId" class="int" maxlength="13" placeholder="아이디" required>
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
							<input type="password" id="pswd1" name="password" placeholder="비밀번호" class="int" maxlength="16" required> 
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
							<input type="password" id="pswd2" class="int" maxlength="16" required>
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
							<input type="text" id="email" name="email" class="int" maxlength="50" placeholder="이메일입력">
						</div> 
						<div class="error_next_box col-md-12">
							
						</div>
					</div>
					<div id="email_chk" class="col-md-12"> </div>
					<div class="col-md-12">
						<div class="col-md-4" id="email-chk" >
						<button type="button" id="emailbtn"  onclick="emailCheck();" >이메일 인증</button>
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
							<input type="text" id="name" name="name" class="int" maxlength="12" required>
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
							<input type="text" id="nickName_" name="nickName" placeholder="닉네임" class="int" maxlength="12" required>
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
								<input type="text" id="yy" class="int" name="yy" maxlength="4" placeholder="년(4자)" required>
							</div>
							<div class="col-sm-12" id="yyError"></div>
						</div>

						<!-- BIRTH_MM -->
						<div id="bir_mm" class="col-md-4">
							<div class="box02 col-md-12"> 
								<select id="mm" class="sel" name="mm" required style="width:100%; height:100%">
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
							<div class="col-sm-12" id="mmError"></div>
						</div>


						<!-- BIRTH_DD -->
						<div id="bir_dd" class="col-md-4">
							<div class="box02 col-md-12"> 
								<input type="text" id="dd" class="int" name="dd" maxlength="2" placeholder="일" required>
							</div>
							<div class="col-sm-12" id="ddError"></div>
						</div>					
					</div>
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
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
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
							<input type="tel" id="mobile" name="phone" class="int"  placeholder="(-)하이픈 없이 입력" required>
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
							<input type="text" id="height" placeholder="키 입력" name="height" maxlength="3" required>
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
							<input type="text" id="weight" placeholder="체중 입력" name="weight" required maxlength="3">
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
					<div class="col-md-12"><input type="file" id="image" accept="image/*" name="userProfile"/></div>
					<div id="image_container" class="col-md-12"></div>
					<!-- <button class="btn-delete">삭제</button> -->
					<div id="btn-container" class="col-md-12"></div>
				</div>
			

				<!-- JOIN BTN-->
				<div class="btn_area row">
					<div class="col-md-12">
						<button type="submit" id="btnJoin" onsubmit="return emailAuthCheck(); yearCheck(); monthCheck(); dayCheck();">
							가입하기
						</button>
					</div>
				</div>			</div>
			<!-- content-->

		</form>
	</div>
	<div class="col-md-4"></div>
</div>
<form name="duplicateFrm" action="" method="post">
	<input type="hidden" name="email22" id="id" >
	<input type="hidden" name="nickName">
</form>


<script>


//<------------------------------ 아이디 시작 ---------------------------->
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
	
//	<--------------------------------- 아이디 끝 -------------------------------->
	
	








//	<------------------------------ 패스워드 시작 ---------------------------->
	
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
		}else{
			$("#pw-chk2").css('color','green');
			$("#pw-chk2").html("비밀번호가 일치합니다.");
		}
	})
    
//	<------------------------------ 패스워드 끝 ---------------------------->


	
	
	
	
	
	
	
	
//	<------------------------------ 전화번호 시작 ---------------------------->
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
//<------------------------------ 전화번호 끝 ---------------------------->	











//<------------------------------ 이메일 시작 ---------------------------->

	function emailCheck(){
		var email = $("#email").val();
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/member/emailAuth",
			async : "false",
			data : {
				"email":email
			},
			
			success : function(data){
				if(data == "fail"){
					alert("정확한 이메일 주소를 입력 후 다시 시도해주세요.");
				}else{
				alert("인증 메일 전송 완료");
				var text = $("<p>인증 코드 : </p>");
				var inputAdd = $("<input class='inputAdd' type='text'>");
				var btnAdd =$("<button class='btnAdd' type='button'>확인</button>");
				if($('.btnAdd').length == 0){//버튼 한 개만 생성하게 만들기 
				$("#email-chk").append(text);
				$("#email-chk").append(inputAdd);
				$("#email-chk").append(btnAdd);
				}
				btnAdd.click(e=>{
					emailAuthCheck();
				});
			}
				
			},error: function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"er");
			}
			
		})
	}
	
var isAuth = false;
	function emailAuthCheck(){
		var emailAuth = $(".inputAdd").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/member/signUpemailAuth",
		data : {
			"email" : emailAuth
		},
		success : function(data){
			console.log(data);
			if(data == "Good"){
				alert("인증 성공완료");
				isAuth =true;
			}else if(data == "Bad"){
			alert("인증 실패");
			isAuth=false;
			}else{
				isAuth=false;
			}
		}
	});		
}
	
	$("#btnJoin").click(function emailAuthCheck(){
		console.log(isAuth);
		if(isAuth==false){
			alert("메일 인증이 완료되지 않았습니다.");
			return false;
		}else
			return true;
	});




$("#email").blur("propertychange change keyup paste input",function(email){
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = $("#email").val()
	var email2 = email.replace(/(\s*)/g, "");
	    if(!emailReg.test(email2)){
	        alert("이메일 주소를 정확하게 입력해주세요.");
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
					$("#emailbtn").attr("disabled",true);
					
				}else{
					$("#email_chk").css('color','blue')
					$("#email_chk").html("사용할 수 있는 이메일입니다.")
					$("#emailbtn").attr("disabled",false);
				}
				
				}
			})
	    }
	})

//	<------------------------------ 이메일 끝 ---------------------------->

//number 최대길이 설정
function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
    }
}



$("#nickName_").blur(function(){
	var isNickname = /^[가-힣ㄱ-ㅎa-zA-Z0-9._-]{2,13}\$/; 
	var nickName =$('#nickName_').val();
	var nickName2 = nickName.replace(/(\s*)/g, ""); //모든 공백제거
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


//<---------------------------------------- 생년월일 시작 ------------------------------------------>
var yyCheck = false;


const yearCheck=()=>{
$("#yy").blur(function(){
	var yearPattern = /[0-9]{4}/;
	var toyear = 1997;
	var year = $("#yy").val();
	 x = (toyear - year) % 12	// x값을 구합니다.
	console.log(year)
	if(year<1900 || !yearPattern.test(year)){
			$("#yyError").css('color','red');
			$("#yyError").html('출생년도 4자리 확인 혹은 1900년미만 출생자들은 가입이 제한됩니다.');
			alert("가입 불가합니다."); 	  
			return false;
			 //함수밖에 변수 만들고false값 준다.
		  }else if((x == 1) || (x == -11)){
			    	$("#yyError").css('color','green');
			 		$("#yyError").html('쥐띠시네요 ');     }
			         else  {
			          if (x == 0)             {
			        	  $("#yyError").css('color','green');
					 		$("#yyError").html('소띠시네요 ');           }
			          else  {
			           if ((x == 11) || (x == -1)) {
			        	   $("#yyError").css('color','green');
					 		$("#yyError").html('호랑이띠시네요 ');           }
			           else  {
			            if ((x == 10) || (x == -2)) {
			            	$("#yyError").css('color','green');
					 		$("#yyError").html('토끼띠시네요 ');      }
			            else  {
			             if ((x == 9) || (x == -3))  {
			            	 $("#yyError").css('color','green');
						 		$("#yyError").html('용띠시네요 ');       }
			             else  {
			              if ((x == 8) || (x == -4))  { 
			            	  $("#yyError").css('color','green');
						 		$("#yyError").html('뱀띠시네요 ');           }
			              else  {
			               if ((x == 7) || (x == -5))  { 
			            	   $("#yyError").css('color','green');
						 		$("#yyError").html('말띠시네요 ');        }
			               else  {
			                if ((x == 6) || (x == -6))  { 
			                	$("#yyError").css('color','green');
						 		$("#yyError").html('양띠시네요 ');       }
			                else  {
			                 if ((x == 5) || (x == -7))  {  
			                	 $("#yyError").css('color','green');
			 			 		$("#yyError").html('원숭이띠시네요 ');       }
			                 else  {
			                  if ((x == 4) || (x == -8))  {
			                	  $("#yyError").css('color','green');
			  			 		$("#yyError").html('닭띠시네요 ');      }
			                  else  {
			                   if ((x == 3) || (x == -9))  {
			                	   $("#yyError").css('color','green');
			   			 		$("#yyError").html('개띠시네요 ');       }
			                   else  {
			                    if ((x == 2) || (x == -10))  {
			                    	$("#yyError").css('color','green');
			    			 		$("#yyError").html('돼지띠시네요 ');              }  
			                    return true;
			                   }
			                  }
			                 }
			                }
			               }
			              }
			             }
			            }
			           }
		  			  }
			         }
				});
}
var mmCheck=false;
const monthCheck=()=>{
$("#mm").blur(function(){
	var month = $("#mm").val();
	console.log(month);
	if(month=="월"){
		$("#mmError").css('color','red');
		$("#mmError").html('태어난 월을 선택해주세요.');
		return false;
	}else {
		$("#mmError").css('color','green');
		$("#mmError").html('좋은 달에 태어나셨군요.');
		return true;
	}
})
}

var ddCheck=false;
const dayCheck=()=>{
 $("#dd").blur(function(){
	 var dayPattern = /[0-3]{1,}[0-9]{1}/;
	 
	 var day = $("#dd").val();
	 if(day>32 || !dayPattern.test(day)){
		$("#ddError").css('color','red');
		$("#ddError").html('세상에 존재하지 않는 날짜입니다.');
		return false;
			  
	 }else {
		$("#ddError").css('color','green');
		$("#ddError").html('좋은 날에 태어나셨군요. ');
		return true;
	 	}       
	})
}

//<---------------------------------------- 생년월일 끝 --------------------------------------------->








// <---------------------------------------- 프로필 시작 ---------------------------------------->


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



//<---------------------------------------- 프로필 끝 ------------------------------------------>



 </script>

<%@ include file="/../views/common/footer.jsp"%>