package edu.school.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.school.model.Referee;



public interface RefereeDao {
	
	Referee findById(int id );//根据主键id查询记录	
	Referee findByUserNameAndPwd(@Param("phone") String phone,@Param("pwd")String pwd );//查询用户名和密码
	boolean update(@Param("referee") Referee referee);//根据id更改
	List<Referee> findAll();

	boolean add(Referee record);//插入
	boolean delete(int id);//根据id删除
	List<Referee> findByRefereeMap(Map<String, Object> paramterMap);//根据条件进行查询
	




}
