package com.oua.spring.service;

import java.util.List;

import com.oua.spring.model.User;

public interface UserService {

	public void addUser(User u);
	public void updateUser(User p);
	public List<User> listUsers();
	public User getUserById(int id);
	public void removeUser(int id);
	
}
