<%@ page contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%
List<Product> list = (List<Product>) request.getAttribute("list");
Page resultPage = (Page) request.getAttribute("resultPage");
Search search = (Search) request.getAttribute("search");

String searchCondition = CommonUtil.null2str(search.getSearchCondition());
String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%> --%>

<html>
<head>
<meta charset="euc-kr" />
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"
	integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		//document.detailForm.submit();

		$('#currentPage').val(currentPage);
		$("form").attr("method", "post").attr("action",
				"/product/listProduct/${menu }").submit();
	}
	/* function updateQuantity() {
		var newQuantity = $("#prodQuantityInput").val();

		$.ajax({
			url : "/updateQuantity.do",
			type : "GET",
			data : {
				prodNo : "${product.prodNo}",
				prodQuantity : newQuantity,
				currentPage : "${search.currentPage}",
				searchCondition : "${search.searchCondition}",
				searchKeyword : "${search.searchKeyword}"
			},
			success : function(response) {
				// 성공적인 응답 처리
				console.log(response);
			},
			error : function(error) {
				// 오류 처리
				console.error(error);
			}
		});
	} */

	$(function() {
		//console.log($("tr.ct_list_pop td:nth-child(3)"));
		$('tr.ct_list_pop').each(
				function(index) {
					$(
							"tr.ct_list_pop:nth-child(" + (2 * index + 4)
									+ ") td:nth-child(3)").on(
							"click",
							function() {
								var prodNo = $(
										"tr.ct_list_pop:nth-child("
												+ (2 * index + 4)
												+ ") td:nth-child(3) input")
										.val();
								var menu = "${menu}";
								//alert(prodNo + "/" + menu);
								self.location = "/product/getProduct/" + prodNo
										+ "/" + menu;
							})
				})

		/* $.ajax("/productRest/json/listProduct",
				{
					method : "POST",
					dataType : "json",
					headers : {
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status) {
						//alert(JSONData.success);
						$(
								"tr.ct_list_pop:nth-child(" + (2 * index + 4)
										+ ") td:last").empty();
						$(
								"tr.ct_list_pop:nth-child(" + (2 * index + 4)
										+ ") td:nth-child(15)").text("배송완료");
					}
				}) */

		/* $("input[name='searchKeyword']").autocomplete({
			source : [ "Apple", "Banana", "Cherry", "Date", "Fig", "Grape" ]
		}) */

		var maxPage = $("input.maxPage").val();
		var pageSize = $("input.pageSize").val();
		var currentPage = $("input.currentPage").val();
		var searchCondition = $("input.searchCondition").val();
		var searchKeyword = $("input.searchKeyword").val();
		var searchOrderBy = $("input.searchOrderBy").val();
		var searchPriceLowerLimit = $("input.searchPriceLowerLimit").val();
		var searchPriceUpperLimit = $("input.searchPriceUpperLimit").val();
		console.log("maxPage : " + maxPage
				+"\n pageSize : " + pageSize
				+"\n currentPage : " + currentPage
				+"\n searchCondition : " + searchCondition
				+"\n searchKeyword : " + searchKeyword
				+"\n searchOrderBy : " + searchOrderBy
				+"\n searchPriceLowerLimit : " + searchPriceLowerLimit
				+"\n searchPriceUpperLimit : " + searchPriceUpperLimit);
		
		/* $( "tfoot.a:last" ).after( $( "tfoot.a:first" ).clone() ); */
		var last=$(window).height()-$(window.parent.frames["leftFrame"]).height();
		console.log($(window.parent).height()+"/"+$(window.parent.frames["rightFrame"]).height()+"/"+$(window.parent.frames["topFrame"]).height()+"/"+$(window.parent.frames["leftFrame"]).height()+"/"+$($(window)) );
		if(currentPage<=maxPage){
		$( window ).on( "scroll", function() {
			
			if ( $(window).scrollTop() ==  last) {
				++currentPage
				console.log(currentPage);
				//$( "tfoot.a:last" ).after( $( "tfoot.a:first" ).clone() );
				$.ajax("/productRest/json/listProduct",
				{
					method : "POST",
					dataType : "json",
					headers : {
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						currentPage : currentPage
					}),
					success : function(JSONData, status) {
						/* console.log(JSONData);
						var serverData=JSON.stringify(JSONData);
						console.log(serverData); */
			            let i=(currentPage-1)*pageSize;
						 $.each(JSONData.list, function(index, product) {
					            // 여기서 index는 배열의 인덱스이고, item은 각 요소를 나타냅니다
					            ++i;
					            console.log("Index: " + index + ", Item: " + JSON.stringify(product));
					            var quantityText = "";
					            if (product.prodQuantity != 0) {
					            	quantityText = "판매 중";
					            } else {
					            	quantityText = "재고 없음";
					            }
					            var textPop="<tr class='ct_list_pop'>"
								+"<td align='center' height='200'>"+i+"</td>"
								+"<td></td>"
								+"<td align='left'><input value='"+product.prodNo+"'"
									+"type='hidden' /> "+product.prodName+"</td>"
								+"<td></td>"
								+"<td align='left'>"+product.price+"</td>"
								+"<td></td>"
								+"<td align='left'>"+product.regDate+"</td>"
								+"<td></td>"
								/* +"<td align='left'><c:if test='"+product.prodQuantity+"!=0'> 판매 중 </c:if>"
								+"<c:if test='"+product.prodQuantity+"==0'> 재고 없음 </c:if></td>" */
								+"<td align='left'>"+quantityText+"</td>"
								+"<td></td>"
								+"<td align='left'>"+product.prodQuantity+"개</td>"
							+"</tr>";
							var textPop2="<tr>"
								+"<td colspan='11' bgcolor='D6D7D6' height='1'></td>"
							+"</tr>";
					            $( "tr.ct_list_pop:last" ).after(textPop).after(textPop2);
								
								$('tr.ct_list_pop').each(
										function(index) {
											$(
													"tr.ct_list_pop:nth-child(" + (2 * index + 4)
															+ ") td:nth-child(3)").on(
													"click",
													function() {
														var prodNo = $(
																"tr.ct_list_pop:nth-child("
																		+ (2 * index + 4)
																		+ ") td:nth-child(3) input")
																.val();
														var menu = "${menu}";
														self.location = "/product/getProduct/" + prodNo
																+ "/" + menu;
													})
										})
						 });
					}
				})
				window.scrollTo(0, last);
			}	 	 
			last=$(window).height()-$(window.parent.frames["leftFrame"]).height();
		})
		}

		/*  $( "span" ).css( "display", "inline" ).fadeOut( "slow" ); */
	});
