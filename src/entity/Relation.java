package entity;

public class Relation {
	private String rcollege_name;
	private String rmajor_name;
	private int rmajor_line;

	public int getRmajor_line() {
		return rmajor_line;
	}

	public String getRcollege_name() {
		return rcollege_name;
	}

	public void setRcollege_name(String rcollege_name) {
		this.rcollege_name = rcollege_name;
	}

	public String getRmajor_name() {
		return rmajor_name;
	}

	public void setRmajor_name(String rmajor_name) {
		this.rmajor_name = rmajor_name;
	}

	public void setRmajor_line(int rmajor_line) {
		this.rmajor_line = rmajor_line;
	}

}
