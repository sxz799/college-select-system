package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Major;
import entity.Relation;
import util.DBHelper;
public class RelationDAO {
	//为学校添加专业
	public boolean addMajorToCollege(String cname,String mname,int mline) {
		Connection conn = null;
		PreparedStatement psins = null;
		ResultSet rs = null;
		String sqlins = "INSERT INTO relation ( rcollege_name,rmajor_name,rmajor_line) VALUES (?,?,?);"; // sql语句
		try {
			conn = DBHelper.getConnection();
			psins = conn.prepareStatement(sqlins);
			psins.setString(1, cname); 
			psins.setString(2, mname); 
			psins.setInt(3, mline); 
			psins.executeUpdate();// 数据库更新操作
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
			if (psins != null) {
				try {
					psins.close();
					psins = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	//为学校更新专业分数线
		public boolean updMajorforCollege(String cname,String mname,int mline) { //给学校更新专业分数线信息
			Connection conn = null;
			PreparedStatement psins = null;
			ResultSet rs = null;
			String sqlins = "update relation set rmajor_line=? where rcollege_name=? and rmajor_name=?"; // sql语句
			try {
				conn = DBHelper.getConnection();
				psins = conn.prepareStatement(sqlins);
				psins.setInt(1, mline); 
				psins.setString(2, cname); 
				psins.setString(3, mname); 
				int n1 = psins.executeUpdate();// 数据库更新操作
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
				if (psins != null) {
					try {
						psins.close();
						psins = null;
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	//为学校删除专业
		public boolean delMajorForCollege(String cname,String mname) {
			Connection conn = null;
			PreparedStatement psins = null;
			ResultSet rs = null;
			String sqlins = "delete from relation where rcollege_name=? and rmajor_name=?"; // sql语句
			try {
				conn = DBHelper.getConnection();
				psins = conn.prepareStatement(sqlins);
				psins.setString(1, cname); 
				psins.setString(2, mname); 
				int n1 = psins.executeUpdate();// 数据库更新操作
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
				if (psins != null) {
					try {
						psins.close();
						psins = null;
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

	public ArrayList<Major> getAllMajorByCollegeName(String cname) {		// 通过学习名称获取专业列表
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			ArrayList<Major> list = new ArrayList<Major>(); // 创建专业list
			try {
				conn = DBHelper.getConnection();
				String sql = "select rmajor_name,rmajor_line from relation where rcollege_name=?;"; // sql语句
				ps = conn.prepareStatement(sql);
				ps.setString(1, cname);
				rs = ps.executeQuery();
				while (rs.next()) {
					Major m = new Major();
					m.setMajor_name(rs.getString("rmajor_name"));
					m.setMajor_line(rs.getInt("rmajor_line"));
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
		public static void main(String[] args) // 测试update
		{
			RelationDAO colldao = new RelationDAO();
			boolean isSuccess = colldao.updMajorforCollege("清华大学","法律",500);
			System.out.print(isSuccess);
		}
}
