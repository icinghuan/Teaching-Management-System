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

import model.Student;
import util.DBUtil;

public class UpdateStudentServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		Connection conn = null;
		Statement st = null;
		try {
			conn = DBUtil.getConnection();
			st = conn.createStatement();
			String sid = request.getParameter("sid");
			ResultSet rs = st.executeQuery("select * from student where sid = " + sid);
			if(rs.next()){
				Student student = new Student();
				student.setSid(rs.getString("sid"));
				student.setSname(rs.getString("Sname"));
				student.setPwd(rs.getString("pwd"));
				student.setMajor(rs.getString("major"));
				System.out.println(student.getSid());
				request.setAttribute("student", student);
			}
			request.getRequestDispatcher("updateStudent.jsp").forward(request, response);
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
			String sid = request.getParameter("sid");
			String sname = request.getParameter("sname");
			String pwd = request.getParameter("pwd");
			String major = request.getParameter("major");
			System.out.println(sname);
			st.execute("update student set sname = '" + sname + "', pwd = '" + pwd + "', major = '"+ major + "' where sid = " + sid);
			response.sendRedirect("listStudent.do");
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
