package edu.school.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.school.dao.BannerDao;
import edu.school.dao.ProductDao;
import edu.school.dao.SportDao;
import edu.school.model.Banner;
import edu.school.model.Product;
import edu.school.model.Sport;
@Service
public class BannerService implements BannerDao {
	@Autowired
	BannerDao dao;

	@Override
	public List<Banner> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public Banner findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public boolean add(Banner record) {
		// TODO Auto-generated method stub
		return dao.add(record);
	}

	@Override
	public boolean update(Banner record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public List<Banner> findByProductMap(Map<String, Object> paramterMap) {
		// TODO Auto-generated method stub
		return dao.findByProductMap(paramterMap);
	}





	

}
