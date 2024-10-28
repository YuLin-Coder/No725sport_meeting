package edu.school.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.school.dao.AdminDao;
import edu.school.dao.RefereeDao;
import edu.school.model.Admin;
import edu.school.model.Referee;
@Service
public class RefereeService implements RefereeDao {
	@Autowired
	RefereeDao dao;

	@Override
	public Referee findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	
	@Override
	public Referee findByUserNameAndPwd(String username, String pwd) {
		// TODO Auto-generated method stub
		return dao.findByUserNameAndPwd(username, pwd);
	}

	@Override
	public boolean update(Referee record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}

	@Override
	public List<Referee> findAll() {
		// TODO 自动生成的方法存根
		return dao.findAll();
	}


	@Override
	public boolean add(Referee record) {
		// TODO Auto-generated method stub
		return dao.add(record);
	}


	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}


	@Override
	public List<Referee> findByRefereeMap(Map<String, Object> paramterMap) {
		// TODO Auto-generated method stub
		return dao.findByRefereeMap(paramterMap);
	}





}
