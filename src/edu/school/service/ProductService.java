package edu.school.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.school.dao.ProductDao;
import edu.school.model.Product;
@Service
public class ProductService implements ProductDao {
	@Autowired
	ProductDao dao;

	@Override
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public Product findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public boolean add(Product record) {
		// TODO Auto-generated method stub
		return dao.add(record);
	}

	@Override
	public boolean update(Product record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public List<Product> findByProductMap(Map<String, Object> paramterMap) {
		// TODO Auto-generated method stub
		return dao.findByProductMap(paramterMap);
	}





	

}
