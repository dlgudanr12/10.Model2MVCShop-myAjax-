<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

<title>열어본 상품 보기</title>

</head>
<body>
	당신이 열어본 상품을 알고 있다
	<br>
	<br>

	<c:if test="${cookie.history.name =='history' }">
		<c:set var="hSplit" value="${fn:split(cookie.history.value,'/') }" />
		<c:forEach var="h" items="${hSplit }">
			<c:set var="noNameSplit" value="${fn:split(h,':') }" />
			<a href="/getProduct.do?prodNo=${noNameSplit[0]}&menu=search"
				target="rightFrame">${noNameSplit[1]}</a>
			<br />
		</c:forEach>
	</c:if>

</body>
</html>