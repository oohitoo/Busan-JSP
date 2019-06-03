package menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

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
	public void insertOrder(ordersBean order, String orderNumber, String addres, String shop, String numbers, String req, String orderType) {	
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
				pstmt.setString(7, order.getMenu()); //메뉴 [7]
				pstmt.setInt(8, order.getCount()); // 수량 [8]
				// 현재 시간 now() [9]
				pstmt.setString(9, req); //요청사항 [10]
				pstmt.setString(10, orderType); //결재 방식 [11]
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

	//예약할 내용 예약테이블에 데이터 추가
	public boolean insertreserve(ordersBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		Date d = new Date();
		try {
			con = pool.getConnection();
			sql = "insert into orders(oNum, id, cNick, rName, cPhone, count, oDate, oRequest, orderType,orderStatus) values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, SDF_DATE.format(d)+"-"+bean.getoNum());
			pstmt.setString(2, bean.getId());
			pstmt.setString(3, bean.getcNick());
			pstmt.setString(4, bean.getrName());
			pstmt.setString(5, bean.getcPhone());
			pstmt.setInt(6, bean.getCount());
			pstmt.setString(7, bean.getoDate());
			pstmt.setString(8, bean.getoRequest());
			pstmt.setString(9, bean.getOrderType());
			pstmt.setString(10, bean.getOrderStatus());
			if(pstmt.executeUpdate()==1)
				flag = true;			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	//주문번호 가져오기
	public Vector<ordersBean> getorders(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ordersBean> vlist = new Vector<ordersBean>();

		try {
			con = pool.getConnection();
			sql = "select oNum from orders where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ordersBean bean = new ordersBean();
				bean.setoNum(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	//주문 내역들 가져오기 (위에서 가져온 주문번호로..)
		public Vector<ordersBean> orderList(String id, int end){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<ordersBean> vlist = new Vector<ordersBean>();
			try {
				con = pool.getConnection();
				sql = "select o.*, m.mPrice, (m.mPrice * o.count) totalPrice  "
						+ "from menu m, orders o "
						+ "where m.rName = o.rName and id=? and o.menu = m.menu order by odate desc, mPrice desc limit 0,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, end);

				rs = pstmt.executeQuery();
				while(rs.next()) {
					ordersBean pBean = new ordersBean();
					pBean.setoNum(rs.getString(1));
					pBean.setId(rs.getString(2));
					pBean.setcNick(rs.getString(3));
					pBean.setcAddress(rs.getString(4));
					pBean.setrName(rs.getString(5));
					pBean.setcPhone(rs.getString(6));
					pBean.setMenu(rs.getString(7));
					pBean.setCount(rs.getInt(8));
					pBean.setoDate(rs.getString(9));
					pBean.setoRequest(rs.getString(10));
					pBean.setOrderType(rs.getString(11));
					pBean.setOrderStatus(rs.getString(12));
					pBean.setmPrice(rs.getInt(13));
					pBean.setTotalPrice(rs.getInt(14));
					vlist.addElement(pBean);
				} //--while

			}//--try
			catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
	//주문 상세 정보
	public Vector<ordersBean> orderDetail(String id,String oDate){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ordersBean> vlist = new Vector<ordersBean>();
		try {

			con = pool.getConnection();
			sql = "select o.*, m.mPrice, m.mImg,(m.mPrice * o.count) totalPrice  "
					+ "from menu m, orders o "
					+ "where m.rName = o.rName and id=? and o.menu = m.menu and Odate=? order by mPrice desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, oDate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ordersBean pBean = new ordersBean();
				pBean.setoNum(rs.getString(1));
				pBean.setId(rs.getString(2));
				pBean.setcNick(rs.getString(3));
				pBean.setcAddress(rs.getString(4));
				pBean.setrName(rs.getString(5));
				pBean.setcPhone(rs.getString(6));
				pBean.setMenu(rs.getString(7));
				pBean.setCount(rs.getInt(8));
				pBean.setoDate(rs.getString(9));
				pBean.setoRequest(rs.getString(10));
				pBean.setOrderType(rs.getString(11));
				pBean.setOrderStatus(rs.getString(12));
				pBean.setmPrice(rs.getInt(13));
				pBean.setmImg(rs.getString(14));
				pBean.setTotalPrice(rs.getInt(15));
				vlist.addElement(pBean);
			} //--while

		}//--try
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	public boolean orderCancle(String id, String odate) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from orders where id =? and odate =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, odate);
			if(pstmt.executeUpdate()==1)
				flag = true;		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public Vector<ordersBean> orderListMain(String ShopName){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;

		Vector<ordersBean> olist = new Vector<>();

		try {
			conn = pool.getConnection();
			sql = "select o.*,m.mPrice, (m.mprice * o.count) subtotal from orders o,menu m where o.menu = m.menu and o.rName = ? AND orderstatus in (1,2,3,5) GROUP BY o.oNum order by oDate DESC;";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ShopName);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ordersBean oBean = new ordersBean();
				oBean.setoNum(rs.getString("oNum"));
				oBean.setCount(rs.getInt("count"));
				oBean.setId(rs.getString("id"));
				oBean.setcNick(rs.getString("cNick"));
				oBean.setcAddress(rs.getString("cAddress"));
				oBean.setrName(rs.getString("rName"));
				oBean.setcPhone(rs.getString("cPhone"));
				oBean.setMenu(rs.getString("menu"));
				oBean.setoDate(rs.getString("oDate"));
				oBean.setoRequest(rs.getString("oRequest"));
				oBean.setOrderType(rs.getString("orderType"));
				oBean.setOrderStatus(rs.getString("orderStatus"));
				oBean.setmPrice(rs.getInt("mPrice"));
				oBean.setTotalPrice(rs.getInt("subtotal"));
				olist.addElement(oBean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		return olist;
	}

	public Vector<ordersBean> orderListOrderDetail(String oNum){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;
		Vector<ordersBean> olist = new Vector<>();
		try {
			conn = pool.getConnection();
			sql = "select * from orders where oNum = ? GROUP BY orders.oNum";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, oNum);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ordersBean oBean = new ordersBean();
				oBean.setCount(rs.getInt("count"));
				oBean.setId(rs.getString("id"));
				oBean.setcNick(rs.getString("cNick"));
				oBean.setcAddress(rs.getString("cAddress"));
				oBean.setrName(rs.getString("rName"));
				oBean.setcPhone(rs.getString("cPhone"));
				oBean.setMenu(rs.getString("menu"));
				oBean.setoDate(rs.getString("oDate"));
				oBean.setoRequest(rs.getString("oRequest"));
				oBean.setOrderType(rs.getString("orderType"));
				oBean.setOrderStatus(rs.getString("orderStatus"));
				olist.addElement(oBean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		return olist;
	}
	
	//주문 List 가게 이름에 따라 불러오기(shopPaidList Page)
	public Vector<ordersBean> orderPaidList(String ShopName){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;

		Vector<ordersBean> olist = new Vector<>();

		try {
			conn = pool.getConnection();
			sql = "select * from orders where rName=? AND (orderStatus=1) order by oDate";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ShopName);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ordersBean oBean = new ordersBean();
				oBean.setoNum(rs.getString("oNum"));
				oBean.setCount(rs.getInt("count"));
				oBean.setId(rs.getString("id"));
				oBean.setcNick(rs.getString("cNick"));
				oBean.setcAddress(rs.getString("cAddress"));
				oBean.setrName(rs.getString("rName"));
				oBean.setcPhone(rs.getString("cPhone"));
				oBean.setMenu(rs.getString("menu"));
				oBean.setoDate(rs.getString("oDate"));
				oBean.setoRequest(rs.getString("oRequest"));
				oBean.setOrderType(rs.getString("orderType"));
				oBean.setOrderStatus(rs.getString("orderStatus"));
				olist.addElement(oBean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		return olist;
	}

	//주문 List 가게 이름에 따라 불러오기(shopDeliveredList Page)
	public Vector<ordersBean> orderDelieveredList(String ShopName){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;

		Vector<ordersBean> olist = new Vector<>();

		try {
			conn = pool.getConnection();
			sql = "select * from orders where rName=? AND (orderStatus=4) order by oDate";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ShopName);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ordersBean oBean = new ordersBean();
				oBean.setoNum(rs.getString("oNum"));
				oBean.setCount(rs.getInt("count"));
				oBean.setId(rs.getString("id"));
				oBean.setcNick(rs.getString("cNick"));
				oBean.setcAddress(rs.getString("cAddress"));
				oBean.setrName(rs.getString("rName"));
				oBean.setcPhone(rs.getString("cPhone"));
				oBean.setMenu(rs.getString("menu"));
				oBean.setoDate(rs.getString("oDate"));
				oBean.setoRequest(rs.getString("oRequest"));
				oBean.setOrderType(rs.getString("orderType"));
				oBean.setOrderStatus(rs.getString("orderStatus"));
				olist.addElement(oBean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		return olist;
	}

	//주문 List 가게 이름에 따라 불러오기(shopReservationList Page)
	public Vector<ordersBean> orderReservationList(String ShopName){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;

		Vector<ordersBean> olist = new Vector<>();

		try {
			conn = pool.getConnection();
			sql = "select * from orders where rName=? AND (orderStatus=5) order by oDate";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ShopName);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ordersBean oBean = new ordersBean();
				oBean.setoNum(rs.getString("oNum"));
				oBean.setCount(rs.getInt("count"));
				oBean.setId(rs.getString("id"));
				oBean.setcNick(rs.getString("cNick"));
				oBean.setcAddress(rs.getString("cAddress"));
				oBean.setrName(rs.getString("rName"));
				oBean.setcPhone(rs.getString("cPhone"));
				oBean.setMenu(rs.getString("menu"));
				oBean.setoDate(rs.getString("oDate"));
				oBean.setoRequest(rs.getString("oRequest"));
				oBean.setOrderType(rs.getString("orderType"));
				oBean.setOrderStatus(rs.getString("orderStatus"));
				olist.addElement(oBean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		return olist;
	}

	//주문 List 가게 이름에 따라 불러오기(shopServedList Page)
	public Vector<ordersBean> orderServedList(String ShopName){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;

		Vector<ordersBean> olist = new Vector<>();

		try {
			conn = pool.getConnection();
			sql = "select * from orders where rName=? AND (orderStatus=6) order by oDate";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ShopName);
			rs = psmt.executeQuery();
			while(rs.next()) {
				ordersBean oBean = new ordersBean();
				oBean.setoNum(rs.getString("oNum"));
				oBean.setCount(rs.getInt("count"));
				oBean.setId(rs.getString("id"));
				oBean.setcNick(rs.getString("cNick"));
				oBean.setcAddress(rs.getString("cAddress"));
				oBean.setrName(rs.getString("rName"));
				oBean.setcPhone(rs.getString("cPhone"));
				oBean.setMenu(rs.getString("menu"));
				oBean.setoDate(rs.getString("oDate"));
				oBean.setoRequest(rs.getString("oRequest"));
				oBean.setOrderType(rs.getString("orderType"));
				oBean.setOrderStatus(rs.getString("orderStatus"));
				olist.addElement(oBean);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, psmt, rs);
		}
		return olist;
	}

	//주문 상태 update
	public void updateOrder(String orderStatus, String oNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con=pool.getConnection();
			sql="update orders SET orderStatus=? where oNum=?";
			pstmt=con.prepareStatement(sql);		
			pstmt.setString(1, orderStatus);
			pstmt.setString(2, oNum);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt);
		}return;
	}

	//월 매출 조회
	public Vector<ordersBean> monthsales(String shopName, int month,int year){ 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ordersBean> olist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "select year(odate),month(odate) , ordertype,sum(totalprice) totalPrice from (select Menu , sum(count), orderType , (a.mPrice * sum(count)) totalPrice, a.oDate from ( select o.Menu ,sum(o.count) as count, m.mPrice,  o.orderType, o.oDate from orders o, menu m where o.menu = m.Menu and m.rName = o.rName and o.rName = ?  and month(odate) = ? and year(odate) =? GROUP by m.Menu,o.ordertype ) a group by menu,ordertype) b group by orderType ;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, shopName);
			pstmt.setInt(2, month);
			pstmt.setInt(3, year);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ordersBean oBean = new ordersBean();				
				oBean.setoYear(rs.getString(1));
				oBean.setoDate(rs.getString(2));
				oBean.setOrderType(rs.getString(3));
				oBean.setTotalPrice(rs.getInt(4));
				olist.addElement(oBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return olist;
	}

	//일매출 
	public Vector<ordersBean> daysales(String shopName, int day, int month,int year){ 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ordersBean> olist = new Vector<>();
		try {
			con = pool.getConnection();
			sql = "SELECT YEAR(odate), DAY(odate) DAY, ordertype, SUM(totalprice) FROM (SELECT odate, orderType, totalprice FROM	(SELECT o.menu,o.orderType, o.oDate, (m.mPrice * COUNT) totalprice FROM orders o, menu m	WHERE o.menu = m.Menu AND m.rName = o.rName AND o.rName = ? AND DAY(odate) = ? AND MONTH(odate) = ? and year(odate)=?) a GROUP BY odate, ordertype,menu ORDER BY odate) b GROUP BY ordertype, DAY";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, shopName);
			pstmt.setInt(2, day);
			pstmt.setInt(3, month);
			pstmt.setInt(4, year);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ordersBean oBean = new ordersBean();
				oBean.setoYear(rs.getString(1));
				oBean.setoDate(rs.getString(2));
				oBean.setOrderType(rs.getString(3));
				oBean.setTotalPrice(rs.getInt(4));
				olist.addElement(oBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return olist;
	}
	
	//예약 내역 가져오기
	public Vector<ordersBean> reserveList(String id, int end){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ordersBean> vlist = new Vector<ordersBean>();
		try {
			con = pool.getConnection();
			sql = "select * from orders where id = ? and ordertype='예약' order by odate limit 0,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				ordersBean pBean = new ordersBean();
				pBean.setId(rs.getString("Id"));
				pBean.setrName(rs.getString("rName"));
				pBean.setCount(rs.getInt("count"));
				pBean.setoDate(rs.getString("oDate"));
				vlist.addElement(pBean);
			} //--while

		}//--try
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	//예약 상세 정보
	public Vector<ordersBean> reserveDetail(String id,String oDate){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ordersBean> vlist = new Vector<ordersBean>();
		try {
			con = pool.getConnection();
			sql = "select * from orders where id = ? and ordertype= '예약' and odate=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, oDate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ordersBean pBean = new ordersBean();
				pBean.setoNum(rs.getString("oNum"));
				pBean.setId(rs.getString("Id"));
				pBean.setcNick(rs.getString("cNick"));
				pBean.setrName(rs.getString("rName"));
				pBean.setcPhone(rs.getString("cPhone"));
				pBean.setCount(rs.getInt("count"));
				pBean.setoDate(rs.getString("oDate"));
				pBean.setoRequest(rs.getString("oRequest"));
				pBean.setOrderType(rs.getString("orderType"));
				vlist.addElement(pBean);
			} //--while

		}//--try
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<ordersBean> menuList(String oNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ordersBean> vlist = new Vector<ordersBean>();
		try {
			con = pool.getConnection();
			sql = "select menu,count from orders where oNum=?  ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, oNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ordersBean mBean = new ordersBean();
				mBean.setMenu(rs.getString(1));
				mBean.setCount(rs.getInt(2));
				vlist.addElement(mBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
}