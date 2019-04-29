create table memberTB(
	id varchar(30),
	pwd varchar(30),
	name varchar(30),
	phonenumber varchar(20),
	cPostNumber NUMERIC(6),
	cAddress varchar(20)
);

create table store(
	businessID varchar(13),
	storyName varchar(30),
	sPhone varchar(15),
	sAddress varchar(200),
	sCategory varchar(6),
	PRIMARY KEY(businessID,storyName)
);

create table Memu(
	businessID varchar(13),
	storyName varchar(30),
	mName varchar(10),
	mPrice NUMERIC(5),
	mInfo varchar(30)
);

create table Ordertype(
	oType varchar(5),
	payType varchar(10)
);

/* 0 : 만나서 현금 결제 
	1 : 만나서 카드 결제
	2 : 바로결제
*/
create table Orders(
	oNum int AUTO_INCREMENT PRIMARY KEY,
	memberid varchar(30),
	storyName varchar(30),
	mName varchar(10),
	oDate DATE,
	oCount NUMERIC(3),
	oPrice NUMERIC(7),
	oRequest varchar(30)
);

select id from membertb where id = 'admin';

select * from membertb where id = 'admin' and pwd = 'admin';

select store.storyName, memu.mName, memu.mPrice from store left join Memu on store.storyName = Memu.storyName;

select * from membertb;
select * from orders;

select membertb.id, orders.memberPhone, membertb.cPostNumber, membertb.cAddress,
orders.storeName, orders.mName, orders.oDate, orders.oCount, orders.oPrice, orders.oRequest
from membertb right outer join orders on membertb.phonenumber = orders.memberPhone;

select * from membertb full outer join membertb on membertb.phonenumber = orders.memberPhone;

select * from store left join Memu on store.storyName = Memu.storeName;