<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>新增教师信息</title>
</head>
<body>
		<script type="text/javascript">
			function myCheck()
			{
			   for(var i=0;i<document.form1.elements.length-1;i++)
			   {
				  if(document.form1.elements[i].value=="")
				  {
					 alert("当前表单不能有空项");
					 document.form1.elements[i].focus();
					 return false;
				  }
			   }
			   return true;
			  
			}
		</script>
	<center>
		<h1>教学管理系统</h1>
		<h2>新增教师信息</h2>
		<form name="form1" method="post" action="addTeacher.do" onSubmit="return myCheck()">
			<table>
			<tr>
				<td>教师编号</td>
				<td><input type="text" name="tid" /></td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><input type="text" name="tname" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="pwd" /></td>
			</tr>
			<tr>
				<td>部门</td>
				<td><input type="text" name="depart" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="提交" />
					<input type="reset" value="重置" /></td>
				<td><input type="button" value="返回" onclick="javascript:window.history.back(-1);"></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="../index.jsp">返回首页</a></td>
			</tr>
			</table>
		</form>
	</center>
</body>

</html>