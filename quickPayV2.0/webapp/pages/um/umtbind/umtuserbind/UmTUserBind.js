var query_action = contextRootPath + "/um/umtuserbind/query.do";
var queryResultTable = "UmTUserBindTable";
var page_toolBar = [ {
	text : '修改',
	align : 'right',
	iconCls : 'icon-edit',
	handler : function() {
		prepareUpdate();
	}
}, {
	text : '删除',
	align : 'right',
	iconCls : 'icon-remove',
	handler : function() {
		executeDelete();
	}
} ];
var page_contentColumnHeaders = [ [
		{
			field : 'checkBoxNo',
			checkbox : true
		},
		{
			field : 'userCode',
			title : '用户代码',
			align : 'center',
			sortable : true,
			formatter : function(value, row, index) {
				return '<a style="cursor:pointer;text-decoration: underline;" onclick="view(\''
						+ getUrlByJson(row) + '\')">' + row.id.userCode + '</a>';
			}
		},
		{
			field : 'customerName',
			title : '客户名称',
			align : 'center',
			sortable : true
		}
			,	
		{
			field : 'bindType',
			title : '绑定方式',
			align : 'center',
			sortable : true
		}
			,	
		{
			field : 'bindValue',
			title : '绑定值',
			align : 'center',
			sortable : true
		}
			,	
		{
			field : 'bindTime',
			title : '绑定时间',
			align : 'center',
			sortable : true
		}
			,	
		{
			field : 'bindResult',
			title : '绑定结果',
			align : 'center',
			sortable : true
		}
			,	
		{
			field : 'custId',
			title : '绑定客户编号',
			align : 'center',
			sortable : true
		}
			,	
		{
			field : 'validStatus',
			title : '有效状态',
			align : 'center',
			sortable : true
		}
			,	
		{
			field : 'creatorCode',
			title : '创建人代码',
			align : 'center',
			sortable : true
		}
			,	
		{
			field : 'insertTimeForHis',
			title : '创建时间',
			align : 'center',
			sortable : true
		}
			,	
		{
			field : 'updaterCode',
			title : '更新人代码',
			align : 'center',
			sortable : true
		}
			,	
		{
			field : 'operateTimeForHis',
			title : '更新时间',
			align : 'center',
			sortable : true
		}
				
		] ];


/* 查询 */
function executeQuery() {
	var data = $("#fm").serialize();
	var send_url = query_action + "?" + data;
	$('#'+queryResultTable).datagrid({
		title : "查询结果",
		url : send_url,
		nowrap : true,
		striped : true,
		remoteSort : false,
		pageNumber : 1,
		pagination : true,
		onLoadError: function(result){
			alertErrorMsgForEasyUi(result);
		},
		columns : page_contentColumnHeaders,
		toolbar : page_toolBar
	});
}
/* 修改 */
function prepareUpdate() {
	var rows = $('#' + queryResultTable).datagrid('getSelections');
	if (rows == null) {
		return;
	}
	var num = rows.length;
	if (num != 1) {
		$.messager.alert('提示消息', "请选择一行", 'info');
		return;
	}
	var url = contextRootPath+"/um/umtuserbind/prepareUpdate.do?" + getUrlByJson(rows[0]);
	editRecord(url);
}
/* 新增 */
function prepareAdd() {
	editRecord(contextRootPath+'/um/umtuserbind/prepareAdd.do');
}
/* 查看 */
function view(params) {
	var url = contextRootPath+"/um/umtuserbind/view.do?" + params;
	editRecord(url);
}

/* 删除 */
function executeDelete() {
	var rows = $('#' + queryResultTable).datagrid('getSelections');
	if (rows == null) {
		return;
	}
	var num = rows.length;
	if (num != 1) {
		$.messager.alert('提示消息', "请选择一行", 'info');
		return;
	}
	$.messager.confirm('提示', '是否确认删除?', function(r){
		if (r){
			var url = contextRootPath+"/um/umtuserbind/delete.do?" + getUrlByJson(rows[0]);
			 $.ajax({
					   type: "POST",
					   url: url,
					   success: function(result){
							  $.messager.alert('提示信息','记录删除成功！	','info');
							  $('#'+queryResultTable).datagrid('reload');
					   },
					   error:function(result){
						   alertErrorMsgForEasyUi(result);
					   }
			});
		}
	});
}

function closeWinAndReLoad() {
	try{
		window.opener.reLoadResult();
	}catch(e){}
	window.close();
}

	function executeSave(){
		if(!$('#fm').form('validate')){
	    	return false; 
	    }else{
	    	$.messager.confirm('提示', '是否确认保存?', function(r){
				if (r){
				 	if($('#operateType').val()=='update'){
				 		$("#fm").attr("action",contextRootPath+"/um/umtuserbind/update.do");
				 		$("#fm").submit();
				 	}else if($('#operateType').val()=='add'){
				 		$("#fm").attr("action",contextRootPath+"/um/umtuserbind/add.do");
				 		$("#fm").submit();
				 	}else{
				 		return false;
				 	}				 	
				}
			});
	    }	    
	}