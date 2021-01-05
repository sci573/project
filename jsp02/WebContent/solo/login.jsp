<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>
<link href="${path}/solo/css/style.css" rel= "stylesheet" type="text/css">
<style type="text/css">
body{background-color: #f2f2f2}

</style>
<script type="text/javascript">

$(function(){
	$("#btnLogin").click(function(){	
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		
		var param="userid="+$("#userid").val()
		+"&passwd="+$("#passwd").val();
		
		if(userid==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return; //함수종료
			}
		if(passwd==""){
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return; //함수종료
			}
	$.ajax({
	    type : "post",
	    url : "${path}/kakao_servlet/login.do",
	    data : param,
	    success: function(data, textStatus, xhr){
			if(data == "loginSuccess"){
				alert("로그인 되었습니다.");
				location.href="${path}/solo/main.jsp";
			}else {
				//$("#result").html(result); 	
				alert("아이디와 비밀번호를 확인해주세요.");
				}
			}
		});
	});
});
</script>
</head>
<body>

<div id="coner">
	<a id="co_h" href="${path}/solo/main.jsp">MAIN </a>|
	<a id="co_l" href="${path}/solo/login.jsp">LOGIN </a>|
	<a id="co_j" href="${path}/solo/join.jsp">JOIN </a>	
</div>

<h1>
	<a id="header" href="${path}/solo/main.jsp">KAKAO FRIENDS</a>
</h1>
<p> </p>
<!-- 수정 -->
<div id="loginBox">
	<div id="loginForm">
		<p class="idpw">
			<input type="text" id="userid" placeholder="아이디" style="text-align: left;">
		</p>	
		<p class="idpw">
			<input type="password" id="passwd" placeholder="비밀번호" style="text-align: left;">
		</p>
		<button id="btnLogin">로그인</button>
	</div>
</div>
</body>
</html>