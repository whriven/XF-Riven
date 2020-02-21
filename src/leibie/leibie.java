package leibie;

public class leibie {

	private int lid;
	private String name;
	private String beizhu;
	
	public leibie(int lid, String name, String beizhu) {
		super();
		this.lid = lid;
		this.name = name;
		this.beizhu = beizhu;
	}
	public leibie() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	@Override
	public String toString() {
		return "lid [lid=" + lid + ", name=" + name + ", beizhu=" + beizhu
				+ "]";
	}
	
}
