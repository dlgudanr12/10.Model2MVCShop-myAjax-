<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	function fncGetList(currentPage) {
		/* 
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit(); */
		$('#currentPage').val(currentPage)
		$("form").attr("method", "post").attr("action",
				"/purchase/listPurchase").submit();
	}
	$(function() {
		$('tr.ct_list_pop').each(function(index) {
			$("tr.ct_list_pop:nth-child("+(2*index+4)+") td:contains('물건도착')").on("click",function() {
				var tranNo = $("tr.ct_list_pop:nth-child("+(2*index+4)+") td:nth-child(3)").text().trim();
				var tranCode = $("tr.ct_list_pop:nth-child("+(2*index+4)+") td:last input").val();
				//alert(tranNo + "/" + tranCode);
				$.ajax("/purchaseRest/json/updateTranCode/"+ tranNo+ "/"+ tranCode,{
					method : "GET",
					dataType : "json",
					headers : {
						"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							//alert(JSONData.success);
							$("tr.ct_list_pop:nth-child(" + (2 * index + 4) + ") td:last").empty();
							$("tr.ct_list_pop:nth-child(" + (2 * index + 4) + ") td:nth-child(15)").text("배송완료");
							}
						})
					})
				})
			});
												/* const currentPage="${resultPage.currentPage}";
												var userId="${user.userId}";
													alert(currentPage+"/"+userId) 
												 $.ajax("/purchaseRest/json/listPurchase",{
												method : "POST",
												dataType : "text",
												headers : {
													"Content-Type" : "application/json"
												},
												data : JSON.stringify({
												currentPage : currentPage,
												userId : userId
												}),
												success : function(serverData,status){
												alert(status+"\n server로 부터 받은 내용 : " + serverData);
												var JSONData=$.parseJSON(serverData);
												alert("JSONData : \n" + JSONData);
												}
												}) 

												 $.ajax("/purchaseRest/json/listPurchase",{
													method : "POST",
												data : JSON.stringify({
													currentPage : currentPage,
													userId : userId
												}),
												dataType : "json",
												headers : {
													"Content-Type" : "application/json"
												},
												success : function(JSONData,status){
													alert("JSONData : \n" + JSONData);
													var serverData=$.stringify(JSONData);
													alert(status+"\n server로 부터 받은 내용 : " + serverData);
													}
												})

												 $.post("/purchaseRest/json/listPurchase", 
														JSON.stringify({
														currentPage : currentPage,
														userId : userId
													}),
													function(JSONData,status){
														alert("JSONData : \n" + JSONData);
														var serverData=$.stringify(JSONData);
														alert(status+"\n server로 부터 받은 내용 : " + serverData);
													}, "text") // 기본 헤더가 쿼리 스트링이다.
											})
						})
	});*/
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" >

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">구매 목록조회</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr class="currentPage">
					<td colspan="11"><input type="hidden" value="${resultPage.currentPage }"/>
					전체 ${resultPage.maxPage } 건수, 현재 ${resultPage.currentPage } 페이지
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="30">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" >배송번호</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="80">회원ID</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="80">회원명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">상품수량</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">전화번호</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">배송현황</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">정보수정</td>
				</tr>
				<tr>
					<td colspan="17" bgcolor="808285" height="1"></td>
				</tr>

				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list }">
					<c:set var="i" value="${i+1 }" />
					<tr class="ct_list_pop">
						<td align="center">${i }</td>
						<td></td>
						<td align="left"><a
							href="/purchase/getPurchase/${purchase.tranNo }/search">${purchase.tranNo }</a>
						</td>
						<td></td>
						<td align="left">${purchase.buyer.userId }
						</td>
						<td></td>
						<td align="left">${purchase.receiverName }</td>
						<td></td>
						<td align="left">${purchase.purchaseProd.prodName }</td>
						<td></td>
						<td align="left">${purchase.tranQuantity }</td>
						<td></td>
						<td align="left">${purchase.receiverPhone }</td>
						<td></td>
						<td align="left"> 
							<c:if test="${purchase.tranCode=='1' }">구매완료
								<a href="/purchase/updatePurchase/${purchase.tranNo }">구매 수정</a></c:if>
							<c:if test="${purchase.tranCode=='2' }">배송중</c:if> 
							<c:if test="${purchase.tranCode=='3' }">배송완료</c:if>
						</td>
						<td></td>
						<td align="left"><input type="hidden" value="${purchase.tranCode }"/>
						<c:if test="${purchase.tranCode=='2' }">
								<!-- <a
									href="/purchase/updateTranCode/${purchase.tranNo }/${purchase.tranCode }">물건도착</a> -->
									물건도착
							</c:if></td>
					</tr>
				<tr>
					<td colspan="17" bgcolor="D6D7D6" height="1"></td>
				</tr>
				</c:forEach>

			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" />
						<jsp:include page="../common/pageNavigatorDefault.jsp"/>
					</td>
				</tr>
			</table>

			<!--  페이지 Navigator 끝 -->
		</form>

	</div>

</body>
</html>