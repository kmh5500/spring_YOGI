package spring.model.alliance;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class AllianceDAO implements IAllianceDAO {

	@Autowired
	private SqlSessionTemplate mysql;
	
	
	
	public void setMysql(SqlSessionTemplate mysql) {
		this.mysql = mysql;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int cnt = mysql.insert("alliance.create", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		return mysql.selectList("alliance.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		return mysql.selectOne("alliance.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		
		int cnt = mysql.update("alliance.update", dto);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		
		int cnt = mysql.delete("alliance.delete", pk);
		if(cnt>0)flag=true;
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		
		return mysql.selectOne("alliance.total", map);
	}

}
