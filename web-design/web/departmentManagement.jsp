﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>部门管理</title>

	<link href="resources/plugins/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="resources/plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css" rel="stylesheet"/>
	<link href="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.css" rel="stylesheet"/>
	<link href="resources/plugins/waves-0.7.5/waves.min.css" rel="stylesheet"/>
	<link href="resources/plugins/jquery-confirm/jquery-confirm.min.css" rel="stylesheet"/>
	<link href="resources/plugins/select2/css/select2.min.css" rel="stylesheet"/>
	<script src="resources/plugins/select2/js/select2.min.js"></script>
	
	<link href="resources/css/common.css" rel="stylesheet"/>
</head>
<body>
<div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增部门</a>
		<a class="waves-effect waves-button" href="javascript:;" onclick="updateAction()"><i class="zmdi zmdi-edit"></i> 修改部门</a>
		<a class="waves-effect waves-button" href="javascript:;" onclick="deleteAction()"><i class="zmdi zmdi-close"></i> 删除部门</a>		
		<input class="form-control2" style="width:100px" id="inputa" placeholder="部门编号">
		<input class="form-control2" style="width:100px" id="inputb" placeholder="名称">
		<input class="form-control2" style="width:100px" id="inputc" placeholder="类型">

			<select class="form-control2">
				<option disabled>(请选择岗位类型)</option>
				<option>公司</option>
				<option>部门</option>
			</select>  

			<a class="waves-effect waves-button" href="javascript:;" onclick="Search()"><i class="zmdi zmdi-search"></i> 查找</a>
	</div>
	<table id="table"></table>
</div>
<!-- 新增 -->
<div id="createDialog" class="crudDialog" hidden>
	<form >
		<div class="form-group">
			<label for="dnumInput">编号</label>
			<input id="dnumInput" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="dname123">名称</label>
			<input id="dname123" name="dname123" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="type">类型</label>
			<input id="type" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="phone">电话</label>
			<input id="phone" type="text" class="form-control">
		</div>

		<div class="form-group">
			<label for="fax">传真</label>
			<input id="fax" type="text" class="form-control">
		</div>

		<div class="form-group">
			<label for="des">描述</label>
			<input id="des" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="parent">上级部门</label>
			<input id="parent" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="establishData">成立时间</label>
			<input id="establishData" type="date" class="form-control">
		</div>
		<div class="form-group">
			<select class="form-control">
				<option disabled>(请选择类型)</option>
				<option>公司</option>
				<option>部门</option>
			</select>  
		</div>
		<a class="waves-effect waves-button" href="javascript:;" onclick="Search()"><i class="zmdi zmdi-search"></i> 查找</a>


	</form>
</div>
<script src="resources/plugins/jquery.1.12.4.min.js"></script>
<script src="resources/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="resources/plugins/waves-0.7.5/waves.min.js"></script>
<script src="resources/plugins/jquery-confirm/jquery-confirm.min.js"></script>
<script src="resources/plugins/select2/js/select2.min.js"></script>



