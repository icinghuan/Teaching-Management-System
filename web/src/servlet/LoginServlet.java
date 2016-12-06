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

import util.DBUtil;

public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		Connection conn = null;
		Statement st = null;
		String access = request.getParameter("access");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		 if(id!=null && !id.equals(""))
		 	{
				try{
			 		conn = DBUtil.getConnection();
					st = conn.createStatement();
					System.out.println(access);
					String tab = "student";
					String acc = "sid";
					if (access.equals("admin"))
					{
						tab = "admin";
						acc = "aid";
					}else{
						if (access.equals("teacher"))
						{
							tab = "teacher";
							acc = "tid";
						}
					}
		             String sql="select * from "+ tab + " where "+ acc +" ='"+id+"'";
		             sql +="and pwd='"+pwd+"'";
		             ResultSet rs=(ResultSet)st.executeQuery(sql);
		             if(rs.next())
		               {
		            	 request.getSession().setAttribute("access",access);
		            	 request.getSession().setAttribute("login","ok");
		            	 request.getSession().setAttribute("id",id);
		            	 response.sendRedirect("index.jsp");
		               }else response.sendRedirect("All/loginFail.jsp");
				}catch(Exception ee){ee.printStackTrace();}
		          
		 	}else{
		 		response.sendRedirect("All/loginFail.jsp"); 
		          }

	}
}
