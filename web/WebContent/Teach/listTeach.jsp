<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.* ,util.DBUtil ,java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>查询上课信息</title>
  </head>
  <body>
  	<center>
  	<h1>教学管理系统</h1>
		<h2>查询上课信息</h2>
    	<%List<Teach> teachs = (List<Teach>) request.getAttribute("teachs");%>
    	<table>
    		<tr>
    			<th>课程编号</th>
    			<th>课程名</th>
    			<th>教师编号</th>
    			<th>教师姓名</th>
    			<th>操作</th>	
    		</tr>
    		<%for(Teach teach: teachs){%>
    		<tr>
    			<%
    			request.setCharacterEncoding("utf8");
    			response.setCharacterEncoding("utf8");
    			Connection conn = null;
    			Statement st = null;
    			Course course = new Course();
    			Teacher teacher = new Teacher();
    			try {
    				conn = DBUtil.getConnection();
    				st = conn.createStatement();
    				ResultSet rs1 = st.executeQuery("select * from course where cid = " + teach.getCid());
    				while(rs1.next()){
    					course.setCname(rs1.getString("cname"));
    				}
    				ResultSet rs2 = st.executeQuery("select * from teacher where tid = " + teach.getTid());
    				while(rs2.next()){
    					
    					teacher.setTname(rs2.getString("tname"));
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
    			<td><%=teach.getCid()%></td>
    			<td><%=course.getCname()%></td>
    			<td><%=teach.getTid()%></td>
    			<td><%=teacher.getTname()%></td>
    			<td>
	    			<a href="updateTeach.do?cid=<%=teach.getCid()%>&tid=<%=teach.getTid()%>">修改</a>
	    			<a href="deleteTeach.do?cid=<%=teach.getCid()%>&tid=<%=teach.getTid()%>">删除</a>
    			</td>
    		</tr>
    		<%}%>
    	</table>
    	<p>
    	共<%=teachs.size()%>条记录, <a href="addTeach.jsp">新增上课信息</a>
    	<input type="button" value="返回" onclick="javascript:window.history.back(-1);">
    	</p>
    	<a href="../index.jsp">返回首页</a>
    </center>
  </body>
</html>
