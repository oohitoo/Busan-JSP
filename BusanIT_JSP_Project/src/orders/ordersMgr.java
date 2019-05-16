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
	// 날짜형식 MM(월) , mm(분) 가르키는거임 조심할것 
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
	
	//주문내역 저장
	public void insertOrder(ordersBean order, String orderNumber, String addres, String shop, String numbers, String req, String payType) {	
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		Date d = new Date(); // 오늘 날짜 생성
		
		/* 이런식으로 부르면 될것 같음.
		 MemberBean bean = getMember(id);
		 * */
		
		try {
			con = pool.getConnection();
			
			if(order.getId() != null) {
				LoginBean loginbean = getCustomer(order.getId()); // 가서 조회하기 (loginBean에 setting)
				sql = "insert into orders values(?,?,?,?,?,?,?,?,now(),?,?,?)";
		
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, SDF_DATE.format(d)+"-"+orderNumber); //주문번호
				pstmt.setString(2, order.getId()); // 아이디 [2]
				pstmt.setString(3, loginbean.getcNick()); // 닉네임[3]
				pstmt.setString(4, addres); // 주소 [4]
				pstmt.setString(5, shop); // 가게 명 [5]
				pstmt.setString(6, numbers); // 전화번호 [6]				
				pstmt.setString(7, order.getmName()); //메뉴 [7]
				pstmt.setInt(8, order.getCount()); // 수량 [8]
										// 현재 시간 now() [9]
				pstmt.setString(9, req); //요청사항 [10]
				pstmt.setString(10, payType); //결재 방식 [11]
				pstmt.setInt(11, 1); //현 상황 [12]
				
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
