<%
	response.setHeader("Pragma", "no-cache");
	if (request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-store");
	}
%>
<%@page import="java.util.Vector"%>
<%@page import="menu.menuBean"%>
<%@page import="review.reviewMgr"%>
<%@page import="review.reviewBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<jsp:useBean id="mgr" class="review.reviewMgr" />
<jsp:useBean id="bean" class="review.reviewBean" />
<%
	request.setCharacterEncoding("EUC-KR");
	String shop = request.getParameter("store");
	session.setAttribute("shop", shop);
	//���ǰ� �޾ƿ���
	String best = (String) session.getAttribute("best");
	String drink = (String) session.getAttribute("drink");
	String side = (String) session.getAttribute("side");

	/* ����� */
	int totalRecord = 0; //�� �Խù� ��
	int numPerPage = 5; //�������� ���ڵ� �� 5,10,15,30
	int pagePerBlock = 15; //���� ������ ��
	int totalPage = 0; //�� ������ ��=(�ø�)�ѰԽù��� / �������� ���ڵ� ��		
	int totalBlock = 0; //�� �� ��=(�ø�) �� �������� / ���� �������� 
	int nowPage = 1; //���� ������
	int nowBlock = 1; //���� ��

	int num = 0;
	String id = null;
	String subject = null;
	String content = null;
	String regdate = null;

	//���������� ������ �Խù� ����
	if (request.getParameter("numPerPage") != null && !request.getParameter("numPerPage").equals("null")) {
		numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
	}

	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);

	/* �������� */
%>
<!-- �޴��� �����;��� -->
<jsp:useBean id="menuMgr" class="menu.menuMgr" />

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<%-- <!-- �����  -->
<link href="style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

BootStrap CDN
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> --%>

<!-- ���� ���� -->

<style>
.sectiondropdown {
	background-color: #fff9;
	margin-bottom: 0 !important;
	padding: 10px;
	outline: none;
	font-size: 16px;
	color: #333;
	font-weight: 600;
	border: 1px solid #ccc;
	margin-top: 5px;
	border-radius: 4px;
}

#accordion {
	margin-top: 30px;
	margin-bottom: 30px;
	width: 700px; /* bar ũ�� */
}

#accordion i {
	float: right;
	margin-right: 15px;
}

#accordion p {
	padding: 10px;
	margin: 0 !important;
}

#accordion div {
	background-color: #fff;
	margin-left: 50px;
}

h3 {
	margin-left: 50px;
}
</style>
<script type="text/javascript">
	jQuery(function() {
		jQuery("#accordion").accordion({
			header : "h3",
			collapsible : true,
			active : false,
			heightStyle : "content",
			autoHeight : false
		});
	});
	jQuery('.sectiondropdown').click(function() {
		jQuery("i", this).toggleClass("fa-caret-up fa-caret-down");
	});
	
	function cartView(rName,menu, info, price) {
		console.log(menu+ "/" + info+"/" + price);
		/* location.href = "privateShopProc.jsp?flag=insert"+"&menu="+menu; */
		location.href = "privateShopProc.jsp?rName="+rName+"&menu="+menu+"&info="+info+"&price="+price+"&count="+1+"&flag=insert";
	}

	
	/* ����� */
		function pageing(page){
			document.readFrm.nowPage.value=page;
			document.readFrm.submit();
		}

		function block(block){
			document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
			document.readFrm.submit();
			}
		function numPerFn(numPerPage){
			document.readFrm.numPerPage.value=numPerPage;
			document.readFrm.submit();
			
		}
		function reviewInsert(){
			document.insert.action="insertreview.jsp";
			document.insert.submit();
			
		}	
		function reviewDelete(number){
			location.href ="reviewDelete.jsp?rnum="+number;
			
		}
		function reviewRead(){
			document.read.action="reviewRead.jsp";
			document.read.submit();
			
		}
	
	/* ���� ���� */
