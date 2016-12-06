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

import model.Score;
import util.DBUtil;

public class ListScore2Servlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		Connection conn = null;
		Statement st = null;
		try {
			conn = DBUtil.getConnection();
			st = conn.createStatement();
			String cid = (String)request.getParameter("cid");
			ResultSet rs = st.executeQuery("select * from score where cid = " + cid);
			List<Score> scores = new ArrayList<Score>();
			while(rs.next()){
				Score score = new Score();
				score.setCid(rs.getString("cid"));
				score.setSid(rs.getString("sid"));
				score.setScore(rs.getString("score"));
				System.out.println(score.getCid());
				System.out.println(score.getSid());
				scores.add(score);
			}
			System.out.println("exit");
			request.setAttribute("scores", scores);
			request.getRequestDispatcher("listScore2.jsp").forward(request, response);
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
