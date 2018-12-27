package spring.model.review;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.hotel.HotelDAO;


@Service
public class ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	@Autowired
	private HotelDAO hdao;
	
	public void create(ReviewDTO dto, int hnum) throws Exception {
		dao.create(dto);
		hdao.starupdate(hnum);
	}
	
	public void update(ReviewDTO dto, int hnum) throws Exception {
		dao.update(dto);
		hdao.starupdate(hnum);
	}
	
	public void delete(Object pk, int hnum) throws Exception {
		int revnum = (Integer)pk;
		dao.delete(revnum);
		hdao.starupdate(hnum);
	}
	
}
