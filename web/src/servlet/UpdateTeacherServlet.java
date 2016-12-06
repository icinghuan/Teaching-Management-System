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

import model.Teacher;
import util.DBUtil;

public class UpdateTeacherServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		Connection conn = null;
		Statement st = null;
		try {
			conn = DBUtil.getConnection();
			st = conn.createStatement();
			String tid = request.getParameter("tid");
			ResultSet rs = st.executeQuery("select * from teacher where tid = " + tid);
			if(rs.next()){
				Teacher teacher = new Teacher();
				teacher.setTid(rs.getString("tid"));
				teacher.setTname(rs.getString("Tname"));
				teacher.setPwd(rs.getString("pwd"));
				teacher.setDepart(rs.getString("depart"));
				System.out.println(teacher.getTid());
				request.setAttribute("teacher", teacher);
			}
			request.getRequestDispatcher("updateTeacher.jsp").forward(request, response);
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
			String tid = request.getParameter("tid");
			String tname = request.getParameter("tname");
			String pwd = request.getParameter("pwd");
			String depart = request.getParameter("depart");
			System.out.println(tname);
			st.execute("update teacher set tname = '" + tname + "', pwd = '" + pwd + "', depart = '"+ depart + "' where tid = " + tid);
			response.sendRedirect("listTeacher.do");
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
