
 select * from user_tbl;
 drop table user_tbl;
 
 CREATE TABLE user_tbl
 (
 USERID     VARCHAR2(50)    NOT NULL,   PRIMARY KEY(USERID),
 USERPW     VARCHAR2(50)    NOT NULL,
 EMAIL      VARCHAR2(100),
 NAME       VARCHAR2(50)
 );
 
 CREATE TABLE bbs_tbl
 (
 SEQ            NUMBER           NOT NULL, PRIMARY KEY(SEQ, USERID),
 TITLE          VARCHAR2(500)    NOT NULL,
 CONTENT        VARCHAR2(3000),
 REGDATE        DATE,
 DIVI           VARCHAR2(10),   -- N(Notice) : 공지, C(Common) : 일반, R(Required) : 필독
 USERID         VARCHAR2(50)     NOT NULL,
 FOREIGN KEY(USERID) REFERENCES user_tbl(USERID)
 );
 
 select * from user_tbl;
 select * from bbs_tbl;
 
 INSERT INTO user_tbl VALUES
 ('cis', '1111', 'cis@gmail.com', '최이서');
 INSERT INTO user_tbl VALUES
 ('yhs', '2222', 'yhs@gmail.com', '연홍시');
 
 -- N(Notice) : 공지, C(Common) : 일반, R(Required) : 필독
 INSERT INTO bbs_tbl VALUES
 (1, '테스트 제목1', '테스트 컨텐츠1', sysdate, 'C', 'cis');
 INSERT INTO bbs_tbl VALUES
 (2, '테스트 제목2', '테스트 컨텐츠2', sysdate, 'C', 'cis');
 INSERT INTO bbs_tbl VALUES
 (1, '연홍시 테스트 제목1', '연홍시 테스트 컨텐츠1', sysdate, 'C', 'yhs');
 
 commit;
 
 