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
<style type="text/css">
textarea{
	padding: 20px;
	border-style: none;
	resize: unset;
	font-size: 15px;
}
input{all:unset;}
#notice{
	font-weight: bold;
	text-decoration: underline;
}
table{
	margin-bottom: 50px;
    margin-top: 50px;
    margin-left: auto;
    margin-right: auto;
    border-color: white;
    border-spacing: unset;
    font-size: 15px;
}
td{padding: 20px;}

.button{
	border-style: outset;
    border-color: #f2f2f2;
    background-color: #f2f2f2;
    border-radius: 10px;
    padding: 3px 7px 3px 7px;
    font-size: 13px;
    color:#4d4d4d;
}
</style>
<script type="text/javascript">
function up(){
	var form1=$("#form1");
	var name=$("#name");
	var passwd=$("#passwd");
	var content=$("#content");
	if(name.val()==""){
		alert("이름을 입력하세요");
		name.focus();
		return;
	}if(passwd.val()==""){
		alert("비밀번호를 입력하세요");
		passwd.focus();
		return;
	} if(content.val()==""){
		alert("내용을 입력하세요");
		content.focus();
		return;
	}	
	document.form1.action="${path}/noti_servlet/NOupdate.do";
	document.form1.submit();
}

function del(){
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/noti_servlet/NOdelete.do";
		document.form1.submit();
	}
}
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
<nav id="menu">
	<span id="introduce"><a href="${path}/solo/introduce.jsp">캐릭터 소개</a></span>
	<span id="store"><a href="${path}/solo/store.jsp">매장소개</a></span>
	<span id="notice"><a href="${path}/noti_servlet/list.do">공지사항</a></span>
	<span id="qna"><a href="${path}/qna_servlet/list.do">Q & A</a> </span>
</nav>

<div style="margin-bottom: 200px; margin-top: 100px;">
<form name="form1" id="form1" method="post">
<table border="1" width="60%">
<tr>
    <td>이름 </td>
    <td><input name="name" id="name" size="40" value="${dto.name}"> </td>
</tr>
  <tr>
  <tr>
    <td>비밀번호 </td>
    <td><input type="password" name="passwd" id="passwd" size="40"> </td>
  </tr>
  <tr align="center">
    <td colspan="2">
      <textarea rows="10" cols="100"  name="content" id="content">${dto.content}</textarea>
    </td>
  </tr>
  <tr align="center">
  </tr>
</table>
    <!-- 수정,삭제를 위한 게시물번호를 hidden tag에 저장 -->
      <input type="hidden" name="idx" value="${dto.idx}" class="button">
      <span>
	      <input type="button" value="수정" onclick="up()" class="button">
      </span>
      <span>
    	  <input type="button" value="삭제" onclick="del()" class="button">
      </span>
      <span>
      	<input type="button" value="목록" onclick="location.href='${path}/noti_servlet/list.do'" class="button">
      </span>
</form>
</div>

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