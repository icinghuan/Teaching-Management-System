package model;

public class Student {
	private String sid;
	private String sname;
	private String pwd;
	private String major;
	public String getSid(){
		return sid;
	}
	public void setSid(String sid){
		this.sid = sid;
	}
	public String getSname(){
		return sname;
	}
	public void setSname(String sname){
		this.sname = sname;
	}
	public String getPwd(){
		return pwd;
	}
	public void setPwd(String pwd){
		this.pwd = pwd;
	}
	public String getMajor(){
		return major;
	}
	public void setMajor(String major){
		this.major = major;
	}
}
