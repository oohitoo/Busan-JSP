/* 林籍 */
/* 林家 孽府*/
create table address(
	postnum NUMERIC(5),
	city varchar(10),
	gu varchar(7),
	street varchar(25),
	streetnum varchar(10)
)COLLATE='euckr_korean_ci';

create table customer(
	id varchar(30),
	pwd varchar(30),
	name varchar(20),
	cNick varchar(10),
	cPhone NUMERIC(20),
	cPost NUMERIC(6),
	cAddress varchar(50)
)COLLATE='euckr_korean_ci';

create table orders(
	oNum NUMERIC(5),
	id varchar(30),
	cNick varchar(10),
	cAddress varchar(50),
	rName varchar(10),
	cPhone NUMERIC(20),
	mName varchar(15),
	oDate date,
	oRequest varchar(20),
	orderType varchar(5),
	payType varchar(5)
)COLLATE='euckr_korean_ci';

create table review(
	rName varchar(10),
	cNick varchar(10),
	id varchar(30),
	rDate date,
	rContent varchar(100)
)COLLATE='euckr_korean_ci';

create table menu(
	rName varchar(10),
	mName varchar(15),
	mPrice NUMERIC(5),
	mInfo varchar(40),
	mImg varchar(30),
	mImgsize NUMERIC(20)
)COLLATE='euckr_korean_ci';

create table restaurant(
	idx NUMERIC(5),
	rName varchar(10),
	rArea varchar(10),
	rAdressRoad varchar(40),
	rAdressPost varchar(40),
	rPhone varchar(15),
	rImg varchar(30),
	rImgsize NUMERIC(20),
)COLLATE='euckr_korean_ci';

CREATE TABLE `Service` (
	`snum`               int(11)              NOT NULL  auto_increment  ,
	`sname`              varchar(20)                    ,
	`subject`           varchar(50)                    ,
	`content`           text                           ,
	`pos`                smallint(7) unsigned           ,
	`ref`               smallint(7)                    ,
	`depth`             smallint(7) unsigned           ,
	`regdate`          date                           ,
	`pass`              varchar(15)                    ,
	`ip`                  varchar(15)                    ,
	`count`             smallint(7) unsigned           ,
	`filename`         varchar(30)                    ,
	`filesize`           int(11)                        ,
	PRIMARY KEY ( `snum` )
)COLLATE='euckr_korean_ci';