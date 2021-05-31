<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관동의 : </title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberAgreement.css">
</head>
<body>
       <div id="agreement-wrap">
            <h1>약관동의</h1>
        </div>
        <br>
        <section class="agreement-page">
         
            <form action="agreement">
                    <h2 class="agreement1">이용약관 (필수)</h2>
                    <div class="box" style=" overflow:scroll;  width:1000px; height:300px; background-color:gold;">
                          <iframe class="inner-agreement" src="<%=request.getContextPath()%>/Resource/agreement/siteAgreement.html"></iframe>
                    </div>
                    <p>
                    <input type="radio" id="Agree01" name="Agree1" value="Y">
                    <label class="agree-page" for="Agree01">동의합니다</label>
                    <input type="radio" id="Agree01" name="Agree1" value="N">
                    <label for="pInforAgree022">동의하지 않습니다</label>
                    </p>
              

                    <br><br><br><br><br><br><br>

                   
                    <h2  class="agreement1">개인정보의 수집 및 이용에 대한 동의(필수)</h2>
                    
                    <div class="box" style="overflow:scroll;  width:1000px; height:300px; background-color:gold;">
                       <iframe class="inner-agreement" src="<%=request.getContextPath()%>/Resource/agreement/personalAgreement.html"></iframe>
                    </div>
                    <p>
                    <input type="radio" id="Agree02" name="Agree2" value="Y">
                    <label class="agree-page" for="Agree02">동의합니다</label>
                    <input type="radio" id="Agree022" name="Agree2" value="N">
                    <label for="Agree02">동의하지 않습니다</label>
                    </p>
                </form>
            </section>
               
                    <div id="submit-btn">
                        <input class="sub-btn" type="submit" value="동의" onclick="">
                        <input class="sub-btn" type="reset" value="미동의">
                    </div>
</body>
</html>