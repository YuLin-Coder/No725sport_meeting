package edu.school.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.school.model.Admin;
import edu.school.model.Banner;
import edu.school.model.Baoming;
import edu.school.model.Product;
import edu.school.model.Referee;
import edu.school.model.Sport;



public interface BaomingDao {
	
	List<Baoming> findAll();//查询所有
	Baoming findById(int id );//
	boolean add(Baoming record);//插入
	boolean update(@Param("record") Baoming record);//根据id更改
	boolean delete(int id);//根据id删除
	List<Baoming> findByProductMap(Map<String, Object> paramterMap);//根据条件进行查询
	List<Baoming> findBySportId(Integer sportId);
	List<Baoming> findBySportIdAndUid(@Param("id") Integer id, @Param("uid") Integer uid);
	List<Baoming> findMyAll(Integer id);
	




}
