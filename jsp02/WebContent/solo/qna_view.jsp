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
#qna {
	font-weight: bold;
	text-decoration: underline;
}

table {
	margin-bottom: 50px;
	margin-top: 50px;
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
textarea{
	padding: 20px;
	resize: unset;
	font-size: 15px;
}
</style>
<script type="text/javascript">
$(function(){
	comment_list();
	$("#btnSave").click(function(){
				var writer=$("#writer");
				var content=$("#content");
				if(writer.val()==""){
					alert("작성자를 입력하세요");
					writer.focus();
					return;
				} if(content.val()==""){
					alert("내용을 입력하세요");
					content.focus();
					return;
				}
		comment_add();
		});
	$("#btnList").click(function(){
		location.href="${path}/qna_servlet/list.do";
	});	
	$("#btnReply").click(function(){
		document.form1.action="${path}/qna_servlet/Qreply.do";
		document.form1.submit();
	});
	$("#btnEdit").click(function(){
		document.form1.action="${path}/qna_servlet/Qpass_check.do";
		document.form1.submit();
	});
});
function comment_add(){
	var param="board_num=${dto.num}&writer="+$("#writer").val()
				+"&content="+$("#content").val();
	$.ajax({
		type: "post",
		url: "${path}/qna_servlet/Qcomment_add.do",
		data: param,
		success: function(){
			$("#writer").val("");
			$("#content").val("");
			comment_list();
		}
	});
}

function comment_list(){
	//백그라운드로 서버 호출
	$.ajax({
		type: "post",
		url: "${path}/qna_servlet/QcommentList.do",
		data: "num=${dto.num}",
		success: function(result){
			$("#commentList").html(result);
		}
	});
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

<div style="margin-top: 100px;">
<form name="form1" method="post">
	<table border="1" width="50%">
		<tr>
			<td>날짜</td>
			<td>${dto.reg_date }</td>
			<td>조회수</td>
			<td>${dto.readcount }</td>
		</tr>
		<tr>
			<td>작성자 </td>
			<td colspan="3">${dto.writer }</td>
		</tr>
		<tr>
			<td>제목 </td>
			<td colspan="3">${dto.subject }</td>
		</tr>
		<tr>
			<td>본문 </td>
			<td colspan="3">${dto.content }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td colspan="3">
				<input type="password" name="passwd" id="passwd" 
				style="width: 150px; height: 16px; all:unset;">
				<c:if test="${param.message=='error' }">
					<span style="color: red; padding: 0;">비밀번호가 일치하지 않습니다.</span>
				</c:if>
			 </td>
		</tr>
	</table>
<input type="hidden" name="num" value="${dto.num}" class="button">
<input type="button" value="수정/삭제" id="btnEdit" class="button">
<input type="button" value="답변" id="btnReply" class="button">
<input type="button" value="목록" id="btnList" class="button">
</form>
</div>
<!-- 댓글 쓰기 폼 -->
<div>
<table width="700px" style="margin-bottom: 0;">
	<tr>
		<td style="font-size: 21px; font-weight: bold; text-align: left;"><hr>댓글쓰기</td>
	</tr>
  <tr>
    <td colspan="3" style="text-align: left; padding-bottom: 0;">
    	<input id="writer" placeholder="작성자"  style="padding: 6px;">
    </td>
  </tr>
  <tr>
    <td colspan="2" style="padding-top: 5px;">
     <textarea rows="5" cols="80" placeholder="내용을 입력하세요" id="content"></textarea>
    </td>
    <td>
      <button id="btnSave" type="button" class="button">확인</button>
    </td>
  </tr>
</table>
</div>

<!-- 댓글 목록을 출력할 영역 -->
<div id="commentList"></div>

<footer style="margin: 150px 0 0 0; padding: 20px;">
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