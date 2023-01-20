package dao;
//文章阅读业务逻辑类
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.College;
import entity.Essay;
import util.DBHelper;
public class EssayDAO {	
	public ArrayList<Essay> getAllEssay() {		// 获得所有文章列表
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Essay> list = new ArrayList<Essay>(); // 文章集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from essay;"; // sql语句
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Essay e = new Essay();
				e.setEssay_id(rs.getInt("essay_id"));
				e.setEssay_title(rs.getString("essay_title"));
				e.setEssay_link(rs.getString("essay_link"));
				list.add(e); // 把大学信息加入集合
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
	public Essay geteEssayById(int essay_id) { //通过id获取文章，辅助更新操作
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from essay where essay_id=?;"; // sql语句
			ps = conn.prepareStatement(sql);
			ps.setInt(1, essay_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				Essay e = new Essay();
				e.setEssay_id(rs.getInt("essay_id"));
				e.setEssay_title(rs.getNString("essay_title"));
				e.setEssay_link(rs.getString("essay_link"));
				return e;
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
	public Boolean addEssay(Essay ea) { //添加文章函数
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "INSERT INTO essay ( `essay_title`, `essay_link`) VALUES (?,?);"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, ea.getEssay_title());
			ps.setString(2, ea.getEssay_link());
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
	public Boolean updateEssay(Essay ea) { //更新文章函数
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "update essay set essay_title=?,essay_link=? where essay_id=?;"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, ea.getEssay_title());
			ps.setString(2, ea.getEssay_link());
			ps.setInt(3, ea.getEssay_id());  
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
	public Boolean delEssay(int ea_id)  { //删除文章函数
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "delete from essay where essay_id=?;"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ea_id); 
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
	public int getEssayeNum()	//获取文章数量
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select count(*) from essay"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
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
//	public static void main(String[] args) // 测试add
//	{
//		Essay e=new Essay();
//		e.setEssay_title("标题1");
//		e.setEssay_link("http://www.baidu.com");
//		EssayDAO ed = new EssayDAO();
//		boolean isSuccess = ed.addEssay(e);
//		System.out.print(isSuccess);
//	}
//	public static void main(String[] args) // 测试update
//	{
//	Essay e=new Essay();
//	e.setEssay_id(3);
//	e.setEssay_title("标题2");
//	e.setEssay_link("http://www.666baidu.com");
//	EssayDAO ed = new EssayDAO();
//	boolean isSuccess = ed.updateEssay(e);
//	System.out.print(isSuccess);
//	}	
//	public static void main(String[] args) // 测试del
//	{
//		
//		EssayDAO eDao = new EssayDAO();
//		boolean isSuccess = eDao.delEssay(3);
//		System.out.print(isSuccess);
//	}
}