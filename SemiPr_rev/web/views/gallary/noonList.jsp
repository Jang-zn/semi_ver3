<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List,com.semi.gallary.model.vo.Gallary"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.Member" %>
<% 	List<Gallary> list = (List<Gallary>)request.getAttribute("list");
	String pageBar=(String)request.getAttribute("pageBar");
	
	String searchKeyword=request.getParameter("searchKeyword");
	Member m=(Member)session.getAttribute("logged");

	
	SimpleDateFormat sf = new SimpleDateFormat ( "yyyy MM/dd (HH:mm)");
	Date time = new Date();
	
%>		
	
<%@ include file="/views/common/header.jsp"%>
<script src="https://kit.fontawesome.com/d4b4124527.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/noonList.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Resource/css/font.css">	

</div>
<!--------------- 배너 ---------->
     <div id="banner_home" class="container-fluid">
    	<div class="row">
    		<div class="col-md-12">
    			<img src="<%=request.getContextPath()%>/Resource/img/banner_noonList.png" alt="" style="width:100%; height:auto; margin:0;">
    		</div>
    	</div>
    </div>
<br><br>
<div class="container">
	<div class="row">
		<div id="n_title" class="col-md-12 title01">> 눈바디</div>		
			<%-- <img src="<%=request.getContextPath()%>/Resource/img/noonbody.png"><hr/> --%>
	</div>	
	<br>
		<div class="row">	
			<div id="n_content_area" class="col-md-6"> <!-- 상세눈바디 column시작 -->
				<!-- <span class="gal_no"></span> -->
				<div class="row">
			
					<div id="n_content_img" class="col-md-12">							
						<img class="content_img" src="<%=request.getContextPath()%>/Resource/img/noNoon.jpg">				
					</div>
				</div>
				<div class="row">					
					<div class="col-md-12 nickname02"><p><%=m.getNickname() %>님의 기록</p></div>
				</div>
				<div class="row">
					<div id="n_date" class="col-md-12"></div>
				</div>
				
				<div class="row">			
				<!-- <div id="n_comment" class="col-md-12"> -->
					<div id="comment_area" class="col-md-12">
						<!-- <textarea rows="10" cols="100"></textarea> -->
					</div>
				</div>
			
				<input class="deleteNo" type="hidden" value="">
				<input class ="updateBtn" type="hidden" >
				<input class="deleteBtn" type="hidden">
		<!-- </div> -->
		</div> <!-- 상세눈바디 column끝  -->

			<div class="col-md-1"></div> <!-- 공백 -->

		<div id="n_list" class="col-md-4"> <!-- 갤러리 리스트 cloumn 시작-->
			<div class="row">
				<div class="col-md-3 btn" onclick="location.assign('<%=request.getContextPath()%>/gallary/write');">사진 등록</div>				
				<div class="col-md-9">
						<form action="<%=request.getContextPath() %>/gallary/noonListSearch" method="get">
						
						<%-- <form action="<%=request.getContextPath() %>/gallary/noonListSearch" method="post"> --%>
							<input type="text" name="searchKeyword" size="20" placeholder=" 검색할 월/일을 입력해주세요 " class="searchLine">
						
						<input type="submit" value="검색" class="btn02">
					</form>
				</div>
			</div>
			
 			<%if(list.isEmpty()){ %>
 				<div class="row">
                	<div class="col-md-6 noUpload"></div>
                    <div class="col-md-6 noUpload"></div>                                                       
               </div>
             	<div class="row">
                	<div class="col-md-6 noUpload"></div>
                    <div class="col-md-6 noUpload"></div>                                                       
                </div>
                <div class="row">
                	<div class="col-md-6 noUpload"></div>
                    <div class="col-md-6 noUpload"></div>                                                       
                </div>
                
								
				
				<%}else{ %> 
				<div class="row">
				<% 	for(Gallary g : list) {%>
					
							<!-- if (m.getMemberId().equals(g.getMemberId())){ -->
						<!-- <div class="row">  -->
							<div class="img_obj col-md-6">
								<input type="hidden" class="gal_no" value="<%=g.getGalNo()%>">
								<img class="upload_img" src="<%=request.getContextPath()%>/upload/gallary/<%=g.getImgName()%>" style="margin-bottom:0;">
								<p>⌚<%= sf.format(g.getGallaryDate())%></p> 																		
							</div>
					 																		
					<%}%>
					</div>
				<%}%>	
				<div id="n_pageBar" class="row" style="text-align:center;">
					<div class="col-md-12"><%=pageBar %></div>
				</div> 
			</div><!-- 갤러리 리스트 cloumn 끝-->
			<div class="col-md-1"></div>
			</div> <!--noonList row끝 -->
		</div>	<!-- 전체 column끝-->
	</div> <!-- 전체 row끝 -->
</div> <!-- container 끝 -->

<script>
	$(".img_obj").click(e=>{

		var gal_no =$(e.target).prev().val();

		$.ajax({
			url:"<%=request.getContextPath()%>/gallary/getGallaryList",
			type:"post",
			data:{"gal_no" : gal_no},
			dataType:"json",
			success:getNoon,
			error:function(){alert("이미지를 클릭해주세요 :)");
			}
		//$(e.target).parent.children($	
		});				
	});
		function getNoon(data){ 	
			var imgname=data["imgName"];

 			var galdate=data["galDate"];

			
			 	$(".content_img").attr("src", "<%=request.getContextPath()%>/upload/gallary/"+imgname);			 	
				$("#comment_area").html(data["content"]);
				$(".deleteNo").attr("value" ,data["galNo"]);
				$("#n_date").html(galdate);
				$(".updateBtn").attr({type:"button",value:"수정하기", onclick:"gal_update();"});
				$(".deleteBtn").attr({type:"button",value:"삭제하기", onclick:"gal_delete();"});
				
				
		}
	
	
		const gal_delete=()=>{
			var no =$(".deleteNo").val();
			var src = $('.content_img').attr("src");

			if(confirm("삭제하시겠습니까?")){
								
				location.replace("<%=request.getContextPath()%>/gallary/deleteGallary?no="+no+"&filepath="+src);
				
			}
		} 
		
		const gal_update=()=>{
			var no =$(".deleteNo").val();
			var src = $('.content_img').attr("src");

			
			if(confirm("수정하시겠습니까?")){
			location.assign("<%=request.getContextPath()%>/gallary/updateGallary?no="+no);
			}
		}
	

</script>


<%@ include file="/views/common/footer.jsp"%>