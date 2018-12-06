package spring.model.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements IMemberDAO{
	
	@Autowired
	private SqlSessionTemplate mysql;
	
	@Override
	public boolean create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt  =  mysql.insert("member.create", dto);
		if(cnt > 0 ) { 
			flag = true;
		}
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mysql.selectList("member.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt  =  mysql.insert("member.update", dto);
		if(cnt > 0 ) { 
			flag = true;
		}
		return flag;
		
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt  =  mysql.insert("member.delete", pk);
		if(cnt > 0 ) { 
			flag = true;
		}
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.total", map);
	}


	@Override
	public boolean updatePass(Map map) {
		// TODO Auto-generated method stub
		boolean flag = false;
		int cnt  =  mysql.insert("member.updatePass", map);
		if(cnt > 0 ) { 
			flag = true;
		}
		return flag;
		
	}

	@Override
	public int passCheck(Map map) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.passCheck", map);
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.idCheck", id);
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.idCheck", email);
	}

	@Override
	public void bdrDelete(String id) {
		// TODO Auto-generated method stub
		mysql.delete("member.bdrdelete", id);
		
	}

	@Override
	public void brDelete(String id) {
		// TODO Auto-generated method stub
		mysql.delete("member.brdelete", id);
	}

	@Override
	public void cDelete(String id) {
		// TODO Auto-generated method stub
		mysql.delete("member.cdelete", id);
	}

	@Override
	public void baDelete(String id) {
		// TODO Auto-generated method stub
		mysql.delete("member.badelete", id);
		
	}

	@Override
	public int loginCheck(Map map) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.loginCheck", map);
	}

	@Override
	public String getGrade(String id) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.getGrade", id);
	}

	@Override
	public String findid(String email) {
		// TODO Auto-generated method stub
		return mysql.selectOne("member.findid", email);
	}

}
