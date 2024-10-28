package edu.school.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.school.model.Admin;
import edu.school.model.Banner;
import edu.school.model.Comment;
import edu.school.model.Product;
import edu.school.model.Referee;
import edu.school.model.Sport;



public interface CommentDao {
	
	List<Comment> findAll();//查询所有
	Comment findById(int id );//
	boolean add(Comment record);//插入
	boolean update(@Param("record") Comment record);//根据id更改
	boolean delete(int id);//根据id删除
	List<Comment> findByProductMap(Map<String, Object> paramterMap);//根据条件进行查询
	List<Comment> findByNewsId(Integer id);
	List<Comment> findMyAll(Integer id);//查看我的评论
	




}
