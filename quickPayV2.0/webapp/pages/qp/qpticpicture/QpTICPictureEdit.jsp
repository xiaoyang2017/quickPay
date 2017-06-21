<%@ include file="/common/taglibs.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.picc.qp.schema.model.QpTICPicture" %>
<html>
<head>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_js.jsp"%>
<script language="javascript" src="${ctx}/pages/qp/qpticpicture/QpTICPicture.js"></script>

<script type="text/javascript">
	
	/*页面加载触发*/
	$(document).ready(function(){
		if($('#operateType').val()=='view'){
			setReadonlyOfAllInput("fm");
		}
	});
</script>
</head>

<body>
	<input type="hidden" name="operateType" id="operateType" value="${operateType}"/>
	<form name="fm" id="fm" action="/qp/qpticpicture" namespace="/qp/qpticpicture" method="post">

		<table class="fix_table">
			<tr>
				<td class="bgc_tt short" colspan="4" align="left">
					<h2 align="center">
		<c:choose>
			<c:when test="${operateType == 'update'}">
					修改QpTICPicture信息
				</c:when>
			<c:when test="${operateType == 'add'}">
					增加QpTICPicture信息
				</c:when>
			<c:when test="${operateType == 'view'}">
					查看QpTICPicture信息
				</c:when>
		</c:choose>						
					</h2></td>
			</tr>
			<tr>
							<tr>
	<td class="bgc_tt short">
		图片ID
	</td>
	  	<td class="long">
	  	<c:choose>
			<c:when test="${operateType == 'update'}">
${qpTICPicture.id.picId}					<input type="hidden" name="qpTICPicture.id.picId" id="qpTICPicture.id.picId" value="${qpTICPicture.id.picId}">
			</c:when>
			<c:when test="${operateType == 'add'}">
					<input class='input_w w_15' name="qpTICPicture.id.picId" id="qpTICPicture.id.picId" value="${qpTICPicture.id.picId}">
			</c:when>
			<c:when test="${operateType == 'view'}">
${qpTICPicture.id.picId}					<input type="hidden" name="qpTICPicture.id.picId" id="qpTICPicture.id.picId" value="${qpTICPicture.id.picId}">
			</c:when>
		</c:choose>
		</td>
	<td class="bgc_tt short">
		图片描述
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTICPicture.picDesc" id="qpTICPicture.picDesc" value="${qpTICPicture.picDesc}">
		</td>
							</tr>
							<tr>
	<td class="bgc_tt short">
		序号
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTICPicture.picOrder" id="qpTICPicture.picOrder" value="${qpTICPicture.picOrder}">
		</td>
	<td class="bgc_tt short">
		图片来源
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTICPicture.picSource" id="qpTICPicture.picSource" value="${qpTICPicture.picSource}">
		</td>
							</tr>
							<tr>
	<td class="bgc_tt short">
		文件路径
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTICPicture.fileName" id="qpTICPicture.fileName" value="${qpTICPicture.fileName}">
		</td>
	<td class="bgc_tt short">
		服务ID
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTICPicture.serverId" id="qpTICPicture.serverId" value="${qpTICPicture.serverId}">
		</td>
							</tr>
							<tr>
	<td class="bgc_tt short">
		上传时间
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTICPicture.uploadTime" id="qpTICPicture.uploadTime" value="${qpTICPicture.uploadTime}" onclick="WdatePicker({skin:'whyGreen'})">
		</td>
	<td class="bgc_tt short">
		所属事故ID
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTICPicture.acciId" id="qpTICPicture.acciId" value="${qpTICPicture.acciId}">
		</td>
							</tr>
							<tr>
	<td class="bgc_tt short">
		确认状态
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTICPicture.checkStatus" id="qpTICPicture.checkStatus" value="${qpTICPicture.checkStatus}">
		</td>
	<td class="bgc_tt short">
		创建人代码
	</td>
			<td class="long">
${qpTICPicture.creatorCode}			</td>
							</tr>
							<tr>
	<td class="bgc_tt short">
		创建时间
	</td>
			<td class="long">
${qpTICPicture.insertTimeForHis}			</td>
	<td class="bgc_tt short">
		修改人代码
	</td>
			<td class="long">
${qpTICPicture.updaterCode}			</td>
							</tr>
							<tr>
	<td class="bgc_tt short">
		修改时间
	</td>
			<td class="long">
${qpTICPicture.operateTimeForHis}			</td>
	<td class="bgc_tt short">
		有效状态
	</td>
		<td class="long">
			<input class='input_w w_15' name="qpTICPicture.validStatus" id="qpTICPicture.validStatus" value="${qpTICPicture.validStatus}">
		</td>
							 </tr> 				 
		</table>
		<br>
		<table>
			<tr>
				<td colspan=4 align="center">
						<input type="button" class="button_ty" onclick="executeSave();" ind="ind"  value="保存" />
						<input type="reset" class="button_ty" ind="ind"  value="重置" />
						<input type="button" class="button_ty" onclick="closeWinAndReLoad();" value="关闭" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>