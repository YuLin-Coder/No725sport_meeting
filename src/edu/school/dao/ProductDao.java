package edu.school.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.school.model.Product;


//商品dao，绑定sql语句
public interface ProductDao {
	List<Product> findAll();//查询所有
	Product findById(int id );//
	boolean add(Product record);//插入
	boolean update(@Param("record") Product record);//根据id更改
	boolean delete(int id);//根据id删除
	List<Product> findByProductMap(Map<String, Object> paramterMap);//根据条件进行查询
	

}
