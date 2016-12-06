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

public class ListTeachServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		Connection conn = null;
		Statement st = null;
		try {
			conn = DBUtil.getConnection();
			st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from teach");
			List<Teach> teachs = new ArrayList<Teach>();
			while(rs.next()){
				Teach teach = new Teach();
				teach.setCid(rs.getString("cid"));
				teach.setTid(rs.getString("tid"));
				System.out.println(teach.getCid());
				System.out.println(teach.getTid());
				teachs.add(teach);
			}
			System.out.println("exit");
			request.setAttribute("teachs", teachs);
			request.getRequestDispatcher("listTeach.jsp").forward(request, response);
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
