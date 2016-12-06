<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>主页</title>
 </head>
 <body>
 	<center>
 	<h1>教学管理系统</h1>
    	<%
    		String access = (String)request.getSession().getAttribute("access");
    	 	String login = (String)request.getSession().getAttribute("login");
         	String id = (String)request.getSession().getAttribute("id"); 
     		 if(login == null || login.equals("no")){
     	 %>
     		<jsp:forward page="login.jsp"></jsp:forward>
     	<%}
     		else
     		{%>
     			登录成功！id = <%=id%> & access = <%=access%>
     			<a href="login.jsp">退出登录</a>
     			</br></br>
     			<%if (access.equals("admin"))
     			{%>
     				<!-- admin -->
     				<a href="Student/listStudent.do">查询学生信息</a>
					<a href="Student/addStudent.jsp">添加学生信息</a>
					</br></br>
					<a href="Teacher/listTeacher.do">查询教师信息</a>
					<a href="Teacher/addTeacher.jsp">添加教师信息</a>
					</br></br>
					<a href="Course/listCourse.do">查询课程信息</a>
					<a href="Course/addCourse.jsp">添加课程信息</a>
					</br></br>
					<a href="Teach/listTeach.do">查询上课信息</a>
					<a href="Teach/addTeach.jsp">添加上课信息</a>
					</br></br>
					<a href="Score/listScore.do">查询成绩信息</a>
					<a href="Score/addScore.jsp">添加成绩信息</a>
					</br></br>
     			<%}
     			else
     			{
     				if (access.equals("teacher"))
     				{%>
     				<!-- teacher -->
					<a href="Teach/listTeach2.do?tid=<%=id%>">查询上课信息</a>
					</br></br>
     				<%}
     				else
     				{%>
     				<!-- student -->
					<a href="Score/listScore3.do?sid=<%=id%>">查询课程与成绩信息</a>
					</br></br>
     				<%}
     			}
     		}
    	%>
    		</center>
  </body>
</html>

