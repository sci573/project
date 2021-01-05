<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
1) JSTL(Jsp Standard Tag Library, JSP 표준 라이브러리)
2) 사용하는 이유: model1 방식은 jsp페이지 중심, model2 방식은 java코드(서블릿, 모델(dao,dto)) 중심.
				  jsp 웹페이지에서는 java코드를 안 쓸 수는 없지만 이를 최소화 하기 위해 JSTL과 EL기법을 씀.
				  즉, jsp 내부에 복잡한 자바 코드를 대체하기 위한 태그를 쓰게 됨.
3) taglib prefix="태그 접두어" uri="태그 라이브러리의 식별자"	  
4) "c" => Core tag : 핵심 태그, 제일 자주 사용되는 태그들. 태그 접두어로 접근
	ex) prefix="c"
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- var="변수명" values="값" -->
<c:set var="path" value="${pageContext.request.contextPath}" />

<%-- <% String path=request.getContextPath(); %> 
위 코드가 워낙 자주 쓰여져서 header에 넣고 include시킴 또한 위코드
보다 JSTL로 변환해서 쓰는게 더 유용함.--%>
