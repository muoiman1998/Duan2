package hieuboy.struts.dao;

import java.util.List;

import hieuboy.struts.entities.OrderDetail;

public interface OrderDetailDAO {

	List<OrderDetail> findAll();

	OrderDetail findOne(int id);

	boolean insert(OrderDetail orderDetail);

	boolean update(OrderDetail orderDetail);

	boolean delete(int id);
}
