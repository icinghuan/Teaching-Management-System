<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.* ,util.DBUtil ,java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>查询成绩信息</title>
  </head>
  <body>
  	<center>
  	<h1>教学管理系统</h1>
		<h2>查询成绩信息</h2>
    	<%List<Score> scores = (List<Score>) request.getAttribute("scores");%>
    	<table>
    		<tr>
    			<th>课程编号</th>
    			<th>课程名</th>
    			<th>学号</th>
    			<th>学生姓名</th>
    			<th>成绩</th>
    			<th>操作</th>	
    		</tr>
    		<%for(Score score: scores){%>
    		<tr>
    			<%
    			request.setCharacterEncoding("utf8");
    			response.setCharacterEncoding("utf8");
    			Connection conn = null;
    			Statement st = null;
    			Course course = new Course();
    			Student student = new Student();
    			try {
    				conn = DBUtil.getConnection();
    				st = conn.createStatement();
    				ResultSet rs1 = st.executeQuery("select * from course where cid = " + score.getCid());
    				while(rs1.next()){
    					course.setCname(rs1.getString("cname"));
    				}
    				ResultSet rs2 = st.executeQuery("select * from student where sid = " + score.getSid());
    				while(rs2.next()){
    					
    					student.setSname(rs2.getString("sname"));
    				}
    			} catch (SQLException e) {
    				e.printStackTrace();
    			} finally {
    				try{
    					st.close();
    				}catch(Exception e){}
    				try{
    					conn.close();
    				}catch(Exception e){}
    			}
    			%>
    			<td><%=score.getCid()%></td>
    			<td><%=course.getCname()%></td>
    			<td><%=score.getSid()%></td>
    			<td><%=student.getSname()%></td>
    			<td><%=score.getScore()%></td>
    			<td>
	    			<a href="deleteScore.do?cid=<%=score.getCid()%>&sid=<%=score.getSid()%>">删除</a>
    			</td>
    		</tr>
    		<%}%>
    	</table>
    	<p>
    	共<%=scores.size()%>条记录, <a href="addScore.jsp">新增成绩信息</a>
    	<input type="button" value="返回" onclick="javascript:window.history.back(-1);">
    	</p>
    	<a href="../index.jsp">返回首页</a>
    </center>
  </body>
</html>
