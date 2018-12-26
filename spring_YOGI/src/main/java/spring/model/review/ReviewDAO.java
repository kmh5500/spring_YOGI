package spring.model.review;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ReviewDAO implements IReviewDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		int cnt = session.insert("review.create", (ReviewDTO)dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	@Override
	public List list(Map map) throws Exception {
		
		return session.selectList("review.list", map);
	}

	@Override
	public Object read(Object pk) throws Exception {
		// TODO Auto-generated method stub
				return false;
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		
		int cnt = session.update("review.update", (ReviewDTO)dto);
		if(cnt>0) flag = true;
		
		return flag;
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		int revnum = (Integer)pk;
		int cnt = session.delete("review.delete", revnum);
		if(cnt>0)flag=true;
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int total(int hnum) throws Exception {
		return session.selectOne("review.total", hnum);
	}


}
