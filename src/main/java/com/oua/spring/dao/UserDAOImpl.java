package com.oua.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.oua.spring.model.User;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	public void addUser(User user) {
		Session session = this.sessionFactory.openSession();
		session.persist(user);
		
		logger.info("User saved successfully, User Details="+user);
	}

	public void updateUser(User user) {
		Session session = this.sessionFactory.openSession();
		session.update(user);
		
		System.out.println(user.toString());
		
		logger.info("User updated successfully, User Details="+user);
	}

	@SuppressWarnings("unchecked")
	public List<User> listUsers() {
		Session session = this.sessionFactory.openSession();
		List<User> usersList = session.createQuery("from User").list();
		for(User user : usersList){
			logger.info("User List::"+user);
		}
		
		return usersList;
	}

	public User getUserById(int id) {
		Session session = this.sessionFactory.openSession();		
		User user = (User) session.load(User.class, new Integer(id));
		
		logger.info("User loaded successfully, User details="+user);
		
		return user;
	}

	public void removeUser(int id) {
		Session session = this.sessionFactory.openSession();
		User user = (User) session.load(User.class, new Integer(id));
		if(null != user){
			session.delete(user);
		}
		
		logger.info("User deleted successfully, User details="+user);
	}

}