</script>

</head>

<body bgcolor="#ffffff" text="#000000">
	<input class="maxPage" type="hidden" value=" ${resultPage.maxPage}" />
	<input class="pageSize" type="hidden" value=" ${resultPage.pageSize}" />
	<input class="currentPage" type="hidden" value=" ${search.currentPage}" />
	<input class="searchCondition" type="hidden" value=" ${search.searchCondition}" />
	<input class="searchKeyword" type="hidden" value=" ${search.searchKeyword}" />
	<input class="searchOrderBy" type="hidden" value=" ${search.searchOrderBy}" />
	<input class="searchPriceLowerLimit" type="hidden" value=" ${search.searchPriceLowerLimit}" />
	<input class="searchPriceUpperLimit" type="hidden" value=" ${search.searchPriceUpperLimit}" />

	<div style="width: 98%; margin-left: 10px;">

		<!-- <form name="detailForm" action="/product/listProduct/${menu }" method="post"> -->
		<form name="detailForm">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">상품 관리</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>

					<td align="right">찾고 싶은 가격 범위 설정 <input type="text"
						name="searchPriceLowerLimit"
						value="${search.searchPriceLowerLimit}" class="ct_input_g"
						style="width: 100px; height: 19px"> ~ <input type="text"
						name="searchPriceUpperLimit"
						value="${search.searchPriceUpperLimit}" class="ct_input_g"
						style="width: 100px; height: 19px"> <select
						name="searchOrderBy" class="ct_input_g" style="width: 100px">
							<option value="0" ${search.searchOrderBy=='0' ? "selected" : "" }>상품번호
								순</option>
							<option value="1" ${search.searchOrderBy=='1' ? "selected" : "" }>가격
								낮은 순</option>
							<option value="2" ${search.searchOrderBy=='2'? "selected" : "" }>가격
								높은 순</option>
					</select> <select name="searchCondition" class="ct_input_g"
						style="width: 80px">
							<option value="0"
								${search.searchCondition=='0' ? "selected" : "" }>상품번호</option>
							<option value="1"
								${search.searchCondition=='1' ? "selected" : "" }>상품명</option>
							<option value="2"
								${search.searchCondition=='2'? "selected" : "" }>상품가격</option>
					</select> <input type="text" name="searchKeyword"
						value="${search.searchKeyword}" class="ct_input_g"
						style="width: 120px; height: 19px">

					</td>

					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;"><a
									href="javascript:fncGetList('1');">검색</a></td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재
						${resultPage.currentPage } 페이지</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="30">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">상품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">등록일</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">현재상태</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">재고 수량</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
					<c:set var="i" value="0" />
					<c:forEach var="product" items="${list}">
						<c:set var="i" value="${i+1 }" />
						<tr class="ct_list_pop">
							<td align="center" height="200">${i }</td>
							<td></td>
							<td align="left"><input value="${product.prodNo}"
								type="hidden" /> ${product.prodName }</td>
							<td></td>
							<td align="left">${product.price }</td>
							<td></td>
							<td align="left">${product.regDate }</td>
							<td></td>
							<td align="left"><c:if test="${ product.prodQuantity!=0}"> 판매 중 </c:if>
								<c:if test="${ product.prodQuantity==0}"> 재고 없음 </c:if></td>
							<td></td>
							<td align="left">${product.prodQuantity}개</td>
						</tr>
						<tr>
							<td colspan="11" bgcolor="D6D7D6" height="1"></td>
						</tr>
					</c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" /> <%-- <%
 if (resultPage.getCurrentPage() > resultPage.getPageUnit()) {
 %> <a
						href="javascript:fncGetProductList('<%=resultPage.getCurrentPage() - 1%>')">◀이전</a>
						<%
						}
						for (int i = resultPage.getBeginUnitPage(); i <= resultPage.getEndUnitPage(); i++) {
						%> <a href="javascript:fncGetProductList('<%=i%>')"><%=i%></a> <%
 }
 if (resultPage.getEndUnitPage() < resultPage.getMaxPage()) {
 %> <a
						href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage() + 1%>')">이후▶</a>
						<%
						}
						%> --%> <jsp:include page="../common/pageNavigatorDefault.jsp" />

					</td>
				</tr>
			</table>
			<!--  페이지 Navigator 끝 -->
		</form>
	</div>

</body>
</html>



