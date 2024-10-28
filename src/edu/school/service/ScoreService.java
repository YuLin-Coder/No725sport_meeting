package edu.school.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.school.dao.BannerDao;
import edu.school.dao.BaomingDao;
import edu.school.dao.ProductDao;
import edu.school.dao.ScoreDao;
import edu.school.dao.SportDao;
import edu.school.model.Banner;
import edu.school.model.Baoming;
import edu.school.model.Product;
import edu.school.model.Score;
import edu.school.model.Sport;
@Service
public class ScoreService implements ScoreDao {
	@Autowired
	ScoreDao dao;

	@Override
	public List<Score> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public Score findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public boolean add(Score record) {
		// TODO Auto-generated method stub
		return dao.add(record);
	}

	@Override
	public boolean update(Score record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public List<Score> findByProductMap(Map<String, Object> paramterMap) {
		// TODO Auto-generated method stub
		return dao.findByProductMap(paramterMap);
	}

	public List<Score> findByScore(Integer id) {
		// TODO 自动生成的方法存根
		return dao.findByScore(id);
	}

	





	

}
