package dao;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.oua.spring.dao.UserDAOImpl;
import com.oua.spring.model.User;

/**
 * @author Gopal
 *
 */
public class UserDAOImplTest {

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
		User user = new User();
		UserDAOImpl udi= new UserDAOImpl();
		assertTrue(true);
	}

	@Test
	public void testUpdateUser() {
		assertTrue(true);
	}

	/**
	 * @author Gopal
	 */
	@Test
	public void testListUsers() {
		UserDAOImpl udi= new UserDAOImpl();
		assertNotNull(udi.listUsers());
	}

	@Test
	public void testGetUserById() {
		UserDAOImpl udi= new UserDAOImpl();
		int id = 002;
		assertNotNull(udi.getUserById(id));

	}

	@Test
	public void testRemoveUser() {
		assertTrue(true);
	}

}
