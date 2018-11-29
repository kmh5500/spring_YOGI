package spring.model.member;

import spring.model.yogiinter.DAOSTDInter;

public interface IMemberDAO extends DAOSTDInter {
	
	boolean IdCheck(String id);
}
