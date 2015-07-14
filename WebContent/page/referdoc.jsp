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
	src="${pageContext.request.contextPath }/jquery/referdocPage.js?token=${sessionScope.user.user_token}"></script>
<script type="text/javascript">
	var token = "${sessionScope.user.user_token}";
	var link = "${pageContext.request.contextPath}";
	var parentno = "${dataMap.parentno}";
</script>
<%
  String path=request.getContextPath();
%>
</head>
<body onload="onload()">

	<table cellspacing=0 cellpadding=0 width="100%" align=center border=0 style="font-size: 12px;">
		<tr height=28>
			<td background="${pageContext.request.contextPath }/page/img/title_bg1.jpg">當前位置:<a href="${pageContext.request.contextPath }/page/defult.jsp" target=main>主頁(Home)</a>
				-> 訂單價格推薦
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
		<div class="div_merge">
			<span>
				<form action="referdoc_getchildlist"
					id="referdoc_getchildlist" method="post">
				一級項 ：
				
				<select name="referdoc_parentno" id="referdoc_parentno" onchange="referdoc_parentno_change()">
					<option value="0">請選擇</option>
				</select>
				</form>
			</span>
			
		</div>
		<div class="div_merge">
			<span>
				<input type="button" value="添加參考價" Onclick="location='${pageContext.request.contextPath}/page/addreferdoc.jsp'" />
			</span>
			
		</div>
        
		<div id="div_message" class="div_message" style="display: none">
			<span id="message">
			</span>
		</div>
        <div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_list" border="1" width="100%">
                <tbody id="datas">
                	<tr style="font-weight: bold;">
                		
                        <td>序號</td>
                        <td>訂單類型</td>
                        <td>訂單參考價格</td>
                        <td>固定价格</td>
                        <td colspan="4" align="center">操作</td>
                    </tr>
                    <s:iterator value="dataMap.referdoclist" id="referdoclist">
					<tr id="template">
						<form action="referdoc_update"
							id='<s:property value='#referdoclist.referdoc_id'/>' method="post">
						<td style="display:none"><input type="text" name="referdoc_parentno" id="referdoc_parentno" value='<s:property value='#referdoclist.referdoc_parentno'/>' ></input></td>
						<td style="display:none"><input type="text" name="referdoc_level" id="referdoc_level" value='<s:property value='#referdoclist.referdoc_level'/>' ></input></td>
						<td><input type="text" name="referdoc_id" readonly="true" id="referdoc_id" value='<s:property value='#referdoclist.referdoc_id'/>' ></input></td>
						<td><input type="text" name="referdoc_type" id="referdoc_type" value='<s:property value='#referdoclist.referdoc_type'/>' ></input></td>
						<td><input type="text" name="referdoc_price" id="referdoc_price" value='<s:property value='#referdoclist.referdoc_price'/>' ></input></td>
						
						<td>
							<select name="referdoc_flag" id="referdoc_flag">
								<s:if test="#referdoclist.referdoc_flag">
									<option id="select1" value="true" selected="selected">true</option>
									<option id="select2" value="false">false</option>
								</s:if>
								<s:else>
									<option id="select2" value="false" selected="selected">false</option>
									<option id="select1" value="true">true</option>
								</s:else>
							</select>
						</td>
						
						<td><input type="submit" value="修改"></input></td>
						<td><input type="button" value="删除" onclick="location.href='referdoc_delete.action?referdoc_id=<s:property value='#referdoclist.referdoc_id'/>'"></input></td>
						</form>
						
						
						
					</tr>
					</s:iterator>
                    
                </tbody>
                    <tr>
                        <td colspan="20" style="text-align: center;">
                            [1]2
                        </td>
                    </tr>
            </table>
        </div>
</body>
</html>
