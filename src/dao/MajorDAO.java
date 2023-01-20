package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Major;
import util.DBHelper;
public class MajorDAO {
	public ArrayList<Major> getAllMajor() {		// 获得所有专业列表
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Major> list = new ArrayList<Major>(); // 专业集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from major;"; // sql语句
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Major m = new Major();
				m.setMajor_id(rs.getInt("major_id"));
				m.setMajor_name(rs.getString("major_name"));
				list.add(m); // 把专业信息加入集合
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
	public Major geteMajorById(int major_id) { //通过id获取专业，辅助更新操作
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from major where major_id=?;"; // sql语句
			ps = conn.prepareStatement(sql);
			ps.setInt(1, major_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				Major m = new Major();
				m.setMajor_id(rs.getInt("major_id"));
				m.setMajor_name(rs.getNString("major_name"));
				return m;
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
	public Boolean addMajor(Major ma) { //添加专业函数
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "INSERT INTO major ( `major_name`) VALUES (?);"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, ma.getMajor_name());
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
//	public Boolean updateMajor(Major ma) { //更新专业函数
//		Connection conn = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		String sql = "update major set major_name=? where major_id=?;"; // sql语句
//		try {
//			conn = DBHelper.getConnection();
//			ps = conn.prepareStatement(sql);
//			ps.setString(1, ma.getMajor_name());
//			ps.setInt(2, ma.getMajor_id());  
//			int n = ps.executeUpdate();// 数据库更新操作
//			return true;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return false;
//		} finally {
//			// 释放数据集对象
//			if (rs != null) {
//				try {
//					rs.close();
//					rs = null;
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//			// 释放语句对象
//			if (ps != null) {
//				try {
//					ps.close();
//					ps = null;
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
	public Boolean delMajor(String mname)  { //删除专业函数 需要删除2个表的记录
		Connection conn = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		String sql1 = "delete from major where major_name=?;"; // sql语句
		String sql2 = "delete from relation where rmajor_name=?;"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps1 = conn.prepareStatement(sql1);
			ps1.setString(1, mname); 
			ps1.executeUpdate();// 数据库更新操作
			ps2 = conn.prepareStatement(sql2);
			ps2.setString(1, mname); 
			ps2.executeUpdate();// 数据库更新操作
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
			if (ps1 != null) {
				try {
					ps1.close();
					ps1 = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (ps2 != null) {
				try {
					ps2.close();
					ps2 = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	public int getMajoreNum()
	{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select count(*) from major"; // sql语句
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
//		Major e=new Major();
//		e.setMajor_name("标题1");
//		MajorDAO ed = new MajorDAO();
//		boolean isSuccess = ed.addMajor(e);
//		System.out.print(isSuccess);
//	}
//
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
//
//	public static void main(String[] args) // 测试del
//	{
//		
//		MajorDAO eDao = new MajorDAO();
//		boolean isSuccess = eDao.delMajor("环境设计");
//		System.out.print(isSuccess);
//	}
//	
//	public static void main(String[] args) {
//		MajorDAO md=new MajorDAO();
//		ArrayList<Major> list = md.getAllMajorByCollegeName("山东大学");
//		if (list != null && list.size() > 0) 
//		{
//			for (int i = 0; i < list.size(); i++) {
//				
//				Major ml = list.get(i);
//				System.out.println(ml.getMajor_name());
//	}
//		}
//		
//	}
}
