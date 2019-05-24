<%@page import="shoplogin.loginMgr"%>
<%@page import="menu.ordersBean"%>
<%@page import="shoplogin.loginBean"%>
<%@page import="java.util.Vector"%>
<%@page language="java" contentType="text/html; charset=EUC-KR"	pageEncoding="EUC-KR"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="mgr" class="shoplogin.loginMgr" />
<jsp:useBean id="ordersMgr" class="menu.ordersMgr" />
<jsp:setProperty property="*" name="oBean" />
<%
	String businessName = String.valueOf(session.getAttribute("name"));
	/* 소켓을 위하여 세션 값 저장 */	
	session.setAttribute("shop", businessName);
	
	if(businessName==null){
		%>
<script>
	alert("로그인을 해 주세요");
	location.href = "shopLogin.jsp";
</script>
<%}%>
<!-- 알림 권한 획득 -->
<jsp:include page="../noti0518.html" />

<script type="text/javascript">
	$(window).load(function () {
		var webSocket = new WebSocket('ws://localhost:80/BusanIT_JSP_Project/broadcasting');
		/* 받은 메세지 */
		var Message = "주문이 도착하였습니다. \n";
		/* 가게 명  */
		var shopName = $("#shopName");
		
		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};
		
		function onMessage(event) {
			/* textarea.value += "상대 : " + event.data + "\n"; */
			/* textarea.value += "주문이 도착하였습니다.\n"; */
			/* alert("주문이 도착하였습니다.\n"); */
			var iconURI = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA+gAAAEICAYAAADMeN5PAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NUMyN0RBQTQ2OThCMTFFOUIzMTNDMzY4QUU0NDE3MzkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NUMyN0RBQTU2OThCMTFFOUIzMTNDMzY4QUU0NDE3MzkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1QzI3REFBMjY5OEIxMUU5QjMxM0MzNjhBRTQ0MTczOSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1QzI3REFBMzY5OEIxMUU5QjMxM0MzNjhBRTQ0MTczOSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Phc8/HsAACamSURBVHja7N1/jKVX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";
			
			var option = {
					boby: Message,
					icon: iconURI
			}
			var notification = new Notification("새로운 주문이 도착하였습니다.", option);
			
			setTimeout(function () {
				notification.close();
			}, 5000);
		}
		function onOpen(event) {
			/* textarea.value += "연결 성공\n"; */
			/* alert("연결 성공 \n"); */
		}
		function onError(event) {
			alert(event.data);
		}
		function send() {
			/* textarea.value += "나 : " + inputMessage.value + "\n"; */
			webSocket.send(id.value + ":" + inputMessage.value);
			inputMessage.value = "";
		}
	});
</script>

