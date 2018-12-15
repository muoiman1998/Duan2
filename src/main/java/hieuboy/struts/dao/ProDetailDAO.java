package hieuboy.struts.dao;

import java.util.List;

import hieuboy.struts.entities.ProDetail;

public interface ProDetailDAO {

	List<ProDetail> findAll();

	ProDetail findOne(int id);

	boolean insert(ProDetail proDetail);

	boolean update(ProDetail proDetail);

	boolean delete(int id);
}
