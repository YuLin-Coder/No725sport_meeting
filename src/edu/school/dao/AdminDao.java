package edu.school.dao;

import org.apache.ibatis.annotations.Param;

import edu.school.model.Admin;



public interface AdminDao {
	
	Admin findById(int id );//根据主键id查询记录	
	Admin findByUserNameAndPwd(@Param("username") String username,@Param("pwd")String pwd );//查询用户名和密码
	boolean update(@Param("record") Admin record);//根据id更改
	




}