</script>
<div class="container">
	<div class="row">
		<table style="width: 700px; margin-left: 50px; margin-top: 50px;">
			<tr>
				<!-- ���� �̸� ǥ���ϴ� �� -->
				<td colspan="3"><h5 style="color: balck"><%=shop%></h5></td>
			</tr>
			<tr>
				<td rowspan="3" width="100px" height="100px">�̹���</td>
				<td>�ּ� �ֹ��ݾ� 13,000 ��</td>
			</tr>
			<tr>
				<td>������� : ī��, ����</td>
			</tr>
			<tr>
				<td>��� ��� �ð� : 40��, ���� : 0��</td>
			</tr>
			<tr>
				<td colspan="3">����� �˸� �޼���</td>
			</tr>
			<!-- ��ǥ�޴� -->
			<%
				Vector<menuBean> bestmenu = menuMgr.getMenu(shop, best);
			%>
			<tr>
				<td colspan="3">
					<div id="accordion">
						<h3 class="sectiondropdown">
							��ǥ�޴�<i class="fa fa-caret-down" aria-hidden="true"></i>
						</h3>
						<!-- ��ǥ�޴� -->
						<div style="height: 100% !important;">
							<p>
							<table
								style="width: 600px; margin-left: 20px; margin-right: 30px;">
								<%
									for (int i = 0; i < bestmenu.size(); ++i) {
										menuBean bestbean = bestmenu.get(i);
										String mImg = bestbean.getmImg(); // �޴� �̹���
										String menu = bestbean.getMenu(); // �޴� �̸�
										String mInfo = bestbean.getmInfo(); // �޴� ����
										int mPrice = bestbean.getmPrice(); // �޴� ����
								%>
								<tr>
									<td><font color="black" size="4"> <a
											href="javascript:cartView('<%=shop %>','<%=menu%>','<%=mInfo%>','<%=mPrice%>')"><%=menu%></a>
									</font></td>
									<td rowspan="3" width="140px" height="130px" align="center">
										<%
											if (mImg == null) {
										%> <img src="../img/menuImg/ready.gif"
										alt="�̹��� �غ���" width="100px" height="100px"> <%
 	} else {
 %> <img
										src="../img/menuImg/<%=mImg%>" alt="�̹��� �غ���" width="100px"
										height="100px"> <%
 	}
 %>
									</td>
								</tr>
								<tr>
									<td><font color="#808080" size="3"><%=mInfo%></font></td>
								</tr>
								<tr>
									<td><font color="black" size="3"><li><%=mPrice%>
												��</li></font></td>
								</tr>
								<input type="hidden" id="menuName" value="<%=menu%>">
								<%
									}
								%>
							</table>
							</p>
						</div>
						<!-- ��ǥ�޴� ���� -->
						<%
							Vector<menuBean> drinkmenu = menuMgr.getMenu(shop, drink);
						%>
						<!-- ������ �޴� -->
						<h3 class="sectiondropdown">
							���� �޴�<i class="fa fa-caret-down" aria-hidden="true"></i>
						</h3>
						<div style="height: 100% !important;">
							<p>
							<table
								style="width: 600px; margin-left: 20px; margin-right: 30px;">
								<%
									for (int i = 0; i < drinkmenu.size(); ++i) {
										menuBean drinkbean = drinkmenu.get(i);
										String mImg = drinkbean.getmImg(); // �޴� �̹���
										String menu = drinkbean.getMenu(); // �޴� �̸�
										String mInfo = drinkbean.getmInfo(); // �޴� ����
										int mPrice = drinkbean.getmPrice(); // �޴� ����
								%>
								<tr>
									<td><font color="black" size="4"> <a
											href="javascript:cartView('<%=shop %>','<%=menu%>','<%=mInfo%>','<%=mPrice%>')"><%=menu%></a>
									</font></td>
									<td rowspan="3" width="140px" height="130px" align="center">
										<%
											if (mImg == null) {
										%> <img src="../img/menuImg/ready.gif"
										alt="�̹��� �غ���" width="100px" height="100px"> <%
 	} else {
 %> <img
										src="../img/menuImg/<%=mImg%>" alt="�̹��� �غ���" width="100px"
										height="100px"> <%
 	}
 %>
									</td>
								</tr>
								<tr>
									<td><font color="#808080" size="3"><%=mInfo%></font></td>
								</tr>
								<tr>
									<td><font color="black" size="3"><li><%=mPrice%>
												��</li></font></td>
								</tr>
								<%
									}
								%>
							</table>
							</p>

						</div>
						<!-- ������ �޴� ���� -->
						<%
							Vector<menuBean> sidemenu = menuMgr.getMenu(shop, side);
						%>
						<!-- ���̵� �޴� -->
						<h3 class="sectiondropdown">
							���̵� �޴�<i class="fa fa-caret-down" aria-hidden="true"></i>
						</h3>
						<div style="height: 100% !important;">
							<p>
							<table
								style="width: 600px; margin-left: 20px; margin-right: 30px;">
								<%
									for (int i = 0; i < sidemenu.size(); ++i) {
										
										menuBean sidebean = sidemenu.get(i);
										String mImg = sidebean.getmImg(); // �޴� �̹���
										String menu = sidebean.getMenu(); // �޴� �̸�
										String mInfo = sidebean.getmInfo(); // �޴� ����
										int mPrice = sidebean.getmPrice(); // �޴� ����
								%>
								<tr>
									<td><font color="black" size="4"> <a
											href="javascript:cartView('<%=shop %>','<%=menu%>','<%=mInfo%>','<%=mPrice%>')"><%=menu%></a>
									</font></td>
									<td rowspan="3" width="140px" height="130px" align="center">
										<%
											if (mImg == null) {
										%> <img src="../img/menuImg/ready.gif"
										alt="�̹��� �غ���" width="100px" height="100px"> <%
 	} else {
 %> <img
										src="../img/menuImg/<%=mImg%>" alt="�̹��� �غ���" width="100px"
										height="100px"> <%
 	}
 %>
									</td>
								</tr>
								<tr>
									<td><font color="#808080" size="3"><%=mInfo%></font></td>
								</tr>
								<tr>
									<td><font color="black" size="3"><li><%=mPrice%>
												��</li></font></td>
								</tr>
								<%
									}
								%>
							</table>
							</p>

						</div>
						<!-- ���̵� �޴� ����-->
					</div>
				</td>
			</tr>

			<!-- ���� ��� ��ư -->
			<tr>
				<td colspan="3">
					<table style="width: 600px; margin-left: 50px; margin-top: 50px;">
						<tr>
							
							<td width="300px" style="text-align: center;">
								<font color="white"><a href="../cart/reserve.jsp" class="btn btn-primary"> ����</a></font>
							</td>
							<td width="300px" style="text-align: center;">
								<a href="../cart/cartView.jsp" class="btn btn-primary"> ���</a>
							</td>
						</tr>
					</table>
				
				</td>
			</tr>
			<!-- ���� ��� ��ư  ��-->
			<tr>

				<!-- ��ǥ�޴� -->
			<tr>
				<td colspan="3">
						<jsp:include page="../review/review.jsp" />
				</td>
			</tr>
		</table>
	</div>
</div>

<script src="https://use.fontawesome.com/9bc7fc2951.js"></script>
<script src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js"
	integrity="sha256-WyjlLy3rvVSitHOXMctYkMCOU6GAletPg+qniNKLCQM="
	crossorigin="anonymous"></script>