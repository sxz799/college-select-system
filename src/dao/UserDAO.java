package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Essay;
import entity.User;
import util.DBHelper;

public class UserDAO {
	public boolean CheckUser(String Uname, String Upwd) { // 判断登录
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String name = Uname;
			String pwd = Upwd;
			String sql = "SELECT * FROM user WHERE name ='" + name + "'AND pwd = '" + pwd + "'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public boolean UserReg(String Uname, String Upwd) { // 用户注册
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement pscheck = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String name = Uname;
			String pwd = Upwd;
			String sqlcheck = "select * from user where name = '" + name + "'";
			pscheck = conn.prepareStatement(sqlcheck); // 先判断数据库内是否有重名用户
			rs = pscheck.executeQuery();
			if (rs.next()) // 先判断数据库内是否有重名用户
			{
				return false;
			} else {
				String sql = "INSERT user(name,pwd) VALUES(?,?)"; // 插入数据进行注册
				ps = conn.prepareStatement(sql);
				ps.setString(1, name);
				ps.setString(2, pwd);
				ps.executeUpdate();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public boolean delUser(String uname) { // 删除用户
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement pscheck = null;
		ResultSet rs = null;
		String name = uname;
		try {
			conn = DBHelper.getConnection();
			String sqldel = "DELETE from user where name = '" + name + "'";
			ps = conn.prepareStatement(sqldel);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	// 获得所有用户列表
	public ArrayList<User> getAllUser() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<User> list = new ArrayList<User>(); // 用户集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from user;"; // sql语句
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setName(rs.getString("name"));
				u.setPwd(rs.getString("pwd"));
				list.add(u); // 把用户信息加入集合
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public User geteUserByName(String uname) { // 通过用户名获取用户信息
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String name = uname;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from user where name=?;"; // sql语句
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			if (rs.next()) {
				User u = new User();
				u.setName(rs.getString("name"));
				u.setPwd(rs.getString("pwd"));
				return u;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public Boolean updateUser(User u) { // 更新用户信息函数
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "update user set pwd=? where name=?;"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, u.getPwd());
			ps.setString(2, u.getName());
			int n = ps.executeUpdate();// 数据库更新操作
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public int getUserNum() { //获取用户数量和
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select count(*) from user"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 释放语句对象
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}
//	public static void main(String[] args) {
//		UserDAO u=new UserDAO();
//		Boolean isSuccess =u.delUser("555");
//		System.out.print(isSuccess);
//	}
//		public static void main(String[] args) // 测试update
//		{
//		User e=new User();
//		e.setName("555");
//		e.setPwd("565");
//		UserDAO ed = new UserDAO();
//		boolean isSuccess = ed.updateUser(e);
//		System.out.print(isSuccess);
//		}	
}
