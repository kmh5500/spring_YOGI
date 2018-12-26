package spring.model.review;



import spring.model.yogiinter.DAOSTDInter;

public interface IReviewDAO extends DAOSTDInter {
	public int total(int hnum)throws Exception;
}
