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

public class AddTeacherServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Connection conn = null;
		Statement st = null;
		try {
			conn = DBUtil.getConnection();
			st = conn.createStatement();
			String tid = request.getParameter("tid");
			String tname = request.getParameter("tname");
			String pwd = request.getParameter("pwd");
			String depart = request.getParameter("depart");
			st.execute("insert into teacher values ('" + tid + "','" + tname +"','" + pwd + "','" + depart +"')");
			response.sendRedirect("../All/addSuccess.jsp");
		} catch (SQLException e) {		
			response.sendRedirect("../All/addFail.jsp");
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
