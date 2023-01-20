package entity;

//大学信息类
public class College {
	private int college_id; // id
	private String college_name; // 学校名
	private int college_grade; // 录取分数线
	private String college_location; // 省份
	private String college_desc; // 详细描述

	public int getCollege_id() {
		return college_id;
	}

	public void setCollege_id(int college_id) {
		this.college_id = college_id;
	}

	public String getCollege_name() {
		return college_name;
	}

	public void setCollege_name(String college_name) {
		this.college_name = college_name;
	}

	public int getCollege_grade() {
		return college_grade;
	}

	public void setCollege_grade(int college_grade) {
		this.college_grade = college_grade;
	}

	public String getCollege_location() {
		return college_location;
	}

	public void setCollege_location(String college_location) {
		this.college_location = college_location;
	}

	public String getCollege_desc() {
		return college_desc;
	}

	public void setCollege_desc(String college_desc) {
		this.college_desc = college_desc;
	}
}
