<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="keywords" content="jquery,ui,easy,easyui,web">
	<meta name="description" content="easyui help you build your web page easily!">
	<title>jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
	<style type="text/css">
		#fm{
			margin:0;
			padding:10px 30px;
		}
		.ftitle{
			font-size:14px;
			font-weight:bold;
			color:#666;
			padding:5px 0;
			margin-bottom:10px;
			border-bottom:1px solid #ccc;
		}
		.fitem{
			margin-bottom:5px;
		}
		.fitem label{
			display:inline-block;
			width:80px;
		}
	</style>
	<script type="text/javascript">
		var url = "";
		function newUser(){
			
			$("#dlg").dialog("open").dialog("setTitle","add");
			
			//$("#fm").form("clear");
			
			//alert('Opening new window');
			
			url = "<%=basePath%>/servlet/FirstEasyuiServlet?flag=addNew";
			
		}
		
			function editUser(){
			
			var row = $("#dg").datagrid("getSelected");
			
			if (row){
				
				//alert('Opening  Edit window ...');
				
				$("#dlg").dialog("open").dialog("setTitle","Update");
				
				$("#fm").form("load",row);
				
				url = "<%=basePath%>/servlet/FirstEasyuiServlet?flag=edit";		
				
			} else {
				
				alert(" Edit User");
				
			}
		}
		
		function saveUser(){
			
			$("#fm").form("submit",{
				
				url: url,
				
				onSubmit: function(){
				
				
					//$("#dlg").dialog("close");
					//$("#dg").datagrid("reload");	
					return $(this).form("validate");
					
					
					
					//$(this).form("validate");
				},
				success: function(result){
					
					alert('Coming into success ' + result);
					var result = eval("("+result+")");
					
					if (result.success){
						
						alert(result.msg);
						
						$("#dlg").dialog("close");		// close the dialog
						
						$("#dg").datagrid("reload");	// reload the user data
						
					} else {
						
						$.messager.show({
							
							title: "Error",
							
							msg: result.msg
							
						});
						
					}
				},onLoadError: function(){alert('Error while loading....') }
			});
		}
		function removeUser(){
			
			var row = $("#dg").datagrid("getSelected");
			
			if (row){
				
				$.messager.confirm("Confirm","Do you want to delete?",function(r){
					
					if (r){
						
						$.post("<%=basePath%>/servlet/FirstEasyuiServlet?flag=remove",{id:row.id},function(result){
							
							if (result.success){
							
							  //alert('Data removed properly');
								
								$("#dg").datagrid("reload");	// reload the user data
								
							} else {
								
								$.messager.show({	// show error message
									
									title: "Error",
									
									msg: result.msg
									
								});
								
							}
						},"json");
					}
				});
			}
		}
	</script>
	<!--  -->
	<!--  <script type="text/javascript">
           function dataPop(){
        	   var userdata = "${listUsers}";
       			for(var i=0;i<=userdata.length;i++){
       				jQuery("#list1").jqGrid('addRowData',i+1,userdata[i]);
       		}
               
               }
        
        
        </script> -->
</head>
<body >
	<h2>User Management </h2>
	<div class="demo-info" style="margin-bottom:10px">
		<div class="demo-tip icon-tip">&nbsp;</div>
		<div>To add a new user use New User tool-bar option.</div>
		<div>To edit and delete operations select a row and use options on tool-bar .</div>
	</div>
	
	<!-- url="<%=basePath%>/src/main/java/com/oua/spring/UserController"-->
	<table id="dg" title="Users Details" class="easyui-datagrid" style="width:1000px;height:400px"
			
			toolbar="#toolbar" pagination="true"
			rownumbers="true" fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="firstName" width="50">First Name</th>
				<th field="lastName" width="50">Last Name</th>
				<th field="phone" width="50">Phone</th>
				<th field="email" width="50">Email</th>
			</tr>
		</thead>
		<tbody>
		    <td>
		        <table id="list1" title="User Data" fitColumns="true" style="width:450px;height:25px"  pagination="true" class="easyui-datagrid">
		          	 <c:forEach items="${listUsers}" var="user">
					<tr>
						<td>${user.first_name}</td>
						<td>${user.last_name}</td>
						<td>${user.phone}</td>
						<td>${user.email}</td>
					
					<!--  	<td><a href="<c:url value='/edit/${user.id}' />" >Edit</a></td>
						<td><a href="<c:url value='/remove/${user.id}' />" >Delete</a></td> -->
					</tr>
					</c:forEach>
		        </table>
		    </td>
		
		</tbody>
	</table>
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New User</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit User</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeUser()">Remove User</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
			closed="true" buttons="#dlg-buttons">
		<div class="ftitle">User Information</div>
		<form id="fm" method="post" action="<%=basePath%>/servlet/FirstEasyuiServlet?">
		
		<!-- ID-->
		<div class="fitem">
			<input type="hidden" name="id" class="easyui-validatebox" >
		</div>
			
			<div class="fitem">
				<label>First Name:</label>
				<input name="firstName" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>Last Name:</label>
				<input name="lastName" class="easyui-validatebox" required="true">
			</div>
			<div class="fitem">
				<label>Phone:</label>
				<input name="phone">
			</div>
			<div class="fitem">
				<label>Email:</label>
				<input name="email" class="easyui-validatebox" validType="email">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">Save</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
	</div>
</body>
</html>