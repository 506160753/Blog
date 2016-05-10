package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.entity.User;

public interface UserService {
	
	/**
	 * ��ҳ��ѯ�û�
	 * @return
	 */
	public List<User> list(Map<String,Object> map);
	
	/**
	 * ��ȡ�ܼ�¼��
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * ͨ��Id����ʵ��
	 * @param id
	 * @return
	 */
	public User findById(Integer id);
	
	/**
	 * �����û����������ѯ
	 * @param userName
	 * @param password
	 * @return
	 */
	public User findByUser(Map<String, Object> map);
	/**
	 * �����û���Ϣ
	 * @param blog
	 * @return
	 */
	public Integer update(User user); 
	
	/**
	 * ����û���Ϣ
	 * @param blog
	 * @return
	 */
	public Integer add(User user);
	
	/**
	 * ɾ���û���Ϣ
	 * @param id
	 * @return
	 */
	public Integer delete(Integer id);
	
}
