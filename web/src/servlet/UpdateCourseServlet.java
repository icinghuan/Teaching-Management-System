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
import util.DBUtil;

public class UpdateCourseServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		Connection conn = null;
		Statement st = null;
		try {
			conn = DBUtil.getConnection();
			st = conn.createStatement();
			String cid = request.getParameter("cid");
			ResultSet rs = st.executeQuery("select * from course where cid = " + cid);
			if(rs.next()){
				Course course = new Course();
				course.setCid(rs.getString("cid"));
				course.setCname(rs.getString("Cname"));
				course.setPoint(rs.getString("point"));
				System.out.println(course.getCid());
				request.setAttribute("course", course);
			}
			request.getRequestDispatcher("updateCourse.jsp").forward(request, response);
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		Connection conn = null;
		Statement st = null;
		try {
			conn = DBUtil.getConnection();
			st = conn.createStatement();
			String cid = request.getParameter("cid");
			String cname = request.getParameter("cname");
			String point = request.getParameter("point");
			System.out.println(cname);
			st.execute("update course set cname = '" + cname + "', point = '"+ point + "' where cid = " + cid);
			response.sendRedirect("listCourse.do");
			System.out.println("exit");
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
