<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String tempPassword = "";
	for (int i = 0; i < 8; i++) {
		int rndVal = (int) (Math.random() * 62);
		if (rndVal < 10) {
			tempPassword += rndVal;
		} else if (rndVal > 35) {
			tempPassword += (char) (rndVal + 61);
		} else {
			tempPassword += (char) (rndVal + 55);
		}
	}
	out.println("tempPassword : " + tempPassword);
%>