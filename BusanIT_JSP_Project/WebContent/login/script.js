function inputCheck(){
    if(document.signup.id.value==""){
        alert("���̵� �Է��� �ּ���.");
        document.signup.id.focus();
        return;
    }
    if(document.signup.pwd.value==""){
        alert("��й�ȣ�� �Է��� �ּ���.");
        document.signup.pwd.focus();
        return;
    }
    if(document.signup.repwd.value==""){
        alert("��й�ȣ�� Ȯ���� �ּ���");
        document.signup.repwd.focus();
        return;
    }
    if(document.signup.pwd.value != document.signup.repwd.value){
        alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
        document.signup.repwd.value="";
        document.signup.repwd.focus();
        return;
    }
    if(document.signup.name.value==""){
        alert("�̸��� �Է��� �ּ���.");
        document.signup.name.focus();
        return;
    }
    if(document.signup.cNick.value==""){
        alert("�г����� �Է��ϼ���.");
        document.signup.cNick.focus();
        return;
    }
    if(document.signup.cPhone.value==""){
        alert("��ȭ��ȣ�� �Է��� �ּ���.");
        document.signup.cPhone.focus();
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
          alert('E-mail�ּ� ������ �߸��Ǿ����ϴ�.\n\r ���̵� �ٽ� �Է��� �ּ���!');
          document.signup.id.focus();
          return;
    }
    if(document.signup.cPost.value==""){
        alert("�����ȣ�� �˻��� �ּ���.");
        return;
    }

    document.signup.submit();
}

function win_close(){
    self.close();
}