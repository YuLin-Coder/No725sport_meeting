package edu.school.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.school.dao.CategoryDao;
import edu.school.model.Category;
@Service
public class CategoryService implements CategoryDao {
	@Autowired
	CategoryDao dao;

	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public Category findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public boolean add(Category record) {
		// TODO Auto-generated method stub
		return dao.add(record);
	}

	@Override
	public boolean update(Category record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public List<Category> findByCategoryMap(Map<String, Object> paramterMap) {
		// TODO Auto-generated method stub
		return dao.findByCategoryMap(paramterMap);
	}

}