<head>
<meta charset="EUC-KR">
<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<script>
function updateOrderStatus(orderStatus , oNum){
	location.href="shopOrderStatusProc.jsp?orderStatus="+orderStatus+"&oNum="+oNum;	
}
/* 추가한 JQuery */
/* $(window).load( function () {
	// notiMessage Value 가져오기
	var notiMessage = $("#notiMessage").val();
	var iconURI = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA+gAAAEICAYAAADMeN5PAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NUMyN0RBQTQ2OThCMTFFOUIzMTNDMzY4QUU0NDE3MzkiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NUMyN0RBQTU2OThCMTFFOUIzMTNDMzY4QUU0NDE3MzkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1QzI3REFBMjY5OEIxMUU5QjMxM0MzNjhBRTQ0MTczOSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1QzI3REFBMzY5OEIxMUU5QjMxM0MzNjhBRTQ0MTczOSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Phc8/HsAACamSURBVHja7N1/jKVXfR/gs8WQgVbskkJTQpIdBzqtWtCOSQWmWrFjQpFIDB5Tg8HI2dn80dJE7Y4rVSC10s6qqeCPth6rlEYo7d7FapuqSJ4Bhxqn9t5FVurQVt5VUNROGvkupbSCtMxAAlMH2J6z972e8Xh25v54773ved/nkQ6zeHfuvO/33Hvnft5z3nOOXL9+PQAAAADT9SeUAAAAAAR0AAAAQEAHAAAAAR0AAAAQ0AEAAEBABwAAAAR0AAAAENABAAAAAR0AAAAEdAAAAEBABwAAAAEdAAAAENABAABAQAcAAAAEdAAAABDQAQAAAAEdAAAABHQAAABAQAcAAAABHQAAABDQAQAAQEAHAAAABHQAAAAQ0AEAAAABHQAAAAR0AAAAQEAHAAAAAR0AAAAQ0AEAACBftyhB/Rw5cmSk79/eCG+PX35uZi58TDXzdP36dUUAAIDMGEFnP/8xtr8Rg/rfUwoAAAABnSmZmQt/HL98IbZfiSHdKDoAAMAEmOLOzazFdl9sH48hPYX2TygJZbv9/qcUoXwrY378dtFGtRTbbAbHCcNaKFrwPId6efrhk4qAgM7E/fvYnovtZUVIfy6G9H+iLFB55ybwM8oK6KcyOE4YJaDn8nqk2pZjW4yts6ddiW1TeUBApwFiGP/DGMqfiH98d/Gf/nH8/9+L//2fqw4AwMQcC90Lmje7qHm5COpXhHcQ0Km3tV0BPflUMd1dSAcAqIZecL9rn7+7WgT19j4hHhDQycznYvvV2I4I6QAA2TmxJ8TfLLyHPSEeENCpmhjC/3cM40/HP75tz199Mv73b8e//1eqBABQi/C+e82Ea2FnqvyyUsHk2GaNw6zf5HnzmRjSP6w8AAC1c7wI7gtKAQI61bJ2wHNHSAcAqK+2EoCAToXMzIX/Fr/810NC+vtUCmCgD7zXtbG2NC13NXRXvwYEdBDQqZX1Q55Dvx5D+nuVCYCKSPfWni3ChZAOAjpkwyJx9CNNc//oAX//0tg+G0P6PTNzN1Z+p4Fuv/+ppfhlaYw/ogoL1TThHKFuQX11zK9bqKu0UJy91EFAp4K+HNv/iu21fYT0u2NI/w0la6TZsP82Ls4RmKZFJYChtJUAJs8Udw4VA/cP45fP9/FPU0j/dzGkv0PVAKiIo7HNKwMI6CCgUydrff67l8f2qJAOQIW4Dx0Gd0UJQECnup6M7TtCOgBA7W0J6CCgU2Ezc+H/xS+PDfAtKaR/Pob0t6oeAEBW2koAAjrVtzbgv39FbI8L6QAAWTF6DgI6GUirs39/wO95pZAOAJCVthKAgE7FzczduB/p0hDf2gvpt6kiAMIGeM0AAjrlWB/y+3oh/U1KCABQWZeVAKbnFiVgiID+ySG/99WxPZlWd5+ZC7+jlAAIG+yyUDReXJdJW1H2fbVi6ygDAjqVEYP112LA/s/xj39ZSAcgA20lyCqInlOGqTtVNPZ/PxHQGStT3BnG+ojfn0L6YzGkv0EpARizNSUAQEDHh52D/XhsbSEdgDG6FmwXBYCATp3NzIWvxC+/X8JDvU5IB2CMlpUAAAGdJihrymAK6ZdiSP8JJQWgRBeD6e0ACOg0xHqJj5XCeVtIB6DEcL6kDAAI6DTFb8X2zRIf7/VCOgAjSvecnxHOAciVbdYYysxc+EEM048WH4TKDulvj4//dVUGGMrV0Mx7rzvB9kcACOg02FrJAb0X0r9Y7JP+TSUGGNhmsPc3AGTJFHdG8ZuxfXcMj/vG2J6MIf01SgwAAAjocIiZufC9+OWLY3p4IR0AABDQYQDrY3zsFNIfiyH9qDIDAAACOhzs87H9cIyP/+bYHhfSAQAAAR0OMDMX/m/88qUx/5i3COkAAICADodbn8DP6IX0Vyg3AABQR7ZZowxpu7UHJxTSH40h/c6ZubGsHg8AOZmNbWFCP6ut3AACOhmIYbkTQ/PV+McTE/hxdwjpAHDD6aJNysXYlmPbVHqA8TDFnbKsTfBn9UK66e4AMNkLAu3YjikFgIBOta1P+OelkP5vY0h/mdIDwMSk2XJLygAwHqa4U4qZufBMDMtfjX/8qQn+2Dtj+2z8uffEn/+cXgCAiViMbTXD474c3EtfdwuxnVIGBHToStPc//aEf+Z7hHQAmKj5TI87hfMV3VdrKwI6uTPFnTKtT+nnppD+b2JIf4kuAICxO6oEAAI61fel2L41pZ/9vtg+I6QDAAACOo03Mxe+H788OsVDuE9IBwAABHToWpvyz++F9CO6AgAAENBpssdj265ASP+UkA4AY7GlBAACOhmYmQt/GL/8hwocykeEdAAYiytKACCgk4/1ihyHkA4A5esoAYCATj4+F9v1CoX0f6RLAKA0RtABBHRyMTMXvhG//FaFDunvbG+ET+gZAChFWwkABHTyslax4/mokA4AI7sW6jmC3g7d2X9a9duClyECOgxuvYLHlEL6P9A1ADC0VSUAGJ9blIBxmJkLvxfD8O/GP/7Fih3a34/H9Ufx+Iym52c2tpUpH8OCbgAaLI2et5QBQEAnT2sVDOjJx2NID0J6do7Hdk4ZAKYi7X2+GNumUgCMjynujNN6hY8thfSP6SIA6CucLwSrtwMI6GTtP8X29YqH9F/STQCwr6uxnQ/dW4yEcwABnZzNzN1YaXO94of5z2JI/5t6C4AMpfB8ZIxtPnTX/jCtHUBApybWMjjGTwnpAACAgE7dtWP7diYh/YzuAgAABHRqaWYuPBe/fCGTw/21GNI/rNcAAAABnbpay+j18BkhHQ6Utrq7XkI7pZQAAAI6k/dYbM9lFtLv020AAICATq3MzN3YP/VSZq+LVgzp79V7AACAgE7drGV2vC+N7bNCOgAAIKBTN5/L8JiFdCBHs0oAAHm6RQmYhJm58PUYdL8c//iWTEP6u+M5PKEngQwcj20+titKQWbaI3zvbDj84lRHiWsv9fHlMT7+phIjoFMnaxkG9F5I/3wM6XfGkP6kbgQysBLbojKQYUBvKwMjaBUNsmWKO5O0nvGxvzy2R2NIf4duBDJwV2yrygAAAjrsa2Yu/G788ns1COlv15tABs6G7nTP5dgWlAMAqs8UdyYtTXP/u5mH9DTd/V0zc+G3dSdQcel+9AeVYSgXQ/fihntOm2EaazaktSKOTvGcL2faV16TCOggoL/AK2N7XEgHqLXToXsf/6xA0AjLE/55S7FdmPI5t0N3vQqgQkxxZ9Keju0bNTiPXkh/qy4FqK2jAgxjsFqBcJ6cC91RfEBAp6lm5sIPQ557ot8spH8hhvQ36VlgAB0lyIrV8CnLsdBdYfxshY6ppVtAQIe1Gp3Lj8b2pJA+EeleuSNTbud1AwJ64xwvghWMYjZ0p5SfrthxnQhmiYCATuM9Edsf1eh8Xi2kAwO4ogTZMQ2YUSwWr/sTFT0+U91BQKfJZubCdvzyWM1OqxfS5/QwcIiOEkBjpPvNHwnTXa29H61gpggI6DTaWg3PqRfS36B7gQOkkbQtZaAEbSWorNnitX42k+M11R0EdBruN2L7fg3P63XpA5OQDhxiTQmgtpZDtae030y6mLCg+0BAp4Fm5sK34pcv1fT0eiH99XoaENBroaME9GE2dGc1PBiqP6X9oPcmU91BQMcH1FqG9C/GkP4Tuhm4yfvfNWUQ0Gt6XE3UGzU/lfl5pAsLLd0JAjrNtF7z80sj6G0hHbiJFSXIQpUvpAjo0zdfBPOcR833uit0LzgAU3CLEjAtM3PhqzG8PhP/eFsDQvpCPN+v6XVq4GIoZ3QlrWx8ouG1bBUfgk94WlVaVbfFMwNjuo4V72Ona3p+K6E7Xd+2kCCgM6oYBj8Qv7wik8P9RgO6JIX0J2K/nIwh/ZueoWSuE8pZOXpTKW9YKup5VCkqq13h1yLTC6/LNX/d9qa62x8dBHRK8AexPRrby5WiMtL+6GkLtncI6cAuV4oP+heUorLWKvzcYbKWinB+vCHnm2b3rIZqT3dfKo5xwWuCunAPeg3FAPhk/HJnbN9TjUp5YxHSX6MUwC6t2M4oQyVdDtUdqRZGJhsC0/PgQoPCeU+Vt15bKvokjfa3g9F+BHSEdEYI6a9SCmBPSE/rcbivuFpWKnxsbd3TyGC+VbxXXJ7w+9OxCvbN7plHKaTbIg4BHSGdoUP6YzGku+cU2C2NiKYRoPNKUQnnKxyCrwb3oI/LsVDtEfOl4r1iqQjrk3A8VGvrtdWw/21Bx4vXrJCOgI6QzsDeEtvjQjqwR1o8byW2W4uAaER9Oh4KRs+bZrbo86oG8yTdCtNbE6Ez4edo2nptoQI1SBcKzh7w9yeEdAR0hHSEdKBsvQ/fKTSk6awPxLYeuiOnjE+q8R2h+ntAr+qq0iwUoffZ2M6Faq7MnkbK7w4vHsVenfB7QmvKwTf9/H62tTvhNULOrOLeoJAeg2AK6VZ3r15I/1zsm3fHPvqucgD7uFK01X2CBeXYDPksulblhety0ZvGni7EVH3Rt61w8Arl6RwuTehYjhc/b2UK/ZXC+V0DfE8vyC95uiOgI6QzqLenPkl9I6QDA2grQSOtKMHQForAdjqT402j44vh4Asy6X0gXbQ5NaFjOleE5c4Ew3k6xxNDfG/q581Q/Rkx8AKmuDcwpMcv74rt26pRKXcUIf0VSgHATVwOLswMarYIaClQXsoonK8XFxT6CcIrEz62SU0fHyWc96T71Ze8DBDQqXpIf0pIr2xIX48h/WVKAZC9zZIfb0vQGEgaee7dW/5gyGv/8geK4+/nOXRsCgF9EgvGzZYQznsueO0goJNDSP9tIb2S3hnbZ4V0gOy1S368FDA6ynpoqFst6vRIGOye5SpIuzbcFvofoe6NMJ+awrGO86JA2m7ySknhfHdIn/cSQUBHSGcY7xHSAbKXAkZZK2zv3l6LF4fUpSKoptHyNKX5eIbncXFXMO03xHZKDrGDSBcFFsbwuItFX45jNf22kI6AjpCOkA7QXCk4bo3w/SngpxHVllLuG+RaYWff8lOZnkdvC7X0XNkc4NzHFWIHsVLy46W1Ah4Z43kdFdIR0BHSGTWkX4gh/SVKAZClNBq6ELqLuw0azM+EwUZUmyDVY/cU9tOhmvuW9ystBDcbBpsdMe4QO4iyRtGPFTV4cALHnOrWCtPdzx0OZJs1ng/pMQimkP54bK9Ukcq4L/1P7JtfiH30A+UAyDakz+76ejPt4t9vKtvzUr2Wina8JufUW/Bv0NsWUrCs2ir0KyOG9PmiDpPs2xPFa23Baw0BHSEdIR2gmTrBVPVBLBfteM3O66Ei1A4SDMvYbmxceqPo7SHD/bkpHXcvpJvuTuWY4s6LQnow3b2qIf3TMaQfUQoAGmCzZuE83baQtlNdHjCcT3sxuH4sDfjvU6C/MsVwvjukt7zUENAR0hnWL8b2KSEdgAZIwelyDc4jTWd/oAja7SGCb/qeqt9nn6bdz/bx72aLfr0UqnPB4bSQjoBOTiH9r8b2B6pRKR8R0gFoiKXMj/+hsLM3+6DS91wI+SyCd1BfpSn6K6E7an66gsd+ugbPNQR0GhLSvxy/vENIr2RI/6fKAEDNdWI7n+Fxp5H/W8Pg09l7YTYF2bOZnfN+AXe2COapH9N09qpebEh70Le83BDQySWk/46QXkm/vL0RPqEMANRcGkm+lsmxpuNM95kvFKF0UL3vO5FhP6X1AhaLP/f2qH+24sG8F86XvMwQ0BHSKcNHhXQAai6NQC9nEMzTvvWzYbjVzJOV0L03O+d93VeL/urtUV91Z4RzBHSEdIR0ABhM2ie7igvGpQXg0hT8tABca8jH6G2hdq4G/ZRG0XO5wHAmmNZORdkHnYFCegyDKaQ/GdurVaRSIf07sX/+oVIAoTsiNKsMWeuEnSnSbeV4/nn9bIWC+WrYGTEe1kLoXnw4qnsn2nep7leUAgEdIZ1x+pXYLz+I/WM0HUhB5pQy1MrVIgy2GlyDTuiOVk97pDnds7wShrvHfLfUn2c9tSf+OloSzqk6U9wZKqQH092r6OMxpH9MGQBqJy0adqEIhfMNrsM0F4xLwfzWIuCNEs7nw3RWab/W8NfQejByjoCOkM6UQvoDygBQS+ke33aDQ/o0FowrK5iH4tifCZNfpf1q8ZxpakhPn4sWw2i3I8DEmOLOSCG9QdPd/09sn8zkWH/Es3NsZifw4RPgIOl+5bUicDXxPaO3YNy4b+Moayp773dHK0zn1pPePdebRe2aNK3+WhHMjZojoNPIkP6bsf1YjU/1T8f2L+P5fjWHg71+3XMz04DuQwTQjzSSvlwEyCZaCuNZMK6sxd926/XTNBaC2x3OQ3GRoCkB/aGi7i58kx1T3CklpMcvJ2P7nzU/1ffr7ak65RgAXhBSm6oTugvGleVa8XizJYa69Fjt2B6ccjjffeH3Sqj/NPd0fneE7oUR4RwBnUaH9P9e/CKoc0i/T09P3ewUf/biBH6GDxNAv46HZm+nV8aCcen7z5QczEPxWGmEf1oXdQ/aSqxd4+dEGjWfD7YmRECHxoT0N29vhNfr6alaqnlAN8UdGESTA/rmCL8T0ored4Sde8PL0gvF09wKrrcg3M1+n9QxvF4NRs0R0KGxIf1DenmqlsN0Vi9Oz+nTyg9UzELDz79dhO1+pFHlNMKaVmRfLDmoHiuC/qUw+RXa9wbV9JzoHFKzukh9+kAwao6ADo0O6ffq4ak6WvwSXprwB+C1CX7YBKB/y0VQOyi09qaxL4dyVmXf+/PTY077Im4vnB82glyXEeaLRZ+ueglQN1ZxZ2whfXvjxi+KFDheV6NTe2M8rzfG8/uKXp5qSL9Q/FJOz69xTgtPoyyTGg3Z0rUAA+sUvw/O7Xk/XSv++7h+R6TPOK3QXQtg2voN5yHkfyE4bbG3ElzQRkAHIX2XNIouoFcjqN9VtDpw/znAcFJgWyrCeqsI5+MaKZ4vgn9VdvW4GPqfVZZqcyLTPk4XXZZDuWsGQCWZ4s7YQ3qo33T3D+rZfVmYRUAHmJbZsDOqvTmmx0+P/UzG4TzHtVRSMD8fyl/QDwR0hPQahfQ3bG+En9GzAqb6ATQi+Kdg+GzFAu6ZAcL5cqbhPF2ASDMWVoJBAAR0ENIPYRSdsrWVAEAwP0QaUb479D+anEL8g5nVPt1nflvYuW0BBHQYY0h/W2y/X4PTuXd7IxzRqy9gBHh413wIARDM+/hdsRD631kkBdwLmQXzO8LOfvIgoMMEQvr/KN54cw/pPxnbX9GjO55++GSafmYl8uG0lQBAMD9AWql9foDgmlM4v7YrmPt9iICuBEwhpH+tJiHdNHdBsyxrSgAgmN9E717sfu/DziWcp2De26Pe5wcQ0BHSR3bP9kZ4id4U0Ee0pW4AEzefQTAPYbDF4HIK58lisDI7vIh90JlqSN+1T/rrMzyFPxu6Fxme0JvPSyPBDyrDwDWzOi1lSis2H1OGqVsKea6cXXfp9/ZKqM5WaTezFQa/FzuncN77/TfIzAAQ0EFIP9S9AvqOpx8+2bn9/qcuZ/DBp0paSkDJLK5UnSBIdaTwmi5encjgWNPv0cUBg2v6XZLbBaHjoXuxZNnTE3aY4k4lQnrId7p7mub+Ur0ocI7wIaytDABjcawIgJ3QHVnOIZw/VHwmqns47zkbXMwCAR0hvUSviu2denDH0w+fbBXBk8OtKAFA6Xr3l38rtnOhO1Jbdb39zQcZTU4XINoh/1sp1oLbckBAR0gv0X1670VMVzuc0XOAci0V76vPZBZa0++D+TDYjh69cF6HW8qOBrPvQEBHSC/Re7c3woze2/H0wyfTPbBnVOKmtsJgq/ICsL/Z2FZDd0r4hQwD6/nic09ngO+ZL/79iRr1413BxX0Q0Kl0SH97bF/J5JBfGdvP67kXhfRW6O7dyostD/hhDGA/TX0fSaPHS6G7IGLaJi3dx3w0s3NIe4DfEQa/1SmddzvD8+1HqsW8lzUCOlQzpH89fnlHRiH9/Xpt35CePkg8oBIvkGYWtJQBENAHllY2T9PA073luSz6tp/1Ioi2B/y+1eK8j9a0f011BwGdiof0b2YU0u/a3gh/Sq/tG9LTB4o0SnBNNYRzgAH1FnxLU9gfCd2p0LnqLQQ36BZqvfvNzzagv9NFl1VPewR0ENJHPtTY7tRjNw3p7dhmi4DaxKDem8oonAMMJoXTtOBb7qPGaSG49HtwbcDvSxco0lT+Uw3qc1uvIaCDkF6KD+utQ4N6qwjqaQThYgPCejq/M8WHsrZnADTKJAJGpwF1TO+d6xkffxo1fyAMvrd5ktYrSSvSH2/g68fWazTWLUpALiF9e+NGSH8ytjdW9DDfFY/xaDzWLT12aFBPv3jXbr//qVCE1/miHQv5LxCTPjBfKT5UXtHb0FiTeC/rNKSWy0XAzW0UPY2aLw3RT+l3YSvkPZ1/VL370Re9lSCgg5A+rJfFdk9s/0JvDfwBM7U1pQBqFCiPKkOpvyfSfcnnMjnereI50BriexeK34eePztbr7knHQEdhPShvV9AB6asNxuF6UgjfpNYzOtyw+q6Erqj0VWf7r1eHOeg09mPFed41kvoBR4MZqQhoIOQPoJ3xmP7M/EYv6GngClJo02nlKH2Nht4zin4XqrosV0LO3uUD6q3Uv0JT+t9pZrONvQ5TwNZJI5sQ3qo5sJxL4ntfXoIgDFr4ohiCmpVXDDufBhuX/NkJXQXghPOb+5osNAqAjpkFdL/S8UO7T69A4CAPhbpnuSqLMaabjO4tQjZg47uLhR9eM5TuS/pAkZLGRDQIY+Q/rOxfblCh3VyeyP8uN4BQEAvXSdMf9GwNJ397iJkdwb83mPF8V8KRs0HdTp0byMAAR0qHtLTlfR3VSikH4ntXj0DwBgDYqfB579S1GDS0ueNNJ19Ngy388hi0W9VWAgu1y1hL4TuhREQ0EFIH4iADsC4tJVg4iOpDxXBfGWI750t+uyRUI3t086EvLcuSxdH5r0EENBBSB/EW7c3wk/rFQAE9LHVYBILxl0M3fvM073vw26d9myozs4KKZy3Qt63SPQWjbOdJAI6COkD+YAeAWAM1pTghnEuGLdeBPOlMNztBEuheovA9cJ5kvuWZUI6AjoI6QP7oN4AYAzB0X7QXSk4lz1VuzdivjhkMF8ognm6V/p4Req0tSech1CPNQxOCOkI6CCkD/SLY3sj/AW9AUCJWkrwAiuhnAXjesF8acjwOluExaqtzr5VXDTY+7zp1KT/hXQEdBDSB2IUHYCypCBqevuLLY0QXh8qIZin8Ful+8x7roadEf296hRohXQEdBDSBXQAJm5FCfaVwtkgC8alCx1ninC9PGQw370A3OkK1uTyAeE8qdsq6EI6AjpkGNKfnsKP//PbG7YCAaCUwNVShpvqZ8G4NI39jrAz6j3Mvfy9YJ5C/bmK1uJiEc6btlaBkI6ADpmF9J8N3XvDJs0oOgCj2CoCKDeXAvN+C8alCxtptPxVoTuNvT3k4+8N5kcrWoczob8p/wtjPo7LQjoI6HBYSP9u/HLnFEL6B7Y3whE9AMCQUji/ogyHSgH6WhEOHwjde8tTEG2F4UeTcwnm6bxvC/3Pspgd8/GkkLw+pVr0QvqslwQCOgjp+0kfEN6q+gAM4UwwtX0Qs0UoXw2jrVQ+W9T9WxUP5km6IJFupxvkIs7CBI5rKZSzwv6wIf1KCG4zREAHIX1/96o8AANI09rvFs4nbj7srMp+OoPjPR8Gv998Nkxmj/bNMPwK+2VIF1XaobunPQjoIKS/MKBvb3i9AdBXMH+oCFG2VJucxSLMPZNJMO9dwFkZ8lwnpV1cRJhmSH8kWMMBAR2E9D1eG9tJVQdgn6CVpiinlbd3b/21qTRjdyzsbLOWQtypTI477W+eRvqHvYCzNKFg3rNSHPM0PRi6MyMsHoeADkL68+5TcaAGUpg8opXWUmBYKEJTSzCfiIWwc395Cm7HMzr280U474xw7iemcNzp+b015dqdLi4cuC8dAR2E9Bvet70RblFxAJi43aPll0Ie09h3S+E27eG+MuLjrEzp+K9M8Wfv1lvh3X3pCOggpIfXxPZO1QaAiUlBLE0Fz3G0vCdtVzYbht/DvWchTG4a/37Huhqmt/Xabr370lvBlHcEdGh8SP+ASgPAWPVWYt8sgthdmZ5HGjVP6xIshtFvfTgWqrEjwFKY3tZre6VZFGlkf8FLBgEdqh3Sfy62z4/pR/y17Y3wIyoNAKWH8t7e572V2I9mfD69vc3LCNUpnLfD5GYPXD7g79KFhnTBYasidU41uVQ8d4ymI6BDRUP6dvxyz5hC+itje5cqA8DIFsPOSHkK5WdDnlPY95POq1PC48wW4XySC8Mddtxp1Lpq256dDUbTEdCh0iH9uTGG9A+rMAAMFTZTsEv3lF8P3enruY+U77Z75PlCEXSXi/MetE69ixfPhsmv2t7PhYV0bA9VrP5G06kEK0rDASF9e+NGSP9sbO8p8aHvjI/78vj431NlADgwaC7sasdrep4pmK+E7gjut/YExgeLdq0Ivu19vj+Fyd7WYVXYy73d57/rXXyo2hoBaTR9qTi+lpchAjrUP6T/yeKX0a+rMADsG9yWaxzIe64VwXx3CLwa9h/xPl60Uxmc15UB/u1SmPwU/H6kWRkXiuNbCaOvoA99M8Ud+gjpofzp7u9XWQDY11rNw3laIO182H8RuFbm55YuOgyy4nz6twuhOovG7ZUuiFwq+mXWSxMBHeob0n9+e6M298wBQJk6sV2s6bldLILeyk2CbDvz8xvm+Kse0pO01sGzgjoCOtQ3pKet1t6rqmT6wZlmO6UETMByxQPboNZjuzV0p0wfNMKcpodfy/g820N+35UMQvrzQf32+59qxTbvZYqADvUK6fepKAI6GYcnGKcUYldrcB5pAbg7QndV9X7fP9caGNB7IX0pk/NMQb0dQ/qslyoCOtQnpL9zeyP8qIoCGUqrSq8EWxExXimg5zqKfrUI5gtDhNZcA3pvpflRpHM/k8G5puflwtMPn+x4mVI2q7jDkCG9WN39M7HdO8LrLz3Gp1WUjGwqAYVzRbusFFOVAk2rpq/NdE5ptsaFzELqShhtsbd2EQCPZvhcLEOvdlXt9144vxJAQIfKhfQPxz/+IAw/Xf1eAZ3M+EDCXu5Jn379l0J3pLaOIb1VBN6qr+peRjDfG3ZPZ9hXZT9WFUP6snDOOJniDqOF9BTOfyG2fz3kQyzEkP9alSQTOU017TS4n8xyaJ60h/Rqjc9vqeLBPE3Jni05oOY2zT3VoezQ2ipqW6XfPWdC/lvhIaCDkH7Ia/AeVSQTOY0YdPQTDXO6xufWDtW7lWJcwXz3OedkXBeIUm0XKhLSzwvnCOjQjJD+IRVE8CudUWSaaKHG51aVnQPGHcx3v4etZ9I3W2OuRRW2YEv71694i0FAh2aE9Ldtb4SfUkEE9MYea9nanqrU9P3nYgOC+W65THNPo+ebE+j/VPurUwrnS16CCOjQrJB+r+oh+JX6QbrpQYZmmq/5+a2EyY+iXp1CMM/pPfdamNz6B+kiwEKY7IWaq8I5Ajo0M6R/UOXI4ENYR0DNwmaYzigT1ej7OutMMAyme97TPubzYXr3HXcyeC0vTfh5t1n8zPMTCucL3lYQ0KGZIf3N2xvhz6kcFZbTisJGkE1zb6pOA84xBfRxjqKn0dnbimBWhddRq8J98dAUa7QS291jfC5cC/XduhABHYT0Pr/FKDpV1sroWIXTem+5RbOlwFT2gnEpjKUR2VeF7uhslS7yVfX97GKY/sJ96cJxmuFQ9gr/KfQvCucI6FDvkN5PuHEfOlV1OeQzKr0loN/QCdXblorJhNcmaIVy1ppIr5He/eUrFa3flVC9dTWqtGhaeq9bCOVNed8qHs9MLAR0qHlI/8XYfvWQf/qXtjfCm1SMClrJ6FjXdNfzlpWgcZoUKoYNiCnspqnZtxZBrOV9baDweiZUc9G09Hsq3Zow6j37i8I5Ajo0I6Rfj19+qY+QbhSdqkkjTG0BPduw9pAyNEbTFgZsh/5niaRgmUZ90z3Ls6F78arjfW3g3wXTXDCv3/e8hRHe984EM7AQ0EFI3+NDKsWItkp+rKWMzv2agP4iK8GK7k0KrE18fvcTyo8V72VrGfft1pR+9rWihin4djKoVW+NgjsGrFkK5y1vIwjoIKTv9dPbG+FnVIqKfEhfCnmNMq3o/n0/rC5M8cM9k9PEcNEOL9wT+1qNQvlekz6P3fu/r2X63EjHvt7Hv70onCOgg5B+UEi/T5UYQRmrd/fuM8zpQ9lVH7AODOmzwUh6neW0kGPZVmJ7IHTvP56tWSjfGzjHrTfrYNr7v5f53rdY/D7bOiCcL3kLQUAHIf2gkP7+7Y1wRJUY4UPcxRGD7sIEPpiV/WHTB6zDP6imfnVPen1DalN1QvfCZN0vUIzrosN+sw7aNatd+n2233Zs6353IKAD/YT0n4ztpAoxYlg9Ewbbmme9+J75CX3Q7ZT4WGeCVXf7Dem9ezNtwVYfFrZqzut3fYTv3ype9ymMny/eB9K+77OhvrMO9v7OWQg727FdFc6pqiPXr19Xhbp16hGDrzkpRss/FdtHdv3nT8YA/7eGfcxcXte33/+UJ8D4pcB97JB/M40P98eKD0xHSwgnLd08lNkisKcpoMeVIztbRf95/jfH0gGhMgX4K/u8r3dCXmuJTOq9bzOMsO/90w8bR0FAR0BvWkj/ZmyvLfZQF9Cp84fNC0N+77VQz6mY0/zAOr+rHdv134X36rhchIp2Ecw3lQQmT0BnnG5RApi+NN09hvQ03f2HoTvt/TWhOxXrCdWhxlLA6BRf+w2BaVriajBqWLZO0WxTBwACOlDck/7LMah/J379aOjuiS6gU3ftsDN62/t6s/CYpm8aMQQAassU9zp2qinu2Ysh/RPxy1+P7cdicP/jQb/f6xoAAPJjFXeooBjKPxa/fDp0p7kDAAANYAQdAAAAKsAIOgAAAAjoAAAAgIAOAAAAAjoAAAAgoAMAAICADgAAAAjoAAAAIKADAAAAAjoAAAAI6AAAAICADgAAAAI6AAAAIKADAACAgA4AAAAI6AAAACCgAwAAAAI6AAAACOgAAACAgA4AAAACOgAAACCgAwAAgIAOAAAACOgAAAAgoAMAAAACOgAAAAjoAAAAgIAOAAAAAjoAAAAgoAMAAICADgAAAAjoAAAAIKADAAAAo/r/AgwAederFYsPZlgAAAAASUVORK5CYII=";
	
}); */
</script>
<title>판매자 페이지</title>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="shopMain.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					<!-- 앱 이름 -->
					<!-- logo Image -->
					<img src="../img/Logo_1.png" alt="logo이미지" width="220px"
						height="70px" style="padding: 10px;" href="shopMain.jsp">
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			<hr class="sidebar-divider d-none d-md-block">

			<!-- 배달 상태 -->
			<div class="sidebar-heading">배달 상태</div>

			<!-- Nav Item - Tables -->
			<li class="nav-item active"><a class="nav-link" href="shopPaidList.jsp"> <span>결재 완료</span></a></li>
			<li class="nav-item active"><a class="nav-link" href="shopDeliveredList.jsp"> <span>배달 완료</span></a></li>
			<li class="nav-item active"><a class="nav-link" href="shopReservationList.jsp"> <span>예약</span></a></li>
			<li class="nav-item active"><a class="nav-link" href="shopServedList.jsp"> <span>완료</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Heading -->
			<div class="sidebar-heading">관리자 페이지</div>

			<li class="nav-item active">
				<a class="nav-link" href="shopMenuUpdate.jsp"> 
					<span>메뉴 수정</span>
				</a>
			</li>

			<li class="nav-item active">
				<a class="nav-link" href="shopInfoUpdate.jsp"> 
					<span>정보 수정</span>
				</a>
			</li>
			<br/>
			<br/>
			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">
			<hr class="sidebar-divider d-none d-md-block">
			<!-- log out -->
			<li class="nav-item active"><a class="nav-link"
				href="shopLogOut.jsp"> <span>Log Out</span></a></li>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1></h1>
					<!-- 가게 이름 -->
					<h1 class="h3 mb-2 text-gray-800"><%=businessName %></h1>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">주문 목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
									<thead style="text-align: center;">
										<tr class="text-primary">
											<th>번호</th>
											<th>배달상태</th>
											<th>경과시간</th>
											<th>주문메뉴</th>
											<th>수량</th>
											<th>픽업/배달</th>
											<th>고객 요청 사항</th>
										</tr>
									</thead>
									<tbody style="text-align: center;">
										<!--자동테이블 -->
										<tr>
											<%
											Vector<ordersBean> orderListMain = ordersMgr.orderListMain(businessName);
											int listSize = orderListMain.size(), no =1;
											String oNumCheck = "null";/* oNum 같을때 test */
											if(orderListMain.isEmpty()){
												%>
											<th colspan="7" class="text-primary">
												<%out.println("아직 주문이 없네요. 홍보를 조금 더 해볼까요?"); %>
											</th>
											<%}else{
												int rcnt = 1 , scnt = 0;
												for(int i=0; i<orderListMain.size(); i++){
													if(i==orderListMain.size()) break;
													ordersBean oBean = orderListMain.get(i);
													String oNum = oBean.getoNum();
													int count = oBean.getCount();
													String id = oBean.getId();
													String cNick = oBean.getcNick();
													String cAddress = oBean.getcAddress();
													String cPhone = oBean.getcPhone();
													String menu = oBean.getMenu();
													String oDate = oBean.getoDate();
													String oRequest = oBean.getoRequest();
													String orderType = oBean.getOrderType();
													String orderStatus = oBean.getOrderStatus();
													//주문 시간 및 현재시간
													SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
													// oDate;
													Date curDate = new Date();
													//동일한 숫자로 row 갯수 맞추기
													rcnt = mgr.getNumCnt(oNum) - scnt;
										%>
										<%if(rcnt==1&&scnt==0){%>
											<td id="orderNum"><%=no %></td>
											<td>
											    <div class="container">
												  <button onclick = "javascript:updateOrderStatus('1', '<%=oNum %>')" type="button" value="1" class="btn btn-<%=orderStatus.equals("1")?"primary":"info"%>" name="oStatus">결재 완료</button>
													  		<button onclick = "javascript:updateOrderStatus('2', '<%=oNum %>')" type="button" value="2" class="btn btn-<%=orderStatus.equals("2")?"primary":"info"%>" name="oStatus">배달 준비 중</button>
													  		<button onclick = "javascript:updateOrderStatus('3', '<%=oNum %>')" type="button" value="3" class="btn btn-<%=orderStatus.equals("3")?"primary":"info"%>" name="oStatus">배달 중</button>
													  		<button onclick = "javascript:updateOrderStatus('4', '<%=oNum %>')" type="button" value="4" class="btn btn-<%=orderStatus.equals("4")?"primary":"info"%>" name="oStatus">배달 완료</button>
													  		<button onclick = "javascript:updateOrderStatus('5', '<%=oNum %>')" type="button" value="5" class="btn btn-<%=orderStatus.equals("5")?"primary":"info"%>" name="oStatus">예약</button>
													  		<button onclick = "javascript:updateOrderStatus('6', '<%=oNum %>')" type="button" value="6" class="btn btn-<%=orderStatus.equals("6")?"primary":"info"%>" name="oStatus">완료</button>
												</div>
											</td>
											<td>
												<%
												//시간 형 변환
												String cDate = dateFormat.format(curDate);
												Date oD = dateFormat.parse(oDate);
												Date cD = dateFormat.parse(cDate);
												//시간 차이
												long diff = Math.abs(oD.getTime() - cD.getTime());
												long sec = diff / 1000;
												long min = diff / (1000*60);
												long hour = diff / (1000*60*60);
												long day = diff / (1000*60*60*24);
												if(0<sec&&sec<60){%> 
													<%=sec %>초 전 
												<%}else if(0<min&&min<60){%>
													<%=min %>분 전
											 	<%}else if(0<hour&&hour<24){%> 
											 		<%=hour %>시간 전 
											 	<%}else{%>
													<%=day %>일 전
												<%}%>
											</td>
											<td><%=menu %></td>
											<td><%=count %></td>
											<td><%=orderType %></td>
											<td style="text-align: left;">
												<%=oRequest %>
											</td>
											
											<%}else{%>
												<%if(rcnt!=1&&scnt==0){%>
													<td rowspan="<%=rcnt%>"><%=no%></td><%}%>
												
												<%if(rcnt!=1&&scnt==0){%>
													<td rowspan="<%=rcnt%>">
												    	<div class="container">
													  		<button onclick = "javascript:updateOrderStatus('1', '<%=oNum %>')" type="button" value="1" class="btn btn-<%=orderStatus.equals("1")?"primary":"info"%>" name="oStatus">결재 완료</button>
													  		<button onclick = "javascript:updateOrderStatus('2', '<%=oNum %>')" type="button" value="2" class="btn btn-<%=orderStatus.equals("2")?"primary":"info"%>" name="oStatus">배달 준비 중</button>
													  		<button onclick = "javascript:updateOrderStatus('3', '<%=oNum %>')" type="button" value="3" class="btn btn-<%=orderStatus.equals("3")?"primary":"info"%>" name="oStatus">배달 중</button>
													  		<button onclick = "javascript:updateOrderStatus('4', '<%=oNum %>')" type="button" value="4" class="btn btn-<%=orderStatus.equals("4")?"primary":"info"%>" name="oStatus">배달 완료</button>
													  		<button onclick = "javascript:updateOrderStatus('5', '<%=oNum %>')" type="button" value="5" class="btn btn-<%=orderStatus.equals("5")?"primary":"info"%>" name="oStatus">예약</button>
													  		<button onclick = "javascript:updateOrderStatus('6', '<%=oNum %>')" type="button" value="6" class="btn btn-<%=orderStatus.equals("6")?"primary":"info"%>" name="oStatus">완료</button>
														</div>
													</td>
												<%}%>
												
												<%if(rcnt!=1&&scnt==0){%>
													<td rowspan="<%=rcnt%>">
														<%
														//시간 형 변환
														String cDate = dateFormat.format(curDate);
														Date oD = dateFormat.parse(oDate);
														Date cD = dateFormat.parse(cDate);
														//시간 차이
														long diff = Math.abs(oD.getTime() - cD.getTime());
														long sec = diff / 1000;
														long min = diff / (1000*60);
														long hour = diff / (1000*60*60);
														long day = diff / (1000*60*60*24);
														if(0<sec&&sec<60){%> 
															<%=sec %>초 전 
														<%}else if(0<min&&min<60){%>
															<%=min %>분 전
													 	<%}else if(0<hour&&hour<24){%> 
													 		<%=hour %>시간 전 
													 	<%}else{%>
															<%=day %>일 전
														<%}%>
													</td>
												<%}%>
												<td><%=menu %></td>
												<td><%=count %></td>
												
												<%if(rcnt!=1&&scnt==0){%>
													<td rowspan="<%=rcnt%>">
												    <%=orderType %>
												   </td>
												<%}%>
												
												
												<%if(rcnt!=1&&scnt==0){%>
													<td rowspan="<%=rcnt%>" style="text-align: left;">
											    		<%=oRequest %>
													</td>
												<%}%>
											<%}%>
											
										</tr>
										
										<%no++; scnt++; 
											if(mgr.getNumCnt(oNum)==scnt){	
												scnt = 0;
										}%>
										<%}//for%>
										<%} //if else%>
										<!-- 자동 테이블 -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- 주문이 오면 알림으로 날려주는 메세지 값 -->
			<input type="hidden" id = "notiMessage" value="주문이 접수 되었습니다.">
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2019</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->
		</div>
		<input type="hidden" id="shopName" value="<%= businessName %>">
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
</body>

</html>