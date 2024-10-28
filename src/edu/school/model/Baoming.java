package edu.school.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFilter;
import com.fasterxml.jackson.annotation.JsonFormat;

//管理员表
public class Baoming  {
	private Integer id;	
	private Integer uid;
	private Integer sportId;
	private Integer status;	
	private String createTime;
	private String cname;
	private String sname;
	private Integer note;
	private Integer mingci;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getSportId() {
		return sportId;
	}
	public void setSportId(Integer sportId) {
		this.sportId = sportId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getNote() {
		return note;
	}
	public void setNote(Integer note) {
		this.note = note;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public Integer getMingci() {
		return mingci;
	}
	public void setMingci(Integer mingci) {
		this.mingci = mingci;
	}
	
	
	
	
	
	
	
	
	
}
