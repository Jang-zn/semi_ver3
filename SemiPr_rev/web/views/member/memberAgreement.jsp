<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/../views/common/header.jsp"%>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/memberAgreement.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/font.css">
	
	
	
	
	
   <div class="container">
    	<div class="row">
        	<div class="col-md-offset-5 col-md-2"><h1> </h1></div>
   		</div>
    
    
    <div class="row">
        <div class="col-md-offset-5 col-md-2"><h1>약관동의</h1></div>
    </div>

        <br>
	<section class="agreement-page">
		<form action="agreement" id="terms_form">
			<h2 class="agreement1  text-center">이용약관 (필수)</h2>
			<div class="box">
				<iframe class="inner-agreement"src="<%=request.getContextPath()%>/Resource/agreement/siteAgreement.html"></iframe>
					
			</div>
			
				<div class="row">
					<div class="col-xs-12 ag">
						<div class="text-center">
							<input type="radio" id="Agree01" name="Agree1" value="Y"> 
								<label class="agree-page" for="Agree01">동의합니다</label>
							<input type="radio" id="Agree011" name="Agree1" value="N" checked> 
								<label for="Agree011">동의하지 않습니다</label>
				</div>
			</div>
		</div>



			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>


			<div class="row">
				<div class="text-center">
					<h2 class="">개인정보의 수집 및 이용에 대한 동의(필수)</h2>
				</div>
			</div>
			<div class="row">
				<div class="box">
					<iframe class="inner-agreement" src="<%=request.getContextPath()%>/Resource/agreement/personalAgreement.html"></iframe>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-12 ag">
					<div class="text-center">
					<input id="Agree02" name="Agree2"  type="radio" value="Y"> 
						<label for="Agree02">동의합니다</label>    
					<input type="radio" id="Agree022" name="Agree2" value="N" checked>
						<label for="Agree022">동의하지 않습니다</label>
					</div>
				</div>
				
			</div>
		</form>
	</section>
		
			<br>
			

        <div class="col-md-offset-2 col-md-8"></div>
	<div class="row">
				<div class="row">
					<br><br>
					 <div class="col-xs-12">
					<div class="col-md-offset-2 col-md-8 text-center">
						<input class="btn-box" id="sub-btn" type="submit" value="다음단계" onclick=""> 
						<input class="btn-box" id="sub-btn2" type="button" value="뒤로">
						</div>
					</div>
				</div>
			</div>
		</div>

<%@ include file = "/../views/common/footer.jsp"%>

<script>
	$("#sub-btn")
			.click(
					function() {
						if ($("#Agree01").is(":checked") == false) {
							alert("모든 약관에 동의 하셔야 다음 단계로 진행합니다.");
							return;
						} else if ($("#Agree02").is(":checked") == false) {
							alert("모든 약관에 동의 하셔야 다음 단계로 진행합니다.");
							return;
						} else {
							$("#terms_form").submit();
							location.assign("<%=request.getContextPath()%>/member/signup");
									
                    	}
                    });
            
            $("#sub-btn2").click(function(){
            	history.back();
            });
</script>