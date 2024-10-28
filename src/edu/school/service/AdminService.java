package edu.school.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.school.dao.AdminDao;
import edu.school.model.Admin;
@Service
public class AdminService implements AdminDao {
	@Autowired
	AdminDao dao;

	@Override
	public Admin findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	
	@Override
	public Admin findByUserNameAndPwd(String username, String pwd) {
		// TODO Auto-generated method stub
		return dao.findByUserNameAndPwd(username, pwd);
	}

	@Override
	public boolean update(Admin record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}



}
