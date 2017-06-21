<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta_css.jsp"%>
<%@ include file="/common/i18njs.jsp"%>
<%@ include file="/common/meta_js.jsp"%>
<html>
<head>

<script language="javascript" src="${ctx}/common/js/dateValidation.js"></script>
<script language="javascript" src="${ctx}/pages/wf/wfttask/WFTTaskDealing.js"></script>
<script language="javascript" src="${ctx}/pages/wf/common/formatter.js"></script>
<script src="${ctx}/pages/wf/wfttask/WFTTaskManagement.js"></script>
<script src="${ctx}/pages/wf/wfttask/WFTTaskAssign.js"></script>
<script type="text/javascript">
function loadTask(){
	queryTodoTaskPortal();
} 
</script>

<style type="text/css">
	
	a.link_style {color:  blue;	}
	a.link_style:visited {color: purple; }
	a.link_style:hover {color: orange;	}
</style>
<title>待办任务</title>
</head>
<body onload="loadTask();">
	<div id="wrapper">
		<table id="TaskTodo"></table>
	</div>
</body>