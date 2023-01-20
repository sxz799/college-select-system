package dao;

//大学业务逻辑类
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.College;
import entity.Relation;
import util.DBHelper;

public class CollegeDAO {
	public ArrayList<College> getAllCollege() { // 获得所有大学信息
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<College> list = new ArrayList<College>(); // 大学集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from college order by college_grade DESC;"; // sql语句
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				College coll = new College();
				coll.setCollege_id(rs.getInt("college_id"));
				coll.setCollege_name(rs.getString("college_name"));
				coll.setCollege_grade(rs.getInt("college_grade"));
				coll.setCollege_location(rs.getString("college_location"));
				list.add(coll); // 把大学信息加入集合
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
	
	public ArrayList<Relation> getCollegeByMajor(String majorname) { // 获得所有大学信息
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Relation> list = new ArrayList<Relation>(); // 大学集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from relation where rmajor_name=? order by rmajor_line DESC;"; // sql语句
			ps = conn.prepareStatement(sql);
			ps.setString(1,majorname);
			rs = ps.executeQuery();
			while (rs.next()) {
				Relation r = new Relation();
				r.setRcollege_name(rs.getString("rcollege_name"));
				r.setRmajor_name(rs.getString("rmajor_name"));
				r.setRmajor_line(Integer.parseInt(rs.getString("rmajor_line")));
				list.add(r); // 把大学信息加入集合
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

	// 根据ID获取学校详细信息
	public College getFullInfById(int college_id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from college where college_id=?;"; // sql语句
			ps = conn.prepareStatement(sql);
			ps.setInt(1, college_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				College coll = new College();
				coll.setCollege_id(rs.getInt("college_id"));
				coll.setCollege_name(rs.getString("college_name"));
				coll.setCollege_grade(rs.getInt("college_grade"));
				coll.setCollege_location(rs.getString("college_location"));
				coll.setCollege_desc(rs.getString("college_desc"));
				return coll;
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

	// 条件选取大学信息
	public ArrayList<College> getCollegeByGrade(int college_grade) { //通过分数线筛选大学
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int grade = college_grade;
		ArrayList<College> list = new ArrayList<College>(); // 大学集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from college where college_grade <='" + grade + "' order by college_grade desc"; // sql语句
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				College coll = new College();
				coll.setCollege_id(rs.getInt("college_id"));
				coll.setCollege_name(rs.getString("college_name"));
				coll.setCollege_grade(rs.getInt("college_grade"));
				coll.setCollege_location(rs.getString("college_location"));
				list.add(coll); // 把大学信息加入集合
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
	// 添加学校函数
	public Boolean addCollege(College coll) { 
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "INSERT INTO college ( `college_name`, `college_grade`, `college_location`, `college_desc`) VALUES (?,?,?,?);"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sql);
//			ps.setInt(1, coll.getCollege_id());  //无需设置id
			ps.setString(1, coll.getCollege_name());
			ps.setInt(2, coll.getCollege_grade());
			ps.setString(3, coll.getCollege_location());
			ps.setString(4, coll.getCollege_desc());
			ps.executeUpdate();// 数据库更新操作
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
	// 更新学校函数 同时修改relation表中的学校名称
	public Boolean updateCollege(College coll) { 
		Connection conn = null;
		PreparedStatement pssel = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		String sqlsel = "select college_name from college where college_id='" + coll.getCollege_id() + "'"; // sql语句
		String sql1 = "update college set college_name=?,college_grade=?,college_location=?,college_desc=? where college_id=?;"; // sql语句
		String sql2 = "update relation set rcollege_name=? where rcollege_name=?;"; // sql语句
		try {
			conn = DBHelper.getConnection();
			pssel = conn.prepareStatement(sqlsel);
			rs = pssel.executeQuery();
			while (rs.next()) {
				conn = DBHelper.getConnection();
				ps = conn.prepareStatement(sql1);
				ps.setString(1, coll.getCollege_name());
				ps.setInt(2, coll.getCollege_grade());
				ps.setString(3, coll.getCollege_location());
				ps.setString(4, coll.getCollege_desc());
				ps.setInt(5, coll.getCollege_id());
				int n = ps.executeUpdate();// 数据库更新操作
				ps2 = conn.prepareStatement(sql2);
				ps2.setString(1, coll.getCollege_name());
				ps2.setString(2, rs.getString("college_name"));
				int n2 = ps2.executeUpdate();// 数据库更新操作
			}
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
			if (ps2 != null) {
				try {
					ps2.close();
					ps2 = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (ps != null) {
				try {
					ps.close();
					ps = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (pssel != null) {
				try {
					pssel.close();
					pssel = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	// 删除学校函数
	public Boolean delCollege(int coll_id) { 
		Connection conn = null;
		PreparedStatement pssel = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		String sqlsel = "select college_name from college where college_id=?;"; // sql语句
		String sqldel1 = "delete from relation where rcollege_name=?;"; // sql语句 同步删除relation表中的记录表
		String sqldel2 = "delete from college where college_id=?;"; // sql语句
		try {
			conn = DBHelper.getConnection();
			pssel = conn.prepareStatement(sqlsel);
			pssel.setInt(1, coll_id);
			rs = pssel.executeQuery();
			while (rs.next()) {
				System.out.print(rs.getString("college_name"));
				ps1 = conn.prepareStatement(sqldel1);
				ps1.setString(1, rs.getString("college_name"));
				ps1.executeUpdate();// 数据库更新操作
				ps2 = conn.prepareStatement(sqldel2);
				ps2.setInt(1, coll_id);
				ps2.executeUpdate();// 数据库更新操作
			}
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
			if (pssel != null) {
				try {
					pssel.close();
					pssel = null;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
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
	//通过学校名称获取学校ID
	public int getCollegeIdByCollegeNane(String cname) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sqlins = "select college_id from college where college_name='" + cname + "'"; // sql语句
		try {
			conn = DBHelper.getConnection();
			ps = conn.prepareStatement(sqlins);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt("college_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
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
	//获取学校总数
	public int getCollegeNum() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select count(*) from college"; // sql语句
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



//	public static void main(String[] args) // 测试del
//	{
//		
//		CollegeDAO colldao = new CollegeDAO();
//		boolean isSuccess = colldao.delCollege(105);
//		System.out.print(isSuccess);
//	}
//	public static void main(String[] args) // 测试添加专业函数
//	{
//		CollegeDAO c=new CollegeDAO();
//		boolean isSuccess = c.addMajorToCollege("山东大学","建筑");
//		System.out.print(isSuccess);
//	}	
//	public static void main(String[] args) // 测试添加专业函数
//	{
//		CollegeDAO c=new CollegeDAO();
//		boolean isSuccess = c.delMajorToCollege("山东大学","建筑");
//		System.out.print(isSuccess);
//	}
//	public static void main(String[] args) // 测试添加专业函数
//	{
//		CollegeDAO c=new CollegeDAO();
//		int id = c.getCollegeIdByCollegeNane("山东大学");
//		System.out.print(id);
//	}
//	public static void main(String[] args) // 测试添加专业函数
//	{
//		CollegeDAO c = new CollegeDAO();
//		int id = c.getCollegeNum();
//		System.out.print(id);
//	}
	public static void main(String[] args) // 测试添加专业函数
	{
		CollegeDAO c = new CollegeDAO();
		ArrayList<Relation> list=c.getCollegeByMajor("网络工程");
		for (int i = 0; i < list.size(); i++) {
			int k = i + 1;
			System.out.print(k);
			Relation rf = list.get(i);
			String cname=rf.getRcollege_name();
			int cline=rf.getRmajor_line();
			System.out.print(cname);
			System.out.print(cline);
	}
	}
}
