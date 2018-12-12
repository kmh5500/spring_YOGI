package spring.model.hotel;

import spring.model.yogiinter.DAOSTDInter;

public interface IHotelDAO extends DAOSTDInter {
	public boolean starupdate(int hnum)throws Exception;
}
