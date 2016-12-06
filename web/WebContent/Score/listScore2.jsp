<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.* ,util.DBUtil ,java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>查看上课学生及添加成绩</title>
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
		<h2>查看上课学生及添加成绩</h2>
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
    			<%
    				if (score.getScore() == null)
    				{%>
						<td>
							<form action="addScore2.do?cid=<%=score.getCid()%>&sid=<%=score.getSid()%>" method="post" onSubmit="return myCheck()">
								<input style="width:30px;" type="text" name="score" />
								<input type="submit" value="添加成绩" />
    						</form>
    	    			</td>
    				<%}else{
    					%>
    					<td></td>
    					<%
    				}
    			%>
    			
    		</tr>
    		<%}%>
    	</table>
    	<p>
    	共<%=scores.size()%>条记录,已经添加的成绩无法修改，如需修改请联系管理员删除成绩。
    	<input type="button" value="返回" onclick="javascript:window.history.back(-1);">
    	</p>
    	<a href="../index.jsp">返回首页</a>
    </center>
  </body>
</html>
