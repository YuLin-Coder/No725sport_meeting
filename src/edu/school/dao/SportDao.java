package edu.school.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.school.model.Referee;
import edu.school.model.Sport;



public interface SportDao {
	
	List<Sport> findAll();//查询所有
	List<Sport> findMySport(Integer referee_id);//查询我的项目
	Sport findById(int id );//
	boolean add(Sport record);//插入
	boolean update(@Param("record") Sport record);//根据id更改
	boolean delete(int id);//根据id删除
	List<Sport> findByProductMap(Map<String, Object> paramterMap);//根据条件进行查询
	List<Sport> findMyAll(Integer id);
	




}
