<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>查询课程信息</title>
  </head>
  <body>
  	<center>
  	<h1>教学管理系统</h1>
		<h2>查询课程信息</h2>
    	<%List<Course> courses = (List<Course>) request.getAttribute("courses");%>
    	<table>
    		<tr>
    			<th>课程号</th>
    			<th>课程名</th>
    			<th>学分</th>
    			<th>操作</th>	
    		</tr>
    		<%for(Course course: courses){%>
    		<tr>
    			<td><%=course.getCid()%></td>
    			<td><%=course.getCname()%></td>
    			<td><%=course.getPoint()%></td>
    			<td>
	    			<a href="updateCourse.do?cid=<%=course.getCid()%>">修改</a>
	    			<a href="deleteCourse.do?cid=<%=course.getCid()%>">删除</a>
    			</td>
    		</tr>
    		<%}%>
    	</table>
    	<p>
    	共<%=courses.size()%>条记录, <a href="addCourse.jsp">新增课程</a>
    	<input type="button" value="返回" onclick="javascript:window.history.back(-1);">
    	</p>
    	<a href="../index.jsp">返回首页</a>
    </center>
  </body>
</html>
