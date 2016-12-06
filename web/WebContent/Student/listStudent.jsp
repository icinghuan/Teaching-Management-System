<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>查询学生信息</title>
  </head>
  <body>
  	<center>
  	<h1>教学管理系统</h1>
		<h2>查询学生信息</h2>
    	<%List<Student> students = (List<Student>) request.getAttribute("students");%>
    	<table>
    		<tr>
    			<th>学号</th>
    			<th>姓名</th>
    			<th>密码</th>
    			<th>专业</th>
    			<th>操作</th>	
    		</tr>
    		<%for(Student student: students){%>
    		<tr>
    			<td><%=student.getSid()%></td>
    			<td><%=student.getSname()%></td>
    			<td><%=student.getPwd()%></td>
    			<td><%=student.getMajor()%></td>
    			<td>
	    			<a href="updateStudent.do?sid=<%=student.getSid()%>">修改</a>
	    			<a href="deleteStudent.do?sid=<%=student.getSid()%>">删除</a>
    			</td>
    		</tr>
    		<%}%>
    	</table>
    	<p>
    	共<%=students.size()%>条记录, <a href="addStudent.jsp">新增学生</a>
    	<input type="button" value="返回" onclick="javascript:window.history.back(-1);">
    	</p>
    	<a href="../index.jsp">返回首页</a>
    </center>
  </body>
</html>
