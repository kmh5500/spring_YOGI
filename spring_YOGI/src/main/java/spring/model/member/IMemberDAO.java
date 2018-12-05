package spring.model.member;

import java.util.Map;

import spring.model.yogiinter.DAOSTDInter;

public interface IMemberDAO extends DAOSTDInter {
	
	boolean updatePass(Map map);
	int passCheck(Map map);
	int idCheck(String id);
	int emailCheck(String email);
	int loginCheck(Map map);
	void bdrDelete(String id);
	void brDelete(String id);
	void cDelete(String id);
	void baDelete(String id);
	String getGrade(String id);
	
}
