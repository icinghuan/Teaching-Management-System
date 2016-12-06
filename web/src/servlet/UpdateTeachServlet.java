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

import model.Teach;
import util.DBUtil;

public class UpdateTeachServlet extends HttpServlet {
	
	private String tid0 = "";
	
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
			String tid = request.getParameter("tid");
			tid0 = tid;
			ResultSet rs = st.executeQuery("select * from teach where cid = " + cid + " and tid = " + tid);
			if(rs.next()){
				Teach teach = new Teach();
				teach.setCid(rs.getString("cid"));
				teach.setTid(rs.getString("tid"));
				request.setAttribute("teach", teach);
			}
			request.getRequestDispatcher("updateTeach.jsp").forward(request, response);
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
			String tid = request.getParameter("tid");
			//System.out.println("ok");
			st.execute("update teach set tid = " + tid + " where cid = " + cid + " and tid = " + tid0);
			response.sendRedirect("listTeach.do");
			//System.out.println("exit");
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
