<%-- <%@page import="com.sun.jdi.Location"%> --%>
<%@ page contentType="text/html; charset=EUC-KR" %>
<% 	request.setCharacterEncoding("EUC-KR");%>
<script>
function desktopalert() {
    var message = "�ֹ� ����";
        var options = {
            body: message
        }
        //����ũž �˸� ��û
        var notification = new Notification("���ο� �ֹ��� �����ߴ� �װ�", options);
        //�˸� �� 5�� ��,
        setTimeout(function () {
            //��� �޽��� �ݱ�
            notification.close();
        }, 5000);
    
};
</script>
<%
	if(session.getAttribute("oCnt1")==null){%>
		<script>
		/* alert("��ġ�� �ζٱ�"); */
		location.href="shopMain.jsp";
		</script>
		
	<%}else{
			int oCnt1 = (int)session.getAttribute("oCnt1");
			if(session.getAttribute("oCnt2")==null){
				session.setAttribute("oCnt2", oCnt1);
				%>
				<script>
				/* alert("�ֹ��� �Ѱǵ� ������...."); */
				location.href="shopMain.jsp";
				</script>
			<%}else{
					int oCnt2 = (int)session.getAttribute("oCnt2");
					if(oCnt2!=0){
							if(oCnt1==oCnt2){%>
								<script>
								/* alert("�ֹ��� �������� ����"); */
								location.href="shopMain.jsp";
								</script>
								
							<%}else{
								session.setAttribute("oCnt2", oCnt1);
							%>
								<script>
								/* alert("�ֹ��� ����"); */
								desktopalert();
								location.href="shopMain.jsp";
								</script>
							<%}
					}else{%>
							<script>
								/* alert("���ѷ�Ʈ"); */
								location.href="shopMain.jsp";
							</script>
					<%}
			}
	}
%>
