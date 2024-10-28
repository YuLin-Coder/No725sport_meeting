package edu.school.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.school.model.Admin;
import edu.school.model.Banner;
import edu.school.model.Product;
import edu.school.model.Referee;
import edu.school.model.Sport;



public interface BannerDao {
	
	List<Banner> findAll();//查询所有
	Banner findById(int id );//
	boolean add(Banner record);//插入
	boolean update(@Param("record") Banner record);//根据id更改
	boolean delete(int id);//根据id删除
	List<Banner> findByProductMap(Map<String, Object> paramterMap);//根据条件进行查询
	




}
