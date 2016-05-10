package com.blog.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.blog.entity.User;
import com.blog.service.UserService;
import com.blog.util.MD5;
import com.blog.util.ResponseUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	
	/**
	 * 保存用户
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/save")
	public String save(User user,String newPassWord,HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject result = new JSONObject();
		int isok = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		if(user.getId() == null){
			//用户注册
			map.put("userName", user.getUserName());
			User u = userService.findByUser(map);
			if(u != null){
				result.put("success", false);
				result.put("errorInfo", "该账号已注册,请重试");
				ResponseUtil.write(response, result);
				return null;
			}
			user.setPassword(MD5.GetMD5Code(String.format("%s:TWServer:%s", user.getUserName(),user.getPassword())));
			isok = userService.add(user);
		}else{
			//用户修改明码或昵称
			if(newPassWord != null){
				map.put("userName", user.getUserName());
				map.put("password", MD5.GetMD5Code(String.format("%s:TWServer:%s", user.getUserName(),user.getPassword())));
				user = userService.findByUser(map);
				if(user == null ){
					result.put("success", false);
					result.put("errorInfo", "原密码错误,请重试");
					ResponseUtil.write(response, result);
					return null;
				}
				user.setPassword(MD5.GetMD5Code(String.format("%s:TWServer:%s", user.getUserName(),newPassWord)));
			}
			isok = userService.update(user);
		}
		if(isok > 0){
			result.put("success", true);
			request.getSession().setAttribute("user", user);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	/**
	 * 用户登录
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/login")
	public String login(String userName,String password,HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject result = new JSONObject();
		//判断登录用户 密码加密
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("password", MD5.GetMD5Code(String.format("%s:TWServer:%s", userName,password)));
		User user = userService.findByUser(map);
		if(user == null){
			result.put("success", false);
			result.put("errorInfo", "用户名或密码错误!");
		}else{
			result.put("success", true);
			request.getSession().setAttribute("user", user);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/loginOut")
	public String loginOut(HttpServletResponse response,HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return null;
	}
}
