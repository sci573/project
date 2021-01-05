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
*{margin: 30px 0 30px 0;}

td em{
	font-family: 'Do Hyeon', sans-serif;
	font-size: 18pt;
}

td div{
	color: #949494;
}

#introduce{
	font-weight: bold;
	text-decoration: underline;

}
td h2{
	text-shadow: 1px 1px 0px #f2f2f2;
	font-family: 'Jua', sans-serif; 
	font-size: 30pt;
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

<section id="int">
	<table id="intContent">
	<tr>
		<td align="center"><img src="images/j.png"></td>
		<td>
			<h2> 제이지</h2>
			<em>힙합을 사랑하는 자유로운 영혼 </em>
	<div>땅속 나라 고향에 대한 향수병이 있는 비밀요원 제이지! <br>
사명의식이 투철하여 냉철해보이고 싶으나, 실은 어리버리합니다. <br>
겉모습과 달리 알고보면 외로움을 많이 타는 여린 감수성의 소유자. <br>
힙합 가수 Jay-Z의 열혈팬입니다.</div>
		</td>
	</tr>
	<tr align="center">
		<td><img src="images/t.png"> </td>
		<td>
		<h2> 튜브</h2>
			<em>겁 많고 마음 약한 오리 튜브</em><br>
	<div>겁 많고 마음 약한 오리 튜브는 극도의 공포를 느끼면 미친 오리로
변신합니다. <br>작은 발이 콤플렉스이기 때문에 큰 오리발을 착용합니다.</div>
		</td>
	</tr>
	<tr>
		<td colem="1"><img src="images/m.png"> </td>
		<td>
		<h2>무지&콘</h2>
			<em>토끼 옷을 입은 단무지인 무지와 정체불명 콘</em><br>
	<div>호기심 많은 장난꾸러기 무지의 정체는 사실 토끼 옷을 입은 단무지!<br>
		토끼 옷을 벗으면 부끄러움을 많이 탑니다.<br>
		단무지를 키워 무지를 만든 정체불명의 악어 콘!<br>
		이제는 복숭아를 키우고 싶어 어피치를 찾아 다닙니다.</div>
		</td>
	</tr>
	<tr>
		<td><img src="images/r.png"> </td>
		<td>
		<h2> 라이언</h2>
			<em>갈기가 없는 것이 콤플렉스인 수사자</em><br>
	<div>큰 덩치와 무뚝뚝한 표정으로 오해를 많이 사지만, <br>
			사실 누구보다도 여리고 섬세한 소녀감성을 지닌 반전 매력의 소유자!<br>
			원래 아프리카 둥둥섬 왕위 계승자였으나, 자유로운 삶을 동경해 탈출! <br>
			카카오프렌즈의 든든한 조언자 역할을 맡고 있습니다.<br>
			꼬리가 길면 잡히기 때문에, 꼬리가 짧습니다.</div>
		</td>
	</tr>
	<tr>
		<td><img src="images/a.png"> </td>
		<td>
		<h2> 어피치</h2>
			<em>복숭아 나무에서 탈출한 악동 복숭아</em><br>
	<div>유전자 변이로 자웅동주가 된 것을 알고 복숭아 나무에서 탈출한 악동 복숭아 어피치!<br>
			섹시한 뒷태로 사람들을 매혹시키며,
			성격이 매우 급하고 과격합니다.</div>
		</td>
	</tr>
	<tr>
		<td><img src="images/n.png">
		<td>
		<h2>네오&프로도</h2>
			<em>부잣집 도시개 프로도와 패셔니스타 네오</em><br>
	<div>프로도와 네오는 카카오프렌즈 공식 커플로 알콩달콩 깨볶는 중!<br>
			부잣집 도시개 프로도는 사실 잡종. <br> 태생에 대한 콤플렉스가 많습니다.<br>
			자기 자신을 가장 사랑하는 새침한 고양이 네오. <br> 쇼핑을 좋아하는
			이 구역의 대표 패셔니스타입니다. <br>하지만 도도한 자신감의 근원이
			단발머리 ‘가발’에서 나온다는 건 비밀!</div>
		</td>
	</tr>
	</table>
</section>
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