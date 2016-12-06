package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Course;
import model.Student;
import util.DBUtil;

public class QueryCourseServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	request.setCharacterEncoding("utf8");
	response.setCharacterEncoding("utf8");
	Connection conn = null;
	Statement st = null;
	String cid = (String)request.getParameter("cid");
	System.out.println(cid);
	String sid = (String)request.getParameter("sid");
	try {
		conn = DBUtil.getConnection();
		st = conn.createStatement();
		ResultSet rs1 = st.executeQuery("select * from course where cid = " + cid);
		while(rs1.next()){
			Course course = new Course();
			//System.out.println(course.getCname());
			course.setCname(rs1.getString("cname"));
			request.setAttribute("cname",course.getCname());
		}
		ResultSet rs2 = st.executeQuery("select * from student where sid = " + sid);
		while(rs2.next()){
			Student student = new Student();
			student.setSname(rs2.getString("sname"));
			request.setAttribute("sname",student.getSname());
		}	
		request.getRequestDispatcher("addScore.jsp").forward(request, response);
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
	}
}