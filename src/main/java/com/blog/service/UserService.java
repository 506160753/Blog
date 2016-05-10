package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.entity.User;

public interface UserService {
	
	/**
	 * 分页查询用户
	 * @return
	 */
	public List<User> list(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 通过Id查找实体
	 * @param id
	 * @return
	 */
	public User findById(Integer id);
	
	/**
	 * 根据用户名和密码查询
	 * @param userName
	 * @param password
	 * @return
	 */
	public User findByUser(Map<String, Object> map);
	/**
	 * 更新用户信息
	 * @param blog
	 * @return
	 */
	public Integer update(User user); 
	
	/**
	 * 添加用户信息
	 * @param blog
	 * @return
	 */
	public Integer add(User user);
	
	/**
	 * 删除用户信息
	 * @param id
	 * @return
	 */
	public Integer delete(Integer id);
	
}
