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
    			<td>
	    			<a href="../Score/listScore2.do?cid=<%=teach.getCid()%>">查看上课学生及添加成绩</a>
    			</td>
    		</tr>
    		<%}%>
    	</table>
    	<p>
    	共<%=teachs.size()%>条记录
    	<input type="button" value="返回" onclick="javascript:window.history.back(-1);">
    	</p>
    	<a href="../index.jsp">返回首页</a>
    </center>
  </body>
</html>
