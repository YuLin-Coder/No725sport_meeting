package edu.school.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonFormat;

//管理员表
public class ScoreDemo  {
	private Integer id;	
	private String sname;
	private String sdate;
	private String fname;
	private Integer fmingci;
	private String lname;
	private Integer lmingci;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public Integer getFmingci() {
		return fmingci;
	}
	public void setFmingci(Integer fmingci) {
		this.fmingci = fmingci;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public Integer getLmingci() {
		return lmingci;
	}
	public void setLmingci(Integer lmingci) {
		this.lmingci = lmingci;
	}
	
	
}
