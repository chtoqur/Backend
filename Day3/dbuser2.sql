 
 select * from bbs_tbl;
 select * from user_tbl;
 
 ALTER TABLE USER_TBL DROP COLUMN ADDRESS;
 ALTER TABLE USER_TBL ADD ADDRESS VARCHAR2(300) DEFAULT '서울특별시' NOT NULL;
 commit;