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
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		//document.detailForm.submit();

		$('#currentPage').val(currentPage)
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
				// �������� ���� ó��
				console.log(response);
			},
			error : function(error) {
				// ���� ó��
				console.error(error);
			}
		});
	} */

	$(function() {
		//console.log($("tr.ct_list_pop td:nth-child(3)"));
		var list = JSON.parse("${list}");
		alert(list);
		$('tr.ct_list_pop').each(function(index) {
			$("tr.ct_list_pop:nth-child("+(2*index+4)+") td:nth-child(3)").on("click",function() {
				var prodNo = $("tr.ct_list_pop:nth-child("+(2*index+4)+") td:nth-child(3) input").val();
				var menu = "${menu}";
				//alert(prodNo + "/" + menu);
				self.location = "/product/getProduct/" + prodNo+ "/" + menu;
			})
		})
	});
</script>

</head>

<body bgcolor="#ffffff" text="#000000">


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
								<td width="93%" class="ct_ttl01">��ǰ ����</td>
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

					<td align="right">ã�� ���� ���� ���� ���� <input type="text"
						name="searchPriceLowerLimit"
						value="${search.searchPriceLowerLimit}" class="ct_input_g"
						style="width: 100px; height: 19px"> ~ <input type="text"
						name="searchPriceUpperLimit"
						value="${search.searchPriceUpperLimit}" class="ct_input_g"
						style="width: 100px; height: 19px"> <select
						name="searchOrderBy" class="ct_input_g" style="width: 100px">
							<option value="0" ${search.searchOrderBy=='0' ? "selected" : "" }>��ǰ��ȣ
								��</option>
							<option value="1" ${search.searchOrderBy=='1' ? "selected" : "" }>����
								���� ��</option>
							<option value="2" ${search.searchOrderBy=='2'? "selected" : "" }>����
								���� ��</option>
					</select> <select name="searchCondition" class="ct_input_g"
						style="width: 80px">
							<option value="0"
								${search.searchCondition=='0' ? "selected" : "" }>��ǰ��ȣ</option>
							<option value="1"
								${search.searchCondition=='1' ? "selected" : "" }>��ǰ��</option>
							<option value="2"
								${search.searchCondition=='2'? "selected" : "" }>��ǰ����</option>
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
									href="javascript:fncGetList('1');">�˻�</a></td>
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
					<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ����
						${resultPage.currentPage } ������</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="30">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="100">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�������</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��� ����</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${i+1 }" />
					<tr class="ct_list_pop" >
						<td align="center">${i }</td>
						<td></td>
						<td align="left" >
							<input value="${product.prodNo}" type="hidden"/> 
								${product.prodName }
						</td>
						<td></td>
						<td align="left">${product.price }</td>
						<td></td>
						<td align="left">${product.regDate }</td>
						<td></td>
						<td align="left"><c:if test="${ product.prodQuantity!=0}"> �Ǹ� �� </c:if>
							<c:if test="${ product.prodQuantity==0}"> ��� ���� </c:if></td>
						<td></td>
						<td align="left">${product.prodQuantity}��</td>
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
						href="javascript:fncGetProductList('<%=resultPage.getCurrentPage() - 1%>')">������</a>
						<%
						}
						for (int i = resultPage.getBeginUnitPage(); i <= resultPage.getEndUnitPage(); i++) {
						%> <a href="javascript:fncGetProductList('<%=i%>')"><%=i%></a> <%
 }
 if (resultPage.getEndUnitPage() < resultPage.getMaxPage()) {
 %> <a
						href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage() + 1%>')">���Ģ�</a>
						<%
						}
						%> --%> <jsp:include page="../common/pageNavigatorDefault.jsp" />

					</td>
				</tr>
			</table>
			<!--  ������ Navigator �� -->
		</form>
	</div>

</body>
</html>



