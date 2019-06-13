function inputCheck(){
    if(document.member.id.value==""){
        alert("아이디를 입력해 주세요.");
        document.member.id.focus();
        return;
    }
    if(document.member.pwd.value==""){
        alert("비밀번호를 입력해 주세요.");
        document.member.pwd.focus();
        return;
    }
    if(document.member.repwd.value==""){
        alert("비밀번호를 확인해 주세요");
        document.member.repwd.focus();
        return;
    }
    if(document.member.pwd.value != document.member.repwd.value){
        alert("비밀번호가 일치하지 않습니다.");
        document.member.repwd.value="";
        document.member.repwd.focus();
        return;
    }
    if(document.member.name.value==""){
        alert("이름을 입력해 주세요.");
        document.member.name.focus();
        return;
    }
    if(document.member.cNick.value==""){
        alert("닉네임을 입력하세요.");
        document.member.cNick.focus();
        return;
    }
    if(document.member.cPhone.value==""){
        alert("전화번호를 입력해 주세요.");
        document.member.cPhone.focus();
        return;
    }

    if(document.member.cPost.value==""){
        alert("우편번호를 검색해 주세요.");
        return;
    }
    
    if(document.member.caddress1.value==""){
    	alert("주소를 입력해 주세요.");
    	document.member.caddress1.focus();
    	return;
    }
    
    if(document.member.caddress2.value==""){
    	alert("나머지 주소를 입력해 주세요.");
    	document.member.caddress2.focus();
    	return;
    }
  
    var str=document.member.id.value;
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
       dotPos > 3 && spacePos == -1 && commaPos == -1 
       && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r 아이디를 다시 입력해 주세요!');
          document.member.id.focus();
          return;
    }
   

    document.member.submit();
}

function win_close(){
    self.close();
}