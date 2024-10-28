package edu.school.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.school.model.Category;



public interface CategoryDao {
	List<Category> findAll();//查询所有
	Category findById(int id );//
	boolean add(Category record);//插入
	boolean update(@Param("record") Category record);//根据id更改
	boolean delete(int id);//根据id删除
	List<Category> findByCategoryMap(Map<String, Object> paramterMap);//根据条件进行查询
	

}
