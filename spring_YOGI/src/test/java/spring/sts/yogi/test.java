package spring.sts.yogi;

public class test {
	
	public static void main(String args[]) {

		int rprice = 250000;
		double rrate = 0.15;
		double bcnt = 0.02;
		
		int bprice = (int)Math.round(rprice * (1-rrate) * (1-bcnt));
		
		System.out.println(bprice);
	}

}
