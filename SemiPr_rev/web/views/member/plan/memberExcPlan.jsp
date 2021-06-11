<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.semi.member.exc.model.vo.Exercise"%>
<%@ page import="com.semi.member.model.vo.Member"%>
<%@ page import="java.util.List"%>
<%
List<Exercise> list =(List<Exercise>)request.getAttribute("excList");
Member m = (Member)session.getAttribute("logged");
String pageBar = (String)request.getAttribute("pageBar");
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/Resource/css/memberExcPlan.css">
	</div>
<!--------------- 배너 ---------->
     <div id="banner_home" class="container-fluid">
    	<div class="row">
    		<div class="col-md-12">
    			<img src="<%=request.getContextPath()%>/Resource/img/banner_memberExcPlan.png" alt="" style="width:100%; height:auto; margin:0;">
    		</div>
    	</div>
    </div>
 <br>
<br>
<div class="container">
<div class=row>

	<div class="row">
		<div class="title02 col-md-2">> 운동 List</div>
		<div id="sort_container" class="col-md-2">
			<div class="row">&nbsp;</div>
			<div class="row paddingb">
				<select id="excSort">
					<option>분류 선택</option>
					<option value="상체">- 상체 -</option>
					<option value="하체">- 하체 -</option>
					<option value="전신">- 전신 -</option>
					<option value="스트레칭">- 스트레칭 -</option>
				</select>
			</div>
		</div>
	</div>
</div>

<div class=row style="border: 2px solid;">

	<div id="list_container" class="">
		<div id="exc_list" class="col-md-5">
			
			<br>

			<%for(Exercise e : list){ %>
			<div id="sort_list" class="row clickcheck">
				<div class="border col-md-3 listimgbox">
					<img src="<%=e.getFileList().get(0)%>">
				</div>

				
				<div id="exc_box" class="border col-md-9"
					style="padding-top: 1%; padding-bottom: 1%;">
					<div id="exc_box_name" class="col-md-9"><%=e.getExcName() %></div>
					<div id="exc_box_sort" class="col-md-3"><%=e.getExcSort() %></div>
					<div id="exc_box_info" class="col-md-12 exc_box_info"><%=e.getExcManual()%></div>
				</div>
			</div>
			<%} %>
			<br>
			<div id="sort_list" class="row">
				<div id="pageBar" class="row" style="text-align: center;">
					<%=pageBar%>
				</div>
			</div>

		</div>
		<div id="exc_list_info" class="col-md-7">

			<!-- Ajax 적용영역 -->
			<br>
			<div id="exc_name" class="row title02"><%=list.get(0).getExcName()%></div>
			<div id="exc_select" class="row">
				<div id="exc_img" class="col-md-8">
					<img src="<%=list.get(0).getFileList().get(0)%>">
				</div>
				<div id="exc_submit" class="col-md-4">
					<form action="<%=request.getContextPath()%>/member/excPlan/submit"
						method="post" onsubmit="return excSubmit();">
						<select name="week">
							<option value="월">월</option>
							<option value="화">화</option>
							<option value="수">수</option>
							<option value="목">목</option>
							<option value="금">금</option>
							<option value="토">토</option>
							<option value="일">일</option>
						</select><br><br>
						 <input id="weightC" type="number" name="weight" placeholder="kg / 불필요시 미입력"><br><br>
						 <input id="repsC"	type="number" name="reps" placeholder="횟수" required><br><br>
						<input id="setsC" type="number" name="sets" placeholder="세트수"	required><br><br>
						 <input type="submit" value="등록하기"><br>
						<input id="excName" type="hidden" name="excName">
					</form>
				</div>
			</div>
			<div id="exc_detail_info_container" class="row"
				style="padding: 10px;">
				<%for(int i=1;i<list.get(0).getFileList().size();i++){ %>
				<div class="col-md-12">
					<img style="width: 40%" src="<%=list.get(0).getFileList().get(i)%>">
				</div>
				<%} %>
				<div class="col-md-12"><%=list.get(0).getExcManual()%></div>
			</div>
			<div id="exc_video" class="row">
				<%-- <a href="<%=list.get(0).getExcVideo()%>">참고 영상 : <%=list.get(0).getExcVideo()%></a><br> --%>
				<%if(list.get(0).getExcVideo()!=null) %>
				<iframe src="<%=list.get(0).getExcVideo()%>"></iframe>

			</div>
			<!-- Ajax 적용영역 -->

		</div>
	</div>
</div>



<script>
	$(".clickcheck").click(e=>{
		let name =$(e.target).parents(".clickcheck").find("#exc_box_name").text();
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/excListClick.do?name="+name,
			dataType:"json",
			success:data=>{
				
				$("#exc_name").text(data.excName);
				$("#exc_detail_info_container>div").text(data.excManual);
				$("#exc_img>img").attr("src",data.fileList[0]);
				for(let i=1;i<data.fileList.length;i++){
					let div = $("<div>").addClass("col-md-12");
					let img = $("<img>").attr("src",data.fileList[i]).attr("style","width:40%");
				
					div.append(img);
					if(i==1){
						$("#exc_detail_info_container").html(div);
					}else{
						$("#exc_detail_info_container").append(div);
					}
				}
				let div = $("<div>").addClass("col-md-12");
				div.text(data.excManual);
				//$("#exc_video").html($("<a>").attr("href",data.excVideo).text("참고영상 : "+data.excVideo));
				$("#exc_video").html($("<iframe>").attr("src",data.excVideo));
			}
		});
	});
	
	$("#excSort").change(e=>{
		let excSort = $(e.target).val();
		location.assign("<%=request.getContextPath()%>/member/excPlan?numPerpage=6&excSort="+excSort);
	});
	
	$(function() {
		let sort = $("#exc_box_sort").text();
		$("#excSort").val(sort);
	}); 
	
	// 서브밋하면 확인창만 띄워주고 그 페이지 유지하게 처리..
	const excSubmit=()=>{
		$("#excName").val($("#exc_name").text());
		if($("#weightC").val()>=0&&$("#repsC").val()>0&&$("#setsC").val()>0){
			return true;
		}else{
			alert("0보다 큰 수를 입력하세요");
			return false;
		}
	}
	
</script>

<%@ include file="/views/common/footer.jsp"%>
