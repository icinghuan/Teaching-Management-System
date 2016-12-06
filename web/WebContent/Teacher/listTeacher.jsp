<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>查询教师信息</title>
  </head>
  <body>
  	<center>
  	<h1>教学管理系统</h1>
		<h2>查询教师信息</h2>
    	<%List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers");%>
    	<table>
    		<tr>
    			<th>教师编号</th>
    			<th>姓名</th>
    			<th>密码</th>
    			<th>部门</th>
    			<th>操作</th>	
    		</tr>
    		<%for(Teacher teacher: teachers){%>
    		<tr>
    			<td><%=teacher.getTid()%></td>
    			<td><%=teacher.getTname()%></td>
    			<td><%=teacher.getPwd()%></td>
    			<td><%=teacher.getDepart()%></td>
    			<td>
	    			<a href="updateTeacher.do?tid=<%=teacher.getTid()%>">修改</a>
	    			<a href="deleteTeacher.do?tid=<%=teacher.getTid()%>">删除</a>
    			</td>
    		</tr>
    		<%}%>
    	</table>
    	<p>
    	共<%=teachers.size()%>条记录, <a href="addTeacher.jsp">新增教师</a>
    	<input type="button" value="返回" onclick="javascript:window.history.back(-1);">
    	</p>
    	<a href="../index.jsp">返回首页</a>
    </center>
  </body>
</html>
