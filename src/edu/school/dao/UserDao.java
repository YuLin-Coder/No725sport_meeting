package edu.school.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.school.model.User;



public interface UserDao {
	List<User> selectAll();//查询所有
	
	User findById(int id );//根据主键id查询记录
	
	boolean insert( User record);//插入
	
	boolean update(@Param("record") User record);//根据id更改	

	boolean delete(int id);//根据id删除
	
	List<User> findByUserMap(Map<String, Object> paramterMap);//根据条件进行查询
	User findByPhoneAndPwd(String phone,String pwd);

	User findByPwdAndNo(@Param("stuno") String stuno,@Param("pwd")String pwd);

	List<User> findByNo(String stuno);


}
