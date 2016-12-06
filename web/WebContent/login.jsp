<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.* ,util.DBUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>登录界面</title>
  </head>
<body>		
	<center>
		<%
		request.getSession().setAttribute("login","no");
		%>
		<h1>教学管理系统</h1>
		<form action="login.do" method="post">
			<table>
				<tr>
					<td></td>
					<td><input type="radio" name="access" value="student" checked>学生
						<input type="radio" name="access" value="teacher">教师
						<input type="radio" name="access" value="admin">管理员</td>
				</tr>
				<tr>
					<td>账号</td>
					<td><input type="text" name="id" /></td>
				</tr>

				<tr>
					<td>密码</td>
					<td><input type="password" name="pwd" /></td>
				</tr>

				<tr>
					<td></td>
				<td><input type="submit" value="登录" />
					<input type="reset" value="重置" /></td>
				</tr>
			</table>
		</form>
	
<%
 
 %>
	</center>	
</body>
</html>
