<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>
<link href="${path}/solo/css/style.css" rel= "stylesheet"  type="text/css">
<script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		var writer=$("#writer");
		var passwd=$("#passwd");
		var content=$("#content");
		var subject=$("#subject");
		if(writer.val()==""){
			alert("작성자를 입력하세요");
			writer.focus();
			return;
		}if(passwd.val()==""){
			alert("비밀번호를 입력하세요");
			passwd.focus();
			return;
		} if(content.val()==""){
			alert("내용을 입력하세요");
			content.focus();
			return;
		}	if(subject.val()==""){
			alert("제목을 입력하세요");
			subject.focus();
			return;
		}
		document.form1.action="${path}/qna_servlet/Qinsert.do";
		document.form1.submit();
	});
});

</script>
<style type="text/css">
#qna{
font-weight: bold;
text-decoration: underline;
}

textarea{
	padding: 20px;
	border-style: none;
	resize: unset;
	font-size: 15px;
}
input{all:unset;}

table{
	margin-bottom: 50px;
    margin-top: 50px;
    margin-left: auto;
    margin-right: auto;
    border-color: white;
    border-spacing: unset;
    font-size: 15px;
}
td {padding: 20px 5px 20px 5px;}

.button{
	border-style: outset;
    border-color: #f2f2f2;
    background-color: #f2f2f2;
    border-radius: 10px;
    padding: 3px 7px 3px 7px;
    font-size: 13px;
    color:#4d4d4d;
}
h2{margin-top: 70px;}
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
	<span id="qna"><a href="${path}/qna_servlet/list.do">Q & A</a> </span>
</nav>

<h2>문의하기</h2>
<div style="margin-bottom: 200px; margin-top: 100px;">
<form name="form1" method="post">
<table border="1" width="60%">
	<tr>
		<td>작성자 </td>
		<td><input name="writer" id="writer"
		style="width: 500px; height: 16px;"></td>
	</tr>
	<tr>
		<td>제목 </td>
		<td><input name="subject" id="subject" size="60"
		style="width: 500px; height: 16px;"></td>
	</tr>
	<tr>
		<td colspan="2"><textarea rows="10" cols="100" name="content" id="content"></textarea> </td>
	</tr>
	<tr>
		<td>비밀번호 </td>
		<td><input name="passwd" id="passwd" type="password"		
		style="width: 500px; height: 16px;"> </td>
	</tr>
</table>
	<input value="확인" class="button" type="button" id="btnSave">
</form>
</div>

<footer style="margin: 50px 0 0 0; padding: 20px;">
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