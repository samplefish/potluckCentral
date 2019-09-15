package com.samplefish.dao;

import com.samplefish.entity.User;

public interface UserDao {
	User findByUserName(String userName);
	
	void save(User user);

}
