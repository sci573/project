<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오프렌즈</title>
<script src="../include/jquery-3.5.1.min.js"></script>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnJoin").click(function(){
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		var name=$("#name").val();
		var email=$("#email").val();
		var hp=$("#hp").val();
		var address=$("#address").val();
		var param={"userid":userid, "passwd":passwd, "name":name, "email":email, "hp":hp, "address":address}
		
		if(userid==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return;
			}
		if(passwd==""){
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
			}
		if(name==""){
			alert("이름을 입력하세요.");
			$("#name").focus();
			return;
			}
		if(email==""){
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return;
			}
		if(hp==""){
			alert("휴대전화를 입력하세요.");
			$("#hp").focus();
			return;
			}
		if(address==""){
			alert("주소를 입력하세요.");
			$("#address").focus();
			return;
			}
		if(confirm("회원가입 하시겠습니까?")){
		$.ajax({
			type:"post",
			url:"/jsp02/kakao_servlet/join.do",
			data: param,
			success:function(){
				alert("회원가입이 완료되었습니다.");
				location.href="${path}/solo/main.jsp";
				}
		});
			}
		});
	});
</script>
<link href="${path}/solo/css/style.css" rel= "stylesheet"  type="text/css">
<style type="text/css">
tr{height: 60px;}
td{font-size: 18px; width: 200px; text-align: left;}

</style>

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
<nav id="menu">
	<span id="introduce"><a href="${path}/solo/introduce.jsp">캐릭터 소개</a></span>
	<span id="store"><a href="${path}/solo/store.jsp">매장소개</a></span>
	<span id="notice"><a href="${path}/noti_servlet/list.do">공지사항</a></span>
	<span id="qna"><a href="${path}/solo/qna.jsp">Q & A</a> </span>
</nav>

<section>
	<img id="main" src="images/kakao1.png" width="100%">
</section>

<!-- 수정~~ -->

<h1 id="joinTitle">회 원 가 입</h1>
<hr>
<table class="joinInput">
	<tr>
		<td>아이디 </td>
		<td><input id="userid"> </td>
	</tr>
	<tr>
		<td>비밀번호 </td>
		<td><input type="password" id="passwd"> </td>
	</tr>
	<tr>
		<td>이름 </td>
		<td><input id="name"> </td>
	</tr>
	<tr>
		<td>이메일 </td>
		<td><input id="email"> </td>
	</tr>
	<tr>
		<td>휴대전화 </td>
		<td><input id="hp"> </td>
	</tr>
	<tr>
		<td>주소 </td>
		<td><input id="address"> </td>
	</tr>
	<tr height="30px"> </tr>
	<tr>
		<td colspan="2" rowspan="2"><button id="btnJoin" style="align:right;">가입하기</button></td>
	</tr>
</table>

<footer style="margin: 0px; padding: 20px;">
	카카오아이엑스 사업자등록번호 : 354-86-00070<br>
	통신판매업 신고번호 : 2017-서울강남-02573<br>
	대표이사 : 권승조<br>
	주소 : 서울특별시 강남구 테헤란로 521 파르나스타워, 27층<br>
	고객센터 : 1577-6263 / 평일 10시 ~ 18시<br>
	<a href="mailto:store@kakaofriends.com">store@kakaofriends.com<br> </a>
	글로벌 배송 문의 :<a href="mailto:global@kakaofriends.com">global@kakaofriends.com<br> </a>
	<p> </p>
	Copyright &copy; KAKAO IX CORP.
</footer>
</body>
</html>
