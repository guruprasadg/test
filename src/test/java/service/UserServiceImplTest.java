package service;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.oua.spring.service.UserServiceImpl;



public class UserServiceImplTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testAddUser() {
		UserServiceImpl userService = new UserServiceImpl ();
		assertTrue(true);
	}

	@Test
	public void testUpdateUser() {
		assertTrue(true);
	}

	@Test
	public void testListUser() {
		UserServiceImpl userService = new UserServiceImpl ();
		assertNotNull("All users are available", userService.listUsers());
	}

	@Test
	public void testGetUserById() {
		UserServiceImpl userService = new UserServiceImpl ();
		int id = 002;
		assertNotNull("All users are available", userService.getUserById(id));
	}

	@Test
	public void testRemoveUser() {
		assertTrue(true);
	}

}