<script src="resources/js/common.js"></script>
<script>
var $table = $('#table');
$(function() {
	$(document).on('focus', 'input[type="text"]', function() {
		$(this).parent().find('label').addClass('active');
	}).on('blur', 'input[type="text"]', function() {
		if ($(this).val() == '') {
			$(this).parent().find('label').removeClass('active');
		}
	});
	// bootstrap table初始化
	// http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/
	$table.bootstrapTable({
		url: 'Department',
		height: getHeight(),
		striped: true,
		search: false,
		searchOnEnterKey: false,
		showRefresh: false,
		showToggle: false,
		showColumns: false,
		minimumCountColumns: 2,
		showPaginationSwitch: false,
		clickToSelect: true,
		detailView: true,
		detailFormatter: 'detailFormatter',
		pagination: true,
		paginationLoop: false,
		classes: 'table table-hover table-no-bordered',
		//sidePagination: 'server',
		//silentSort: false,
		smartDisplay: false,
		idField: 'id',
		sortName: 'id',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'state', checkbox: true},
			{field: 'dnum', title: '编号', sortable: true, halign: 'center'},
			{field: 'dname', title: '名称', sortable: true, halign: 'center'},
			{field: 'type', title: '类型', sortable: true, halign: 'center'},
			{field: 'phone', title: '电话', sortable: true, halign: 'center'},
			{field: 'fax', title: '传真', sortable: true, halign: 'center'},
			{field: 'des', title: '描述', sortable: true, halign: 'center'},
			{field: 'parent', title: '上级部门', sortable: true, halign: 'center'},
			{field: 'establishDate', title: '成立时间', sortable: true, halign: 'center'},
			{field: 'action', title: '操作', halign: 'center', align: 'center', formatter: 'actionFormatter', events: 'actionEvents', clickToSelect: false}
		]
	}).on('all.bs.table', function (e, name, args) {
		$('[data-toggle="tooltip"]').tooltip();
		$('[data-toggle="popover"]').popover();  
	});
});
function actionFormatter(value, row, index) {
    return [
        '<a class="like" href="javascript:void(0)" data-toggle="tooltip" title="Like"><i class="glyphicon glyphicon-heart"></i></a>　',
        '<a class="edit ml10" href="javascript:void(0)" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="javascript:void(0)" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}

window.actionEvents = {
    'click .like': function (e, value, row, index) {
        alert('You click like icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    },
    'click .edit': function (e, value, row, index) {
        alert('You click edit icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    },
    'click .remove': function (e, value, row, index) {
        alert('You click remove icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    }
};
function detailFormatter(index, row) {
	var html = [];
	$.each(row, function (key, value) {
		html.push('<p><b>' + key + ':</b> ' + value + '</p>');
	});
	return html.join('');
}

function Search() {
	var dname1= $('#dname123').val();
	var ycid = $("input:hidden[name='dname123']").val();
	//var dnum1= $('#dnumInput').val();
	var dnum1=document.getElementById("dname");
	console.log("123123123123123");
	console.log(dname1);
	$('#createDialog').bootstrapTable(
			{
				method:'get',
				url:'DepartmentAdd',

				queryParams: {
					Dname:dname1,
					Dnum:dnum1
				}
			}
	)

	// var options = $('#createDialog').bootstrapTable('refresh', {
	// 	query:
	// 			{
	// 				Dname:dname,
	// 				Dnum:dnum
	// 			}
	// });
}


// 新增
function createAction() {
	window.location = "departmentManagementAdd.jsp";
	// $.confirm({
	// 	type: 'dark',
	// 	animationSpeed: 300,
	// 	title: '新增部门',
	// 	content: $('#createDialog').html(),
	// 	buttons: {
	//
	// 		confirm: {
	// 			text: '确认',
	// 			btnClass: 'waves-effect waves-button',
	// 			action: function () {
	// 				Search();
	// 				//window.location = "DepartmentAdd";
	// 				//$.alert('确认');
	// 			}
	// 		},
	// 		cancel: {
	// 			text: '取消',
	// 			btnClass: 'waves-effect waves-button'
	// 		}
	// 	}
	// });
}
// 编辑
function updateAction() {
	var rows = $table.bootstrapTable('getSelections');
	if (rows.length == 0) {
		$.confirm({
			title: false,
			content: '请至少选择一条记录！',
			autoClose: 'cancel|3000',
			backgroundDismiss: true,
			buttons: {
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	} else {
		$.confirm({
			type: 'blue',
			animationSpeed: 300,
			title: '编辑系统',
			content: $('#createDialog').html(),
			buttons: {
				confirm: {
					text: '确认',
					btnClass: 'waves-effect waves-button',
					action: function () {
						$.alert('确认');
					}
				},
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	}
}
// 删除
function deleteAction() {
	var rows = $table.bootstrapTable('getSelections');
	if (rows.length == 0) {
		$.confirm({
			title: false,
			content: '请至少选择一条记录！',
			autoClose: 'cancel|3000',
			backgroundDismiss: true,
			buttons: {
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	} else {
		$.confirm({
			type: 'red',
			animationSpeed: 300,
			title: false,
			content: '确认删除该系统吗？',
			buttons: {
				confirm: {
					text: '确认',
					btnClass: 'waves-effect waves-button',
					action: function () {
						var ids = new Array();
						for (var i in rows) {
							ids.push(rows[i].systemId);
						}
						$.alert('删除：id=' + ids.join("-"));
					}
				},
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	}
}
</script>
</body>
</html>