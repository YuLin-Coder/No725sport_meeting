package edu.school.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonFormat;

//管理员表
public class Score  {
	private Integer id;	
	private Integer baomingId;
	private Integer mingci;
	private String note;
	private String tname;
	private String rname;
	private String uname;
	private String tdate;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBaomingId() {
		return baomingId;
	}
	public void setBaomingId(Integer baomingId) {
		this.baomingId = baomingId;
	}
	public Integer getMingci() {
		return mingci;
	}
	public void setMingci(Integer mingci) {
		this.mingci = mingci;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getTdate() {
		return tdate;
	}
	public void setTdate(String tdate) {
		this.tdate = tdate;
	}
	
	
	
	
	
	
	
	
	
}
