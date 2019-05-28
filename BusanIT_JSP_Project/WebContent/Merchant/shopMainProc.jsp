<%-- <%@page import="com.sun.jdi.Location"%> --%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<% 	request.setCharacterEncoding("EUC-KR");%>
<script>
function desktopalert() {
    var message = "주문 도착";
        var options = {
            body: message
        }
        //데스크탑 알림 요청
        var notification = new Notification("새로운 주문이 도착했다 닝겐", options);
        //알림 후 5초 뒤,
        setTimeout(function () {
            //얼람 메시지 닫기
            notification.close();
        }, 5000);
    
};
</script>
<%
	if(session.getAttribute("oCnt1")==null){%>
		<script>
		/* alert("빡치는 널뛰기"); */
		location.href="shopMain.jsp";
		</script>
		
	<%}else{
			int oCnt1 = (int)session.getAttribute("oCnt1");
			if(session.getAttribute("oCnt2")==null){
				session.setAttribute("oCnt2", oCnt1);
				%>
				<script>
				/* alert("주문이 한건도 없었다...."); */
				location.href="shopMain.jsp";
				</script>
			<%}else{
					int oCnt2 = (int)session.getAttribute("oCnt2");
					if(oCnt2!=0){
							if(oCnt1==oCnt2){%>
								<script>
								/* alert("주문이 증가하지 않음"); */
								location.href="shopMain.jsp";
								</script>
								
							<%}else{
								session.setAttribute("oCnt2", oCnt1);
							%>
								<script>
								/* alert("주문이 증가"); */
								desktopalert();
								location.href="shopMain.jsp";
								</script>
							<%}
					}else{%>
							<script>
								/* alert("망한루트"); */
								location.href="shopMain.jsp";
							</script>
					<%}
			}
	}
%>
