package edu.school.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.school.dao.BannerDao;
import edu.school.dao.CommentDao;
import edu.school.dao.ProductDao;
import edu.school.dao.SportDao;
import edu.school.model.Banner;
import edu.school.model.Comment;
import edu.school.model.Product;
import edu.school.model.Sport;
@Service
public class CommentService implements CommentDao {
	@Autowired
	CommentDao dao;

	@Override
	public List<Comment> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public Comment findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public boolean add(Comment record) {
		// TODO Auto-generated method stub
		return dao.add(record);
	}

	@Override
	public boolean update(Comment record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public List<Comment> findByProductMap(Map<String, Object> paramterMap) {
		// TODO Auto-generated method stub
		return dao.findByProductMap(paramterMap);
	}

	public List<Comment> findByNewsId(Integer id) {
		// TODO 自动生成的方法存根
		return dao.findByNewsId(id);
	}

	public List<Comment> findMyAll(Integer id) {
		// TODO 自动生成的方法存根
		return dao.findMyAll(id);
	}





	

}
