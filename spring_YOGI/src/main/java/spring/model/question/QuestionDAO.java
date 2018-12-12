package spring.model.question;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAO implements IQuestionDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public void setSst(SqlSessionTemplate sst) {
		this.sst = sst;
	}

	@Override
	public boolean create(Object dto) throws Exception {
		boolean flag = false;
		
		if(sst.insert("question.create", (QuestionDTO)dto) > 0) {
			flag = true;
		}		
		
		return flag;
	}

	@Override
	public Object read(Object pk) throws Exception {
		
		int qNum = (Integer)pk;
		
		return sst.selectOne("question.read", qNum);
		
	}

	@Override
	public List<QuestionDTO> list(Map map) throws Exception {
		
		 return sst.selectList("question.list", map);
		 
	}

	@Override
	public boolean update(Object dto) throws Exception {
		boolean flag = false;
		
		if(sst.update("question.update", (QuestionDTO)dto) > 0) {
			flag = true;
		}
		
		return flag;	
	}

	@Override
	public boolean delete(Object pk) throws Exception {
		boolean flag = false;
		
		int qNum = (Integer)pk; 
				
		if(sst.delete("question.delete", qNum) > 0) {
			flag = true;
		}
		
		return flag;
	}

	@Override
	public int total(Map map) throws Exception {

		return sst.selectOne("question.total", map);
		
	}
	
	@Override
	public boolean checkPasswd(Map map) throws Exception {
		boolean flag = false;
		
		int cnt = sst.selectOne("question.checkPasswd", map);
		
		if(cnt > 0) {
			flag = true;
		}
		
		return flag;
	}

}
