CREATE TABLE `Service` (
	`num`               int(11)              NOT NULL  auto_increment  ,
	`name`              varchar(20)                    ,
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
	PRIMARY KEY ( `num` )
)COLLATE='euckr_korean_ci';
