package hieuboy.struts.dao;

import java.util.List;

import hieuboy.struts.entities.User;

public interface UserDAO {


	List<User> findAll();

	User findOne(int id);

	boolean insert(User user);


	boolean update(User user);

	boolean delete(int id);
}
