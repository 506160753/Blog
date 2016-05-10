package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.dao.UserDao;
import com.blog.entity.User;
import com.blog.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;
	
	public List<User> list(Map<String, Object> map) {
		return userDao.list(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return userDao.getTotal(map);
	}

	public User findById(Integer id) {
		return userDao.findById(id);
	}

	public Integer update(User user) {
		return userDao.update(user);
	}

	public Integer add(User user) {
		return userDao.add(user);
	}

	public Integer delete(Integer id) {
		return userDao.delete(id);
	}

	public User findByUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userDao.findByUser(map);
	}


}
