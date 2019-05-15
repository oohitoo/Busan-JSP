<%@ page import="shoplogin.loginMgr"%>
<%@ page import="shoplogin.loginBean"%>
<%@ page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="mgr" class="shoplogin.loginMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String business = request.getParameter("businessid");
	String beanBusinessId, beanBusinessname, beanPhone, beanAddress, beanCategory;
	Vector<loginBean> vshopInfo =mgr.shopInfo(business);
	for(int i = 0; i < vshopInfo.size(); ++i){
		loginBean bean = vshopInfo.get(i);
		beanBusinessId = bean.getBusinessid();
		beanBusinessname = bean.getName();
		beanPhone = bean.getPhone();
		beanAddress = bean.getAddress();
		beanCategory = bean.getCategory();
				
		if(beanBusinessId.equals(business)){
			%>
				<script>
					<% session.setAttribute("name", beanBusinessname);%>
					<% session.setAttribute("businessId", beanBusinessId);%>
					<% session.setAttribute("phone", beanPhone);%>
					<% session.setAttribute("address", beanAddress);%>
					<% session.setAttribute("category", beanCategory);%>
					location.href= 'shopMain.jsp';
				</script>
			<%
			break;
		}else{
			%>
				<script>
					alert("로그인 실패");
				</script>
			<%
		}break;
	}
%>