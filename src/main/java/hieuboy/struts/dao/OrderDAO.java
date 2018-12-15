package hieuboy.struts.dao;

import java.util.List;

import hieuboy.struts.entities.Order;

public interface OrderDAO {

	List<Order> findAll();

	Order findOne(int id);

	boolean insert(Order order);

	boolean update(Order order);

	boolean delete(int id);
}
