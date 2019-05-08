package orders;

public class ordersMgr {

	
	private DB.DBConnectionMgr pool;
	
	public ordersMgr() {
		pool = DB.DBConnectionMgr.getInstance();
	}
	
	
}
