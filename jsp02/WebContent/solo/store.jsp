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
<!-- font Awesome -->
<script src="https://kit.fontawesome.com/a0fe62b208.js" crossorigin="anonymous"></script>
<style type="text/css">
#store{
font-weight: bold;
text-decoration: underline;
}
.fa-ul{margin-left: 0}
li {padding-bottom: 16px;}
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

<!-- 아래만 바꾸기 -->
	<div>
		<div class="store">
			<img src="images/gn.jpg" width="100%" height="100%">
			<h1>강남 플래그십 스토어</h1>
			<!-- 아이콘 -->
			<div>
				<ul class="fa-ul" style="margin-left: 0">
				  <li style="color: black;">
				 	 <span class="fa-li" style="position: static;">
				 	 <i class="fas fa-phone-alt fa-fw" style="color: gray;"></i>
				 	 </span>02-6494-1100 (매장), 02-596-9009 (3F 콰르텟 카페)
				  </li>
				  <li style="color: black;">
				 	 <span class="fa-li" style="position: static;">
				 	 <i class="far fa-clock fa-fw" style="color: gray;"></i>
				 	 </span>매일 10:30 - 22:00
				  </li>
				  <li style="color: black;">
				 	 <span class="fa-li" style="position: static;">
				 	 <i class="fas fa-map-marker-alt fa-fw" style="color: gray;"></i>
				 	 </span><a href="https://www.google.com/maps/place/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%94%84%EB%A0%8C%EC%A6%88+%ED%94%8C%EB%9E%98%EA%B7%B8%EC%8B%AD+%EC%8A%A4%ED%86%A0%EC%96%B4+%EA%B0%95%EB%82%A8+KAKAO+FRIENDS+Flagship+store+Gangnam/@37.5007662,127.0235965,17z/data=!3m1!4b1!4m5!3m4!1s0x357ca158e3eb7817:0x9477be46958f3844!8m2!3d37.5008429!4d127.0256816"
							target="_blank">서울 서초구 서초동 1305-7 유창빌딩 1~3층</a>
				  </li>
				</ul>
			</div>
		</div>
		<hr>
		<div class="store">
			<img src="images/hd.jpg" width="100%" height="100%">
			<h1>홍대 플래그십 스토어</h1>
			<div>
				<ul class="fa-ul" style="margin-left: 0">
				  <li style="color: black;">
				 	 <span class="fa-li" style="position: static;">
				 	 <i class="fas fa-phone-alt fa-fw" style="color: gray;"></i>
				 	 </span>02-6010-0104
				  </li>
				  <li style="color: black;">
				 	 <span class="fa-li" style="position: static;">
				 	 <i class="far fa-clock fa-fw" style="color: gray;"></i>
				 	 </span>매일 10:30 - 22:00
				  </li>
				  <li style="color: black;">
				 	 <span class="fa-li" style="position: static;">
				 	 <i class="fas fa-map-marker-alt fa-fw" style="color: gray;"></i>
				 	 </span><a href="https://www.google.com/maps/place/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%94%84%EB%A0%8C%EC%A6%88+%ED%99%8D%EB%8C%80+%ED%94%8C%EB%9E%98%EA%B7%B8%EC%8B%AD+%EC%8A%A4%ED%86%A0%EC%96%B4/@37.5554247,126.9167418,15z/data=!4m8!1m2!2m1!1z7ZmN64yAIO2UjOuemOq3uOyLrSDsiqTthqDslrQ!3m4!1s0x357c98c2e4a3edc7:0x140dd20564986561!8m2!3d37.5564418!4d126.9238083"
							target="_blank">서울 마포구 양화로 162 (동교동, 동교동대아빌딩) 좋은사람들빌딩 1~3층</a>
				  </li>
				</ul>
			</div>
		</div>
		<hr>
		<div class="store">
			<img src="images/bs.jpg" width="100%" height="100%">
			<h1>부산 플래그십 스토어</h1>
			<div>
				<ul class="fa-ul" style="margin-left: 0">
				  <li style="color: black;">
				 	 <span class="fa-li" style="position: static;">
				 	 <i class="fas fa-phone-alt fa-fw" style="color: gray;"></i>
				 	 </span>051-256-0815
				  </li>
				  <li style="color: black;">
				 	 <span class="fa-li" style="position: static;">
				 	 <i class="far fa-clock fa-fw" style="color: gray;"></i>
				 	 </span>매일 10:30 - 22:00
				  </li>
				  <li style="color: black;">
				 	 <span class="fa-li" style="position: static;">
				 	 <i class="fas fa-map-marker-alt fa-fw" style="color: gray;"></i>
				 	 </span><a href="https://www.google.com/maps/place/%EC%B9%B4%EC%B9%B4%EC%98%A4%ED%94%84%EB%A0%8C%EC%A6%88+%EB%B6%80%EC%82%B0+%ED%94%8C%EB%9E%98%EA%B7%B8%EC%8B%AD%EC%8A%A4%ED%86%A0%EC%96%B4/@35.0990376,129.0294186,17z/data=!4m12!1m6!3m5!1s0x3568e90adde9576d:0x6f9203ac6a3b9cb8!2z7Lm07Lm07Jik7ZSE66CM7KaIIOu2gOyCsCDtlIzrnpjqt7jsi63siqTthqDslrQ!8m2!3d35.0990289!4d129.031608!3m4!1s0x3568e90adde9576d:0x6f9203ac6a3b9cb8!8m2!3d35.0990398!4d129.0316086"
								target="_blank">부산 중구 광복로 62 (광복동2가)</a>
				  </li>
				</ul>
			</div>
		</div>
		<hr>
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