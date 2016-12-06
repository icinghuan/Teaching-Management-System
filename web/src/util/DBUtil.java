package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*public class DBUtil {
	private static String className = "com.mysql.jdbc.Driver";

	private static String url = "jdbc:mysql://localhost:3306/web";

	private static String username = "root";

	private static String password = "19951103";
	private static Connection conn = null;

	public static Connection getConnection() {
	try {
	   if (conn !=null) return conn;
	   Class.forName(className);
	   conn = DriverManager.getConnection(url, username, password);
	   return conn;
	  } catch (ClassNotFoundException e) {
	   // TODO Auto-generated catch block
	   e.printStackTrace();
	  } catch (SQLException e) {
	   // TODO Auto-generated catch block
	   e.printStackTrace();
	  }
	  return null;
	 }
}*/

public class DBUtil {
	private static final String jdbcUrl = "jdbc:mysql://localhost:3306/web?useUnicode=true&characterEncoding=utf-8";
	private static final String user = "root";
	private static final String passwd = "19951103";
    
	static {
        try { 
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public static Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(jdbcUrl, user, passwd);
        return conn;
    }
}

