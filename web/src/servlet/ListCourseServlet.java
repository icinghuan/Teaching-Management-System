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

public class ListCourseServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		Connection conn = null;
		Statement st = null;
		try {
			conn = DBUtil.getConnection();
			st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from course");
			List<Course> courses = new ArrayList<Course>();
			while(rs.next()){
				Course course = new Course();
				course.setCid(rs.getString("cid"));
				course.setCname(rs.getString("cname"));
				course.setPoint(rs.getString("point"));
				System.out.println(course.getCid());
				courses.add(course);
			}
			//System.out.println("exit");
			request.setAttribute("courses", courses);
			request.getRequestDispatcher("listCourse.jsp").forward(request, response);
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
