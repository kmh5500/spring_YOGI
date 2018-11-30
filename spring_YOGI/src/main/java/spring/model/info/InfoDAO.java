package spring.model.info;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class InfoDAO implements IInfoDAO {
	
	@Autowired
	private SqlSessionTemplate mysql;
	
	@Override
	public boolean create(Object dto) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		int cnt = mysql.insert("info.create", dto);
		if(cnt>0)flag= true;
		return flag;
	}

	@Override
	public List list(Map map) {
		// TODO Auto-generated method stub
		return mysql.selectList("info.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
		
		return mysql.selectOne("info.read", pk);
	}

	@Override
	public boolean update(Object dto) throws Exception {
		// TODO Auto-generated method stub
		boolean flag=false;
		int cnt = mysql.update("info.update", dto);
		if(cnt>0)flag= true;
		return flag;
		
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		// TODO Auto-generated method stub
		boolean flag= false;
		int cnt = mysql.delete("info.delete", pk);
		if(cnt>0)flag=true;
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return mysql.selectOne("info.total", map);
	}

	

	@Override
	public void upViewcnt(int num) {
		// TODO Auto-generated method stub
		mysql.update("info.viewcnt", num);
	}

}
