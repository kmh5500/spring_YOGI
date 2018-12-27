package spring.model.room;

import java.util.List;
import java.util.Map;

import spring.model.yogiinter.DAOSTDInter;

public interface IRoomDAO extends DAOSTDInter {
	public List rlist(Map map)throws Exception;
	public int rtotal(Map map)throws Exception;
	public RoomDTO read(Map map)throws Exception;
}
