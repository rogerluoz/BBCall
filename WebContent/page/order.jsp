<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv=content-type content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="${pageContext.request.contextPath }/page/img/BBCallicon_32X32.ico" type="image/x-icon" />
<link href="${pageContext.request.contextPath }/page/css/mine.css" type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/jquery/washorderPage.js?token=${sessionScope.user.user_token}"></script>
<script type="text/javascript">
	var token = "${sessionScope.user.user_token}";
	var link = "${pageContext.request.contextPath}";
</script>
<%
	String path = request.getContextPath();
%>
</head>
<body onload="onload()">

	<table cellspacing=0 cellpadding=0 width="100%" align=center border=0
		style="font-size: 12px;">
		<tr height=28>
			<td background="${pageContext.request.contextPath }/page/img/title_bg1.jpg">當前位置:<a
				href="${pageContext.request.contextPath }/page/defult.jsp"
				target=main>主頁(Home)</a> -> 訂單列表
			</td>
		</tr>
		<tr>
			<td bgcolor=#b1ceef height=1></td>
		</tr>
		<tr height=20>
			<td background="${pageContext.request.contextPath }/page/img/shadow_bg.jpg"></td>
		</tr>
	</table>
	<div></div>

	<div class="div_search">
		<span>
			<form action="orderlist_getorderlist"
				id="orderlist_getorderlist" method="post">
				訂單狀態：
				<select name="order_status" style="width: 100px;">
					<option value="1">新建訂單</option>
					<option value="7">已出價訂單</option>
					<option value="2">待評價訂單</option>
					<option value="3">已評價訂單</option>
					<option value="4">收到貨物</option>
					<option value="5">正在清洗</option>
					<option value="6">正在配送</option>
				</select>
				<input type="text" name="user_id" value="${sessionScope.user_id}" style="display:none"></input>
				<input value="查詢" type="submit" />
			</form>

			<form action="orderlist_selectwashorderlist"
				id="orderlist_selectwashorderlist" method="post">
				訂單狀態：
				<select name="order_status2" style="width: 100px;">
					<option selected="selected" value="0">請選擇</option>
					<option value="1">新建訂單</option>
					<option value="7">已出價訂單</option>
					<option value="2">待評價訂單</option>
					<option value="3">已評價訂單</option>
					<option value="4">收到貨物</option>
					<option value="5">正在清洗</option>
					<option value="6">正在配送</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;負責師傅：
				<input type="text" name="order_master_account" />
				<input value="篩選" type="submit" />
			</form>
		</span>
	</div>
	<div id="div_message" class="div_message" style="display: none">
		<span id="message"> </span>
	</div>
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_list" border="1" width="100%">
			<tbody id="datas">
				<tr style="font-weight: bold;">
					<td>序號</td>
					<td>訂單生成時間</td>
					<td>預約時間</td>
					<td>預約地點</td>
					<td>負責師傅</td>
					<td>訂單狀態</td>
					<td colspan="2" align="center">操作</td>
				</tr>
				<s:iterator value="dataMap.orderlist" id="order">
					<tr id="template">
						<td id="order_id"><s:property value='#order.order_id' /></td>
						<td id="order_create_time"><s:property
								value='#order.order_create_time' /></td>
						<td id="order_book_time"><s:property
								value='#order.order_book_time' /></td>
						<td id="order_book_location"><s:property
								value='#order.order_book_location' /></td>
						<td id="order_master_account"><s:property
								value='#order.order_master_account' /></td>
						<td id="order_status"><s:if
								test="%{#order.order_status == 1}">新建訂單</s:if> <s:if
								test="%{#order.order_status == 2}">待評價訂單</s:if> <s:if
								test="%{#order.order_status == 3}">已評價訂單</s:if> <s:if
								test="%{#order.order_status == 4}">收到貨物</s:if> <s:if
								test="%{#order.order_status == 5}">正在清洗</s:if> <s:if
								test="%{#order.order_status == 6}">正在配送</s:if>
								<s:if
								test="%{#order.order_status == 7}">已出價訂單</s:if></td>
								
						<td id="order_type_code" style="display: none"><s:property
								value='#order.order_type_code' /></td>
						<td id="order_href"><a
							href="${pageContext.request.contextPath}/page/orderlist_selectother.action?order_id=<s:property value='#order.order_id'/>">查看</a>
						</td>
					</tr>
				</s:iterator>

			</tbody>
			<tr>
				<td colspan="20" style="text-align: center;">[1]2</td>
			</tr>
		</table>
	</div>
</body>
</html>