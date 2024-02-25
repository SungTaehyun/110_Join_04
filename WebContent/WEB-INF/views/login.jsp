<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Flat Login Form 3.0</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script type="text/javascript">
	// 이 스크립트는 페이지가 로드될 때 실행됩니다.
	window.onload = function(e) {
		// resultMsg 변수에는 서버에서 전달된 메시지가 포함됩니다.
		var resultMsg = "${resultMsg}";
		
		// resultMsg의 길이가 0보다 크면 (메시지가 비어 있지 않으면) 알림 창을 표시합니다.
		if(resultMsg.length > 0) {
			alert(resultMsg);
		}
	}
</script>

</head>
<body>
<!-- partial:index.partial.html -->
<!-- Form Mixin-->
<!-- Input Mixin-->
<!-- Button Mixin-->
<!-- Pen Title-->
<div class="pen-title">
  <h1>Flat Login Form</h1><span>Pen <i class='fa fa-paint-brush'></i> + <i class='fa fa-code'></i> by <a href='http://andytran.me'>Andy Tran</a></span>
</div>
<!-- Form Module-->
<div class="module form-module">
  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
    <div class="tooltip">Click Me</div>
  </div>
  <div class="form">
    <h2>Login to your account</h2>
    <form action="<c:url value='/login.do'/>" method="post">
      <input type="text" name="memberId" placeholder="ID" required/>
      <input type="password" name="passwd" placeholder="Password" required/>
      <button>Login</button>
    </form>
  </div>
  <div class="form">
    <h2>Create an account</h2>
    <form action="<c:url value='/join.do'/>" method="post">
	  <!-- 회원 가입 폼 -->
	  <!-- 폼은 '/join.do'로 데이터를 전송합니다. -->
	  <!-- method 속성은 데이터를 전송하는 방법을 지정합니다. 여기서는 POST 방식을 사용합니다. -->
	  <input type="text" name="memberId" id="memberId" placeholder="ID" required/> 
	  <!-- 사용자의 아이디를 입력하는 필드 -->
	  <!-- name 속성은 해당 입력 필드의 이름을 지정합니다. -->
	  <!-- id 속성은 해당 입력 필드의 고유 식별자를 지정합니다. -->
	  <!-- placeholder 속성은 사용자에게 어떤 형식의 데이터를 입력해야 하는지 안내합니다. -->
	  <!-- required 속성은 이 필드가 반드시 채워져야 함을 나타냅니다. -->
	  <label id="idCheckMsg" style="display:block; margin-top: -18px; margin-bottom: 0;"></label>
	  <div style="height:20px"></div>
      <input type="password" name="passwd" placeholder="Password" required/>
      <input type="text" name="memberName" placeholder="Name" required/>
      <input type="text" name="nickname" placeholder="Nickname" required/>
      <input type="email" name="email" placeholder="Email Address" required/>
      <button type="submit">Register</button>
    </form>
  </div>
  <div class="cta"><a href="http://andytran.me">Forgot your password?</a></div>
</div>
<!-- partial -->
<!--  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src='https://codepen.io/andytran/pen/vLmRVp.js'></script>
<script  src="${pageContext.request.contextPath}/resources/js/script.js"></script>
<!-- 아이디 자리수 및 중복 검사 -->
<script>
$(document).ready(function(){
	// 문서가 준비되면 실행됩니다.

	// ID 중복 확인 - ID 입력 필드를 벗어나면 작동합니다.
	$('#memberId').on("focusout", function() {
		// 입력된 아이디를 가져옵니다.
		var memberId = $("#memberId").val();

		// 입력된 아이디가 공백이거나 6자리 이하이면 메시지를 표시하고 함수를 종료합니다.
		if(memberId.trim() == '' || memberId.length <= 6) {
			$("#idCheckMsg").css("color", "red").text("ID는 7자리 이상이어야 합니다.");
			return false;
		}

		// 입력된 아이디를 콘솔에 출력합니다.
		console.log(memberId);

		// Ajax를 사용하여 서버로 아이디 중복 여부를 확인합니다.
		$.ajax({
			url: './confirmId.do', // 요청을 보낼 URL
			type: 'POST', // HTTP 요청 방식
			data: {
				'memberId': memberId // 전송할 데이터
			},
			dataType:'json', // 응답 데이터 형식
			success: function(result) { // 요청이 성공했을 때 실행될 콜백 함수
				console.log("result : " + result);

				// 서버에서 받은 결과에 따라 메시지를 표시합니다.
				if(result == "0") {
					$("#idCheckMsg").css("color", "green").text("사용 가능한 ID입니다.");
				} else {
					$("#idCheckMsg").css("color", "red").text("ID 중복입니다.");
					$("#memberId").val(''); // 중복된 경우 입력 필드를 비웁니다.
				}
			},
			error:function(){
                alert("에러입니다"); // 요청이 실패했을 때 실행될 콜백 함수
            }
		}); // Ajax 요청 종료
	}); // focusout 이벤트 핸들러 종료
}); // document.ready 종료
</script>

</body>
</html>