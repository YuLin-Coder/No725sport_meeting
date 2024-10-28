package edu.school.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.school.dao.ProductDao;
import edu.school.dao.SportDao;
import edu.school.model.Product;
import edu.school.model.Referee;
import edu.school.model.Sport;
@Service
public class SportService implements SportDao {
	@Autowired
	SportDao dao;

	@Override
	public List<Sport> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public Sport findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public boolean add(Sport record) {
		// TODO Auto-generated method stub
		return dao.add(record);
	}

	@Override
	public boolean update(Sport record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public List<Sport> findByProductMap(Map<String, Object> paramterMap) {
		// TODO Auto-generated method stub
		return dao.findByProductMap(paramterMap);
	}

	public List<Sport> findMyAll(Integer id) {
		// TODO 自动生成的方法存根
		return dao.findMyAll(id);
	}

	@Override
	public List<Sport> findMySport(Integer referee_id) {
		// TODO Auto-generated method stub
		return dao.findMySport(referee_id);
	}





	

}
