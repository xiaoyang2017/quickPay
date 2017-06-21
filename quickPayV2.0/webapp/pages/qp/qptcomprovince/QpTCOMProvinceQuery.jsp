<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.picc.qp.schema.model.QpTCOMProvince" %>
<html>
<head>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_js.jsp"%>
<script language="javascript" src="${ctx}/pages/qp/qptcomprovince/QpTCOMProvince.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<form name="fm" id="fm">
		<div id="wrapper">
			<div id="container">
				<div id="crash_menu">
					<h2 align="center">请输入查询条件</h2>
				</div>
				<table class="fix_table">
							<tr>
	<td class="bgc_tt short">
		省份ID
	</td>
	  	<td  class="long">
			<input class='input_w w_15' name="qpTCOMProvince.id.provId" id="qpTCOMProvince.id.provId" value="${qpTCOMProvince.id.provId}">
		</td>
	<td class="bgc_tt short">
		省份名称
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTCOMProvince.provName" id="qpTCOMProvince.provName" value="${qpTCOMProvince.provName}">
		</td>
							</tr>
							<tr>
	<td class="bgc_tt short">
		序号
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTCOMProvince.provOrder" id="qpTCOMProvince.provOrder" value="${qpTCOMProvince.provOrder}">
		</td>
	<td class="bgc_tt short">
		有效状态
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTCOMProvince.validStatus" id="qpTCOMProvince.validStatus" value="${qpTCOMProvince.validStatus}">
		</td>
							 </tr> 			 
					<tr>
						<td colspan="6" align="center">
							<input type="button" class="button_ty" value="查 询"
								onclick="executeQuery();"> 
							<input type="button" id="addButton"
								onclick="prepareAdd();" class="button_ty" value="增 加">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<br>
	<table id="QpTCOMProvinceTable"></table>
</body>
</html>