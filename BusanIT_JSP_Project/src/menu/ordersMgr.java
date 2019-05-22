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
	public void insertOrder(ordersBean order, String orderNumber, String addres, String shop, String numbers, String req, String orderType) {	
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
				pstmt.setString(7, order.getMenu()); //�޴� [7]
				pstmt.setInt(8, order.getCount()); // ���� [8]
				// ���� �ð� now() [9]
				pstmt.setString(9, req); //��û���� [10]
				pstmt.setString(10, orderType); //���� ��� [11]
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

	//������ ���� �������̺� ������ �߰�
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

	//�ֹ���ȣ ��������
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

	//�ֹ� ������ �������� (������ ������ �ֹ���ȣ��..)
	public Vector<ordersBean> orderList(String id/*, int start, int end*/){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		/*System.out.println(start);
		System.out.println(end);*/
		Vector<ordersBean> vlist = new Vector<ordersBean>();
		try {

			con = pool.getConnection();
			sql = "select o.*, m.mPrice, (m.mPrice * o.count) totalPrice  "
					+ "from menu m, orders o "
					+ "where m.rName = o.rName and id=? and o.menu = m.menu order by odate desc, mPrice desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			/*				pstmt.setInt(2, start);
				pstmt.setInt(3, end);*/

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

	//�ֹ� List ���� �̸��� ���� �ҷ�����(Main Page)
	public Vector<ordersBean> orderListMain(String ShopName){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql;

		Vector<ordersBean> olist = new Vector<>();

		try {
			conn = pool.getConnection();
			sql = "select * from orders where rName=? AND (orderStatus=1 or orderStatus=2 or orderStatus=3 or orderStatus=5) order by oDate";
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

	//�ֹ� List ���� �̸��� ���� �ҷ�����(shopPaidList Page)
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

	//�ֹ� List ���� �̸��� ���� �ҷ�����(shopDeliveredList Page)
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

	//�ֹ� List ���� �̸��� ���� �ҷ�����(shopReservationList Page)
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

	//�ֹ� List ���� �̸��� ���� �ҷ�����(shopServedList Page)
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

	//�ֹ� ���� update
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

}
