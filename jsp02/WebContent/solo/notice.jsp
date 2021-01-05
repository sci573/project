<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function search_f(){
	document.form1.action="${path}/noti_servlet/list.do";
	document.form1.submit();
}
</script>
<link href="${path}/solo/css/style.css" rel= "stylesheet"  type="text/css">
<style type="text/css">
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
    font-size: 14px;
}
tr{
	border-color: white;
	background-color: #f2f2f2;
}
td{
	padding: 5px;
	background-color: #f2f2f2;
}

#내용{
	font-size: 16px;
	font-style: bold;
}
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

<c:forEach var="dto" items="${list}">
<form method="post" action="${path}/noti_servlet/NOcheck.do">
<!-- 편집을 위해서는 게시물 번호가 필요함 -->
<table border="1" width="60%">
 <tr>
	<td><input name="idx" value="${dto.idx}" style="all:unset; text-align: left; width: 10px;"></td>
    <td style="text-align: right;" colspan="2">${dto.post_date}</td>
  </tr>
  <tr>
     <% pageContext.setAttribute("newLineChar", "\n"); %>
    <th colspan="3" height="100px;" id="내용"
     style="padding: 20px 100px 20px 100px; background-color: white;">${dto.content}</th>
  </tr>
  <tr>
 	 <td colspan="2" style="width: 10px;">작성자&nbsp;:&nbsp;${dto.name}</td>
   	 <td  style="text-align: right">
      비밀번호&nbsp;<input type="password" name="passwd" style="width:50px;">
      <input type="submit" value="수정/삭제">
  </tr>
</table>
</form>
</c:forEach>

<!-- 검색폼  -->
<div style="margin-bottom: 200px;">
<form name="form1" id="form1" method="post">
<select name="searchkey" id="searchkey">
<c:choose>
  <c:when test="${searchkey == 'name'}">
	  <option value="name" selected>이름 </option>
	  <option value="content">내용 </option>
	  <option value="name_content">이름+내용 </option>
  </c:when>
  <c:when test="${searchkey == 'content'}">
	  <option value="name">이름 </option>
	  <option value="content" selected>내용 </option>
	  <option value="name_content">이름+내용 </option>
  </c:when>
  <c:when test="${searchkey == 'name_content'}">
	  <option value="name">이름 </option>
	  <option value="content">내용 </option>
	  <option value="name_content" selected>이름+내용 </option>
  </c:when>
</c:choose>  
</select>
<input name="search" id="search" value="${search}">
<input type="button" value="조회" onclick="search_f()">
<input type="button" value="글쓰기" onclick="location.href='${path}/solo/noti_write.jsp'">
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