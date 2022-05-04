  <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/reset.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/plogin.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 로그인</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumBarunGothicYetHangul.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
#container {
	background-image: url('./resources/images/pflogin.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	height: 100vh;
}

</style>

<script>
$(function(){
		$("#findid").on("click",function(){
			console.log("함수야 안녕");
			$(".findid_modal").fadeIn(150);
			$(".btn_modal_close").on("click",closeModal);
			$(".findid_modal").on("click",closeModalWindow);
		});
		
		function closeModal(){
			$(".findid_modal").hide();
		}
		function closeModalWindow(){
			if(event.target == $(".findid_modal").get(0)){
				console.log('넌 어디냐');
				 $(".findid_modal").hide();
				 $(".findid_modal").off("click",closeModalWindow); 
			}
				
		}
});

</script>
</head>
<body>
<div id="container">
    <div id="plogin">
            <div class="minilogo"><img src="<%= request.getContextPath() %>/resources/images/fromsaenglogo.png" alt="logo"></div>
            <div class="logincenter">
                <div class="logo"><img src="<%= request.getContextPath() %>/resources/images/logo.png" alt="폼생대학교"></div>
                    <div id="login">
                        <form id="login-form" class="form" action="pflogin.do" method="post">
                            <h3>교수 전용 로그인</h3>
                            <div class="form-group">
                                <input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력해주세요">
                            </div>
                            <div class="form-group">
                                <input type="password" id="pwd" name="pwd" class="form-control" placeholder="비밀번호를 입력해주세요">
                            </div>
                            <div class="form-group">
                                <button type="button" name="findid" id="findid" class="btn btn-light">아이디 찾기</button>
                                <button type="button" name="findpwd" id="findpwd" class="btn btn-light">비밀번호 찾기</button>
                                <input type="button" id="submit" name="submit" class="btn btn-primary" value="로그인">
                            </div>
                        </form>
                    </div>
                    <div class="loginmenu">
                        <input type="button" id="notice" name="notice" class="btn btn-success"  value="공지사항">
                    </div>
                    
                    <!-- 아이디 찾기 모달창 -->
				<div class="findid_modal">
					<div class="modal_content">
						<div>
						<form id="frmEmail">
							<table>
									<tr>
										<td class="font-3">이름을 입력하세요</td>
										<td><input type="text" name="name" id="inputName"></td>
										<td></td>
									</tr>
									<tr>
										<td class="font-3">이메일을 입력하세요</td>
										<td><input type="email" name="email" id="inputEmail"></td>
										<td><button type="button" id="btnSendEmail">이메일 인증</button></td>
									</tr>
								</table>
							</form>	
						</div>
						<button class="btn_modal_close">닫기</button>
					</div>
				</div>
			</div>
            <div></div>
    </div>
   	</div>
	<script>
		$("#btnSendEmail").click(function(){
			var inputName = $("#inputName").val().trim();
			var inputEmail = $("#inputEmail").val().trim();
			if(inputName == "" || inputEmail=="" ){
				alert("이메일을 입력해주세요.");
				$("#inputEmail").focus();
				return;
			}
			$.ajax({
				url:"cemail",
				type:"post",
				data: {name: inputName, email:inputEmail },
				success:function(result){
					console.log(result);
					if(result == 0)  // 0: email, name과 일치하는 회원정보가 없음
						alert("name, email이 일치하는 회원정보가 없습니다. 다시 입력해주세요.");
					else if(result == 1)// 1: email 보내기 성공
						alert("email인증메일 전송되었습니다. 메일 확인해주세요");
					else // -1: email 보내기 실패
						alert("email인증메일 전송에 실패했습니다. 다시 시도해주세요");
				},
				error: function(){
					
				}
			});
			
		});
		
		$("#notice").click(function() {
			location.href = "";
		});

		
   	 	
	</script>
	   <script> // ajax
   $(function() {
   	   $("#submit").click(function(){
   		   var id = $("#id").val().trim();
   		   var checkId = /^[P][0-9]{10}$/;
   		   if(!checkId.test(id)){
   			   alert("아이디는 P로 시작하는 10자리 숫자입니다");
   			   $("#id").focus();
   			   return false;
   		   } else{
		 $.ajax({ // JQuery 를 통한 ajax 호출 방식 사용
		 type : "POST",
		 url : "pflogin.do",
		 data : {
		 id : $("#id").val().trim(),
		 pwd : $("#pwd").val().trim(),
		 },
		 success : function(result) {
		 if(result == "성공"){
			 console.log(result);
			alert("반갑습니다");
	 		location.href = "<%=request.getContextPath()%>/pf/main"; // 메인으로 이동
			
		 } else if(result == "실패"){
			alert("잘못된 사번 또는 비밀번호입니다");
			$("#id").val("").focus();
			$("#pwd").val("");
		 }
		 }
		 });
   			   
   		   }
   		   });
	});
   </script>
</body>
</html>