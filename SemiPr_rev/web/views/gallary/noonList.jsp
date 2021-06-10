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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/noonList.css">

<div class="container-fluid">
	<div class="row">
		<div id="n_title" class="col-md-12">
		<h2>눈바디</h2>
		<div class="row">	
			<div class="col-md-1"></div> <!-- 공백 -->
			<div id="n_content_area" class="col-md-6"> <!-- 상세눈바디 column시작 -->
				<!-- <span class="gal_no"></span> -->
				<div class="row">
			<!-- <div id="n_content" class="col-md-8"> -->
					<div id="n_content_img" class="col-md-12">							
						<img class="content_img" src="<%=request.getContextPath()%>/Resource/img/noNoon.jpg">				
					</div>
				</div>
				<div class="row">					
					<div class="col-md-12"><p align="center"><p><%=m.getNickname() %>님의 기록</p></div>
				</div>
				<div class="row">
					<div id="n_date" class="col-md-12 noonDate"></div>
				</div>
				
				<div class="row">			
				<!-- <div id="n_comment" class="col-md-12"> -->
					<div id="comment_area" class="col-md-12">
						<!-- <textarea rows="10" cols="100"></textarea> -->
					</div>
				</div>
			
				<input class="deleteNo" type="hidden" value="">
				<input class ="updateBtn" >
				<input class="deleteBtn" >
		<!-- </div> -->
		</div> <!-- 상세눈바디 column끝  -->


		<div id="n_list" class="col-md-4"> <!-- 갤러리 리스트 cloumn 시작-->
			<div class="row">
				<div class="col-md-3 btn" onclick="location.assign('<%=request.getContextPath()%>/gallary/write');">사진등록</div>				
				<div class="col-md-9">
						<form action="<%=request.getContextPath() %>/gallary/noonListSearch" method="get">
						<!-- <div class=""> -->
						<%-- <form action="<%=request.getContextPath() %>/gallary/noonListSearch" method="post"> --%>
							<input type="text" name="searchKeyword" size="25" placeholder="검색할 월/일을 입력해주세요 "/>
						<!-- </div> -->
						<input type="submit" value="검색"/>
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
			<!-- <div id="n_img_list" class="col-md-12">	 -->						
				
				<%}else{
					for(Gallary g : list) {%>
							<!-- if (m.getMemberId().equals(g.getMemberId())){ -->
						<div class="row"> 
						<div class="img_obj col-md-6">
							<input type="hidden" class="gal_no" value="<%=g.getGalNo()%>"/>
							<img class="upload_img" width="100%" src="<%=request.getContextPath()%>/upload/gallary/<%=g.getImgName()%>" />
							<%= sf.format(g.getGallaryDate())%>	 																		
						</div>
						<% 
						}
					}%>	
				</div> 
			
			</div>
							
<!-- 						<div class="img_obj col-md-6"></div>
				<div class="img_obj col-md-6"></div>
						<div class="img_obj col-md-6"></div>
					</div>
					<div class="row">
						<div class="img_obj col-md-6"></div>
						<div class="img_obj col-md-6"></div>
					</div>
			
 -->
				<div id="n_pageBar" class="row">
					<div class="col-md-8"></div>
					<div class="col-md-4"><%=pageBar %></div>
				</div> 
			</div> <!-- 갤러리 리스트 cloumn 끝-->
			<div class="col-md-1"></div>
			</div> <!--noonList row끝 -->
		</div>	<!-- 전체 column끝-->
	</div> <!-- 전체 row끝 -->
</div> <!-- container 끝 -->

<script>
	$(".img_obj").click(e=>{
		console.log($(e.target));
/* 		console.log("gal_no: "+$(".gal_no").val());
		var gal_no =$(".gal_no").val(); */
		/* var gal_no =$(e.target).children(".gal_no").val(); */
		var gal_no =$(e.target).prev().val();
		console.log("gal_no: "+ gal_no);
	
		
/* 	function noonList(){}
		console.log("gal_no: "+$(".gal_no").val());
		var gal_no =$(".gal_no").val(); */
	//onclick = cilck
		$.ajax({
			url:"<%=request.getContextPath()%>/gallary/getGallaryList",
			type:"post",
			data:{"gal_no" : gal_no},
			dataType:"json",
			success:getNoon,
			error:function(){alert("error");
			}
		//$(e.target).parent.children($	
		});				
	});
		function getNoon(data){ 	
			var imgname=data["imgName"];
			console.log("imgname:"+imgname);
 			var galdate=data["galDate"];
			console.log(galdate); 
			
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
			console.log("no: "+no);
			console.log("src "+src);
			if(confirm("삭제하시겠습니까?")){
								
				location.replace("<%=request.getContextPath()%>/gallary/deleteGallary?no="+no+"&filepath="+src);
				
			}
		} 
		
		const gal_update=()=>{
			var no =$(".deleteNo").val();
			var src = $('.content_img').attr("src");
			console.log("no: "+no);
			console.log("src "+src);
			
			if(confirm("수정하시겠습니까?")){
			location.assign("<%=request.getContextPath()%>/gallary/updateGallary?no="+no);
			}
		}
	

	

</script>


<%@ include file="/views/common/footer.jsp"%>