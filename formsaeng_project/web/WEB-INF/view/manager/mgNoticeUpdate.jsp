<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/notice.css">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="kh.semi.notice.model.vo.NoticeVo"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeUpdate</title>
<!--부트스트랩-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- J쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- 글자 -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/NanumBarunGothicYetHangul.css"
	rel="stylesheet">
</head>

<body>

	<div class="body_div">
		<div class="logoimg_enroll">
				<a href="<%=request.getContextPath()%>/mg/main">
					<img src="<%=request.getContextPath()%>/resources/images/fromsaenglogo.png" class="fromsaenglogo"> 
				</a>
				<a href="<%=request.getContextPath()%>/mg/main">
					<img src="<%=request.getContextPath()%>/resources/images/name_logo.png"	class="logo">
				</a>
		</div>

		<!-- 폼태그는 가지고 갈 데이터(값) 바로 앞에서 "name"이 꼭 필요함-->
		<form id="mgNoticeFrom" action="<%=request.getContextPath()%>/mg/notice/update.do" method="post"> <%NoticeVo nnvo = (NoticeVo) request.getAttribute("ddvo");%>
			<!-- //업데이트 서블릿에서 가져온이름 -->

			<div class=title_search>
				<div class="title font5">공지사항 수정하기</div>
				<div class="button_enroll">
					<button type="submit" class="btn btn-primary" id="insertBtn">수정완료</button>
					<button type="button" id="nt_list_btn" class="btn btn-primary">공지사항 목록</button>
				</div>
			</div>

			<input type="hidden" id="bNno" name="bNno" value="<%=nnvo.getBoardNoticeNo()%>">
			

			<div class="mb-3 room">
				<div class="font4">제목</div>
				<div class="form-floating">
						<input type="text" class="form-control title_update" name="title" id="title" value="<%=nnvo.getBoardNoticeTitle()%>">
				</div>
			</div>
			<div class="mb-3 room">
				<div class="font4">내용</div>
						<textarea class="form-control update_content_box" name="content" rows="20" id="content"><%=nnvo.getBoardNoticeContent()%></textarea>
						<label for="floatingTextarea2">
							<pre class="font2"></pre>
						</label>
				
			</div>
		</form>
	</div>
	<script>
		/* 공지사항 목록 버튼 클릭 시 공지사항 리스트 페이지로 이동 */
		$("#nt_list_btn").click(function() {
			location.href = "<%=request.getContextPath()%>/mg/notice/list";
		})
		
		
	</script>
</body>
</html>
