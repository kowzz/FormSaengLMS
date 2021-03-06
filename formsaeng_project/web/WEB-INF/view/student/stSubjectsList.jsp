<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/SubjectsList.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>학생 - 수강신청</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/NanumBarunGothicYetHangul.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<div class="header_container">
			<div class="header_wrapper">
				<div class="univ_logo">
					<a href="<%=request.getContextPath()%>/st/main"><img class="logo2"
						src="<%=request.getContextPath()%>/resources/images/fromsaenglogo.png"
						alt="폼생대로고"></a> <a href="<%=request.getContextPath()%>/st/main"><img class="logo1"
						src="<%=request.getContextPath()%>/resources/images/name_logo.png"
						alt="폼생대학교"></a>
				</div>
				<div class="move_page_buttons">
					<button class="btn btn-success" id="myPage">마이 페이지</button>
					<button class="btn btn-success" id="move_lms">LMS 바로가기</button>
				</div>
			</div>
		</div>
	</header>
	<section id="subjects">
		<div class="content_title">
			<div class="title_name">
				<h2 class="font5">교과목 조회 및 신청</h2>
			</div>
			<form action="<%=request.getContextPath() %>/st/SubjectList" method="get">
				<div class="search">
					<select class="select_design font2" name="search_type" id="search_type">
						<option class="option_design font2" value="course_day" selected>요일 검색</option>
						<option class="option_design font2" value="class_type">이수구분 검색</option>
						<option class="option_design font2" value="subject_name">과목 검색</option>
					</select> <input type="text" class="form-control search_input"
						id="search_word" name="search_word" placeholder="검색어를 입력하세요">
					<button type="submit" class="btn btn-secondary">검색</button>
				</div>
			</form>
		</div>
		<div class="subject_list_container">
			<form id= 'frmCheck'>
				<table class="table">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" name="allCheck"
								class="allCheck"></th>
							<th scope="col">학과명</th>
							<th scope="col">과목명</th>
							<th scope="col">학점</th>
							<th scope="col">과목 구분</th>
							<th scope="col">담당 교수</th>
							<th scope="col">강의실명</th>
							<th scope="col">강의 교시</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${fn:length(subjects) < 1 }">
							<tr Class="no_list">
								<!-- 보여질 공지사항이 없을 경우 -->
								<td colspan="8"> 조회된 내용이 없습니다.</td>
							</tr>
						</c:if>
	
						<c:forEach var="subject" items="${subjects}">
							<tr>
								<th scope="row"><input type="checkbox" name="checkRow"
									class="checkRow" value='${subject.subCode }'></th>
								<th scope="row">${subject.deptName }</th>
								<th scope="row">${subject.subName }</th>
								<td>${subject.courseCredit }</td>
								<td>${subject.classType }</td>
								<td>${subject.pfName }</td>
								<td>${subject.courseClass }</td>
								<td>${subject.courseDay} / ${subject.coursePeriod }</td>
							</tr>
						</c:forEach>
				</table>
			</form>
			<div id= "page_box">
				<div id = "paging">
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					  <c:if test="${startPage gt 1 }">
					   <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/st/SubjectList?p=${startPage-1}">Previous</a></li>
					  </c:if>
					  <c:if test="${startPage le 1 }">
					    <li class="page-item disabled">
					   		<a class="page-link" href="<%=request.getContextPath()%>/st/SubjectList">Previous</a>
					   </li>
					  </c:if>
					  <c:forEach step="1" begin="${startPage }" end="${endPage }" var="index">
					  	<c:if test="${index eq currentPage }">
					  		<li class="page-item active" aria-current="page">
					  			<a class="page-link" href="<%=request.getContextPath()%>/st/SubjectList?p=${index}">${index }</a>
					  		</li>
					  	</c:if>
					  	<c:if test="${index ne currentPage }">
					  		<li class="page-item">
					  			<a class="page-link" href="<%=request.getContextPath()%>/st/SubjectList?p=${index}">${index}</a>
					  		</li>
					  	</c:if>
					  </c:forEach>
					  <c:if test="${endPage lt pageCnt }">
					   <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/st/SubjectList?p=${endPage + 1}">Next</a></li>
					  </c:if>
					  <c:if test="${endPage ge pageCnt }">
					   	<li class="page-item disabled">
					   		<a class="page-link" href="<%=request.getContextPath()%>/st/SubjectList?p=${endPage + 1}">Next</a>
					   	</li>
					  </c:if>
					  </ul>
					</nav>
				</div>
				<div id = button_box>
					<button type="button" id="applySubject" class="btn btn-primary">과목
				신청하기</button>
				</div>
			</div>
		</div>
	</section>
	<section id="subjects">
		<div class="content_title">
			<div class="applied_subject">
				<h2 class="font5">신청 과목 조회</h2>
			</div>
		</div>
		<div class="subject_list_container">
			<form id= 'cancel_apply'>
				<table class="table">
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" name="allCheck"
								class="all_check"></th>
							<th scope="col">학과명</th>
							<th scope="col">과목명</th>
							<th scope="col">학점</th>
							<th scope="col">과목 구분</th>
							<th scope="col">담당 교수</th>
							<th scope="col">강의실명</th>
							<th scope="col">강의 교시</th>
						</tr>
					</thead>
					<tbody>
	
						<c:forEach var="applied" items="${aplist}">
							<tr>
								<th scope="row"><input type="checkbox" name="cancelList"
									class="row_check" value='${applied.subCode }'></th>
								<th scope="row">${applied.deptName }</th>
								<th scope="row">${applied.subName }</th>
								<td>${applied.courseCredit }</td>
								<td>${applied.classType }</td>
								<td>${applied.pfName }</td>
								<td>${applied.courseClass }</td>
								<td>${applied.courseDay} / ${applied.coursePeriod }</td>
							</tr>
						</c:forEach>
				</table>
			</form>
			
			<button type="button" id="cancel" class="btn btn-primary">선택 과목
				신청취소하기</button>
		</div>
	</section>
	<script>
		//마이페이지 이동
		$("#myPage").click(function(){
			location.href = '<%=request.getContextPath()%>/st/mypage';
		});
		$("#move_lms").click(function(){
			location.href = '<%=request.getContextPath()%>/st/DashBoard';
		});
		//전체선택 전체선택 해제 설정 - 교과목 조회 및 신청
		$(".allCheck").click(function(){
			if($(".allCheck").prop("checked")){
				console.log("전체 누름");
				$(".checkRow").prop("checked",true);
				var checkedVal= new Array();
				$("input[name='checkRow']:checked").each(function(){
					checkedVal.push(this.value);
				});
				console.log(checkedVal);
			}else{
				console.log("전체 지움");
				$(".checkRow").prop("checked",false);
			}
		});
		//하나라도 선택 해제시 전체선택 해제 - 교과목 조회 및 신청
		$(".checkRow").click(function(){
			if($(".allCheck").prop("checked")){
				$(".allCheck").prop("checked",false)
			}
			let checkedCnt = $(".checkRow:checked").length;
			let checkBoxCnt = $(".checkRow").length;
			
			if(checkedCnt == checkBoxCnt){
				$(".allCheck").prop("checked",true);
			}
		});
		
		
		
		//전체선택 전체선택 해제 설정 - 신청과목 조회
		$(".all_check").click(function(){
			if($(".all_check").prop("checked")){
				console.log("전체 누름");
				$(".row_check").prop("checked",true);
				var checkedVal= new Array();
				$("input[name='checkRow']:checked").each(function(){
					checkedVal.push(this.value);
				});
				console.log(checkedVal);
			}else{
				console.log("전체 지움");
				$(".row_check").prop("checked",false);
			}
		});
		//하나라도 선택 해제시 전체선택 해제 - 신청과목 조회
		$(".row_check").click(function(){
			if($(".all_check").prop("checked")){
				$(".all_check").prop("checked",false)
			}
			let checkedCnt = $(".row_check:checked").length;
			let checkBoxCnt = $(".row_check").length;
			
			if(checkedCnt == checkBoxCnt){
				$(".all_check").prop("checked",true);
			}
		});
		
		
		
		
		//체크박스 값 넘기기
		$("#applySubject").on("click",function(){
			let queryString = $("#frmCheck").serialize();
			console.log(queryString);
			
			 if(queryString == "" || queryString == null){
				alert("신청할 과목을 선택하세요.");
			}else{
				 $.ajax({
					url:"<%=request.getContextPath()%>/st/applySubject.ajx",
					type:"post",
					data:queryString,
					dataType:"text",
					success:function(result){
						console.log("칸츄롤라 갔다왔지롱");
						if(result == 0){
							alert("신청에 실패했습니다. 다시 시도해주세요.");
						}else if(result != 0){
							console.log(result);
							alert(result + "개의 과목 신청이 완료되었습니다.");
							location.reload();
						}
						
					}
					
				});
			}
		});
		$("#cancel").on("click",function(){
			let queryString = $("#cancel_apply").serialize();
			console.log(queryString);
			
			 if(queryString == "" || queryString == null){
				alert("취소할 과목을 선택하세요.");
			}else{
				 $.ajax({
					url:"<%=request.getContextPath()%>/st/cancelSubject.ajx",
					type:"post",
					data:queryString,
					dataType:"text",
					success:function(result){
						console.log("칸츄롤라 갔다왔지롱");
						//TODO 삭제 컨트롤러 작성
						if(result == 0){
							alert("삭제에 실패했습니다. 다시 시도해주세요.");
							location.reload();
						}else{							
						alert(result + "개의 신청과목을 취소했습니다.");
						location.reload();
						}
					}
				});
			} 
		});
	</script>
</body>
</html>