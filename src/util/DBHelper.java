package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBHelper 
{
	//链接数据库
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/ccls?useSSL=false";
	private static final String username = "root";
	private static final String password = "123456";
	private static Connection conn=null; 
		
	//静态代码块，负责加载驱动
	static {
		try {
			Class.forName(driver);
		}
		catch (Exception ex) {
			
			ex.printStackTrace();
		}
	}
	//返回数据库链接对象
	public static Connection getConnection() throws Exception {
		if(conn==null)
		{
			conn = DriverManager.getConnection(url,username,password);
			return conn;
		}
		return conn;
	
	}
	public static void main(String[] args) {
		try {
			Connection conn = DBHelper.getConnection();
			if(conn!=null)
				System.out.println("数据库链接正常");
			else {
				System.out.println("数据库链接异常");
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	
}

	









