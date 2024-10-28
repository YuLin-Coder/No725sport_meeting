package edu.school.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.school.model.Admin;
import edu.school.model.Banner;
import edu.school.model.Baoming;
import edu.school.model.Product;
import edu.school.model.Referee;
import edu.school.model.Score;
import edu.school.model.Sport;



public interface ScoreDao {
	
	List<Score> findAll();//查询所有
	Score findById(int id );//
	boolean add(Score record);//插入
	boolean update(@Param("record") Score record);//根据id更改
	boolean delete(int id);//根据id删除
	List<Score> findByProductMap(Map<String, Object> paramterMap);//根据条件进行查询
	List<Score> findByScore(Integer id);
	




}
