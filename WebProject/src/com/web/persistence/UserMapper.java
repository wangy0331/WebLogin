package com.web.persistence;

import java.util.List;

import com.web.bean.User;
import com.web.bean.UserExample;

public interface UserMapper {

	/**
	 * 根据用户名查找
	 * @param name
	 * @return
	 */
	User getUserById(String name);

	/**
	 * 创建厂家
	 * @param user
	 * @return
	 */
	int insertUser(User user);

	List<User> userFindAll(UserExample userExample);

	int updateById(User user);

}
