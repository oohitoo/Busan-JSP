function inputCheck(){
    if(document.signup.id.value==""){
        alert("아이디를 입력해 주세요.");
        document.signup.id.focus();
        return;
    }
    if(document.signup.pwd.value==""){
        alert("비밀번호를 입력해 주세요.");
        document.signup.pwd.focus();
        return;
    }
    if(document.signup.repwd.value==""){
        alert("비밀번호를 확인해 주세요");
        document.signup.repwd.focus();
        return;
    }
    if(document.signup.pwd.value != document.signup.repwd.value){
        alert("비밀번호가 일치하지 않습니다.");
        document.signup.repwd.value="";
        document.signup.repwd.focus();
        return;
    }
    if(document.signup.name.value==""){
        alert("이름을 입력해 주세요.");
        document.signup.name.focus();
        return;
    }
    if(document.signup.phonenumber.value==""){
        alert("전화번호를 입력해 주세요.");
        document.signup.phonenumber.focus();
        return;
    }

    var str=document.signup.id.value;
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
          document.signup.id.focus();
          return;
    }
    if(document.signup.cPostNumber.value==""){
        alert("우편번호를 검색해 주세요.");
        return;
    }

    document.signup.submit();
}

function win_close(){
    self.close();
}