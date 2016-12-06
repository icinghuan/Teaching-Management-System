package model;

public class Teacher {
	private String tid;
	private String tname;
	private String pwd;
	private String depart;
	public String getTid(){
		return tid;
	}
	public void setTid(String tid){
		this.tid = tid;
	}
	public String getTname(){
		return tname;
	}
	public void setTname(String tname){
		this.tname = tname;
	}
	public String getPwd(){
		return pwd;
	}
	public void setPwd(String pwd){
		this.pwd = pwd;
	}
	public String getDepart(){
		return depart;
	}
	public void setDepart(String depart){
		this.depart = depart;
	}
}
