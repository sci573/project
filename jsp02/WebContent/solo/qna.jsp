<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>
<link href="${path }/solo/css/style.css" rel= "stylesheet"  type="text/css">
<style type="text/css">
#btnWrite{
padding: 5px 10px 5px 10px;
}
#qna{
font-weight: bold;
text-decoration: underline;
}
table {
	margin-bottom: 50px;
	margin-left: auto;
	margin-right: auto;
	border-color: white;
	border-spacing: unset;
	font-size: 15px;
}

td {padding: 20px 5px 20px 5px;}

.button {
	border-style: outset;
	border-color: #f2f2f2;
	background-color: #f2f2f2;
	border-radius: 10px;
	padding: 3px 7px 3px 7px;
	font-size: 13px;
	color: #4d4d4d;
}
</style>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/solo/qna_write.jsp";
	});
});

//클릭한 페이지로 이동
function list(page){
	location.href
		="${path}/qna_servlet/list.do?curPage="+page;
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

<div style="padding: 50px 0 10px 57%;">
<button id="btnWrite">글쓰기</button>
</div>

<table border="1" width="60%">
  <tr>
    <th>번호 </th>
    <th>작성자 </th>
    <th>제목 </th>
    <th>날짜 </th>
    <th>조회수 </th>
  </tr>
<c:forEach var="dto" items="${list}">
  <tr>
    <c:if test="${dto.re_level == 0}">
   	 <td>${dto.num}</td>
    </c:if>
    <c:if test="${dto.re_level > 0}">
   	 <td>답변</td>
    </c:if>
    <td>${dto.writer}</td>
    <td><a href="${path}/qna_servlet/Qview.do?num=${dto.num}">
    	${dto.subject}</a>
	    <!-- 댓글개수 표시 -->
	    <c:if test="${dto.comment_count > 0 }">
	      <span style="font-weight: bold;">(${dto.comment_count})</span>
	    </c:if>  
    </td>
    <td>${dto.reg_date}</td>
    <td>${dto.readcount}</td>
  </tr>
</c:forEach> 
</table>
	<!-- 페이지 네비게이션 출력 -->	
	<div style="padding: 40px;">
		<div colspan="7" align="center">
			<c:if test="${page.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${page.curBlock > 1}">
				<a href="#" onclick="list('${page.prevPage}')">[이전]</a>
			</c:if>
			<c:forEach var="num" begin="${page.blockStart}"
				end="${page.blockEnd}">
				<c:choose>
					<c:when test="${num == page.curPage }">
						<span style="font-weight:bold;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.curBlock < page.totBlock}">
				<a href="#" 
					onclick="list('${page.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${page.curPage < page.totPage}">
				<a href="#" 
					onclick="list('${page.totPage}')">[끝]</a> 
			</c:if>
		</div>
	</div>		
<div style="margin-bottom: 200px;">
<form name="form1" method="post" id="form1" action="${path}/qna_servlet/Qsearch.do">
<select name="search_option">
  <option value="writer">작성자 </option>
  <option value="subject">제목 </option>
  <option value="content">내용 </option>
  <option value="all">작성자+제목+내용 </option>
</select>
<input name="keyword">
<button id="btnSearch">검색</button>
</form>
</div>


<footer style="margin: 50px 0 0 0px; padding: 20px;">
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