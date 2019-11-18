package com.ssh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.dao.UserActions;
import com.ssh.entity.User;

@Service
public class LRService {
	@Autowired
	private UserActions userActions;

	public User login(User user) {
		return userActions.login(user);
	}

	public boolean register(User user) {
		if (user.getUsername().equals("admin"))
			user.set_type("Admin");
		else
			user.set_type("User");
		return userActions.register(user);
	}

	public User getUserByName(String name) {
		return userActions.getUserByName(name);

	}
}
