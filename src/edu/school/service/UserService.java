package edu.school.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.school.dao.UserDao;
import edu.school.model.User;
@Service
public class UserService implements UserDao {
	@Autowired
	UserDao dao;

	@Override
	public List<User> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}

	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public boolean insert(User record) {
		// TODO Auto-generated method stub
		return dao.insert(record);
	}

	@Override
	public boolean update(User record) {
		// TODO Auto-generated method stub
		return dao.update(record);
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}


	@Override
	public  User findByPhoneAndPwd(String phone, String pwd) {
		// TODO Auto-generated method stub
		return dao.findByPhoneAndPwd(phone, pwd);
	}

	@Override
	public List<User> findByUserMap(Map<String, Object> paramterMap) {
		// TODO Auto-generated method stub
		return dao.findByUserMap(paramterMap);
	}


	public User findByPwdAndNo(String stuno, String pwd) {
		// TODO 自动生成的方法存根
		return dao.findByPwdAndNo(stuno,pwd);
	}

	public List<User> findByNo(String stuno) {
		// TODO 自动生成的方法存根
		return dao.findByNo(stuno);
	}
	
}
