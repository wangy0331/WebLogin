package com.web.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.bean.User;
import com.web.bean.UserExample;
import com.web.persistence.UserMapper;

@Repository
public class UserDAO {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 根据用户名查找
	 * @param name
	 * @return
	 */
	public User getUserByUserId(String name) {
		return userMapper.getUserById(name);
	}

	/**
	 * 验证用户名是否存在
	 * @param username
	 * @return
	 */
	public boolean isUserExist(String username) {
		return false;
	}

	public int insertUser(User user) {
		return userMapper.insertUser(user);
	}

	public List<User> listReply(UserExample userExample) {
		return userMapper.userFindAll(userExample);
	}

	public int updateReply(User user) {
		return userMapper.updateById(user);
	}

}
