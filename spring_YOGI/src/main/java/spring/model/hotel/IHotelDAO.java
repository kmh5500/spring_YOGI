package spring.model.hotel;

import spring.model.yogiinter.DAOSTDInter;

public interface IHotelDAO extends DAOSTDInter {
	public boolean starupdate(int hnum)throws Exception;
	public boolean duplicateHname(String hname)throws Exception;
	public boolean duplicateHemail(String hemail)throws Exception;
	public int checkHnum(String hid)throws Exception;
	
	
}
