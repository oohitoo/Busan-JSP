function inputCheck(){
    if(document.member.id.value==""){
        alert("���̵� �Է��� �ּ���.");
        document.member.id.focus();
        return;
    }
    if(document.member.pwd.value==""){
        alert("��й�ȣ�� �Է��� �ּ���.");
        document.member.pwd.focus();
        return;
    }
    if(document.member.repwd.value==""){
        alert("��й�ȣ�� Ȯ���� �ּ���");
        document.member.repwd.focus();
        return;
    }
    if(document.member.pwd.value != document.member.repwd.value){
        alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
        document.member.repwd.value="";
        document.member.repwd.focus();
        return;
    }
    if(document.member.name.value==""){
        alert("�̸��� �Է��� �ּ���.");
        document.member.name.focus();
        return;
    }
    if(document.member.cNick.value==""){
        alert("�г����� �Է��ϼ���.");
        document.member.cNick.focus();
        return;
    }
    if(document.member.cPhone.value==""){
        alert("��ȭ��ȣ�� �Է��� �ּ���.");
        document.member.cPhone.focus();
        return;
    }

    if(document.member.cPost.value==""){
        alert("�����ȣ�� �˻��� �ּ���.");
        return;
    }
    
    if(document.member.caddress1.value==""){
    	alert("�ּҸ� �Է��� �ּ���.");
    	document.member.caddress1.focus();
    	return;
    }
    
    if(document.member.caddress2.value==""){
    	alert("������ �ּҸ� �Է��� �ּ���.");
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
          alert('E-mail�ּ� ������ �߸��Ǿ����ϴ�.\n\r ���̵� �ٽ� �Է��� �ּ���!');
          document.member.id.focus();
          return;
    }
   

    document.member.submit();
}

function win_close(){
    self.close();
}