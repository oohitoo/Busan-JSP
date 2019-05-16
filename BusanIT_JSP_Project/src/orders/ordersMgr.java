package orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import login.LoginBean;
import login.LoginMgr;
import menu.ordersBean;
import shoplogin.loginBean;

public class ordersMgr {	
	
	private DB.DBConnectionMgr pool;
	// ��¥���� MM(��) , mm(��) ����Ű�°��� �����Ұ� 
	private final SimpleDateFormat SDF_DATE = new SimpleDateFormat("yyyyMMdd");
	
	public ordersMgr() {
		pool = DB.DBConnectionMgr.getInstance();
	}
	
	public LoginBean getCustomer(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		LoginBean bean = new LoginBean();
		
		try {
			con = pool.getConnection();
			//
			sql = "select * from customer where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setcNick(rs.getString("cNick"));
				bean.setcPhone(rs.getString("cPhone"));				
				bean.setcPost(rs.getString("cPost"));
				bean.setcAddress(rs.getString("cAddress"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	//�ֹ����� ����
	public void insertOrder(ordersBean order, String orderNumber, String addres, String shop, String numbers, String req, String payType) {	
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		Date d = new Date(); // ���� ��¥ ����
		
		/* �̷������� �θ��� �ɰ� ����.
		 MemberBean bean = getMember(id);
		 * */
		
		try {
			con = pool.getConnection();
			
			if(order.getId() != null) {
				LoginBean loginbean = getCustomer(order.getId()); // ���� ��ȸ�ϱ� (loginBean�� setting)
				sql = "insert into orders values(?,?,?,?,?,?,?,?,now(),?,?,?)";
		
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, SDF_DATE.format(d)+"-"+orderNumber); //�ֹ���ȣ
				pstmt.setString(2, order.getId()); // ���̵� [2]
				pstmt.setString(3, loginbean.getcNick()); // �г���[3]
				pstmt.setString(4, addres); // �ּ� [4]
				pstmt.setString(5, shop); // ���� �� [5]
				pstmt.setString(6, numbers); // ��ȭ��ȣ [6]				
				pstmt.setString(7, order.getmName()); //�޴� [7]
				pstmt.setInt(8, order.getCount()); // ���� [8]
										// ���� �ð� now() [9]
				pstmt.setString(9, req); //��û���� [10]
				pstmt.setString(10, payType); //���� ��� [11]
				pstmt.setInt(11, 1); //�� ��Ȳ [12]
				
				pstmt.executeUpdate();
				
			}
			else {
				System.out.println(order.getId());
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
