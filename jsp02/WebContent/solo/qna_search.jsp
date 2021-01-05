<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script src="../include/jquery-3.5.1.min.js"></script>
<link href="${path }/solo/css/style.css" rel="stylesheet"
	type="text/css">
<style type="text/css">
#btnWrite{
padding: 5px 10px 5px 10px;
}
#qna {
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
	$(function() {
		$("#btnWrite").click(function() {
			location.href = "${path}/solo/qna_write.jsp";
		});
	});
</script>

</head>
<body>
	<div id="coner">
		<a id="co_h" href="${path}/solo/main.jsp">MAIN </a>| <a id="co_l"
			href="${path}/solo/login.jsp">LOGIN </a>| <a id="co_j"
			href="${path}/solo/join.jsp">JOIN </a>
	</div>

	<h1>
		<a id="header" href="${path}/solo/main.jsp">KAKAO FRIENDS</a>
	</h1>
	<nav id="menu">
		<span id="introduce"><a href="${path}/solo/introduce.jsp">캐릭터
				소개</a></span> <span id="store"><a href="${path}/solo/store.jsp">매장소개</a></span>
		<span id="notice"><a href="${path}/noti_servlet/list.do">공지사항</a></span>
		<span id="qna"><a href="${path}/qna_servlet/list.do">Q & A</a>
		</span>
	</nav>
<div style="padding: 50px 0 10px 57%;">
<button id="btnWrite">글쓰기</button>
</div>

	<table border="1" width="60%">
  <tr>
    <th>번호</th>
    <th>작성자</th>
    <th>제목</th>
    <th>날짜</th>
    <th>조회수</th>
  </tr>
<c:forEach var="dto" items="${list}">
 <c:choose>
  <c:when test="${dto.show == 'y'}">
  <tr>
    <td>${dto.num}</td>
    <td>${dto.writer}</td>
    <td>
    <!-- 답글 들여쓰기 -->
    <c:forEach var="i" begin="1" end="${dto.re_level}">
      &nbsp;&nbsp;
    </c:forEach>
    <a href="${path}/qna_servlet/Qview.do?num=${dto.num}">
    ${dto.subject}</a>
    <!-- 댓글개수 표시 -->
    <c:if test="${dto.comment_count > 0 }">
      <span style="font-weight: bold;">(${dto.comment_count})</span>
    </c:if>  
    </td>
    <td>${dto.reg_date}</td>
    <td>${dto.readcount}</td>
  </tr>
  </c:when>
  <c:otherwise>
   <tr>
     <td colspan="5" align="center">삭제된 게시물입니다. </td>
   </tr>
  </c:otherwise>
 </c:choose> 
</c:forEach> 
</table>

<div style="margin-bottom: 200px;">
<form name="form1" method="post" action="${path }/qna_servlet/Qsearch.do">
		<select name="search_option">
			<c:choose>
				<c:when test="${search_option =='writer' }">
					<option value="writer" selected>작성자</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
					<option value="all">작성자+제목+내용</option>
				</c:when>
				<c:when test="${search_option =='subject' }">
					<option value="writer">작성자</option>
					<option value="subject" selected>제목</option>
					<option value="content">내용</option>
					<option value="all">작성자+제목+내용</option>
				</c:when>
				<c:when test="${search_option =='content' }">
					<option value="writer">작성자</option>
					<option value="subject">제목</option>
					<option value="content" selected>내용</option>
					<option value="all">작성자+제목+내용</option>
				</c:when>
				<c:when test="${search_option =='all' }">
					<option value="writer">작성자</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
					<option value="all" selected>작성자+제목+내용</option>
				</c:when>
			</c:choose>
		</select>
		<input name="keyword" value="${keyword}">
		<button id="btnSearch">검색</button>
	</form>
</div>
	<footer style="margin: 50px 0 0 0; padding: 20px;">
		카카오아이엑스 사업자등록번호 : 354-86-00070<br> 통신판매업 신고번호 : 2017-서울강남-02573<br>
		대표이사 : 권승조<br> 주소 : 서울특별시 강남구 테헤란로 521 파르나스타워, 27층<br> 고객센터
		: 1577-6263 / 평일 10시 ~ 18시<br> <a
			href="mailto:store@kakaofriends.com">store@kakaofriends.com<br>
		</a> 글로벌 배송 문의 :<a href="mailto:global@kakaofriends.com">global@kakaofriends.com<br>
		</a>
		<p></p>
		Copyright &copy; KAKAO IX CORP.
	</footer>
</body>
</html>