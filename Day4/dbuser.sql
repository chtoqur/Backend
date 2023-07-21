
 CREATE TABLE MEMBER_TBL
 (
    MEMBERID    VARCHAR2(50)    NOT NULL,   PRIMARY KEY(MEMBERID),  -- 아이디
    MEMBERPW    VARCHAR2(50)    NOT NULL,   -- 패스워드
    NAME        VARCHAR2(50)    NOT NULL,   -- 이름
    EMAIL       VARCHAR2(100)   NOT NULL,   -- 이메일
    GRADE       VARCHAR2(2)     NOT NULL    -- A : 관리자, N : 일반회원
 );
 
 select * from member_tbl;
 
 INSERT into MEMBER_TBL (MEMBERID, MEMBERPW, NAME, EMAIL, GRADE)
 SELECT 'cis', '1111', '최이서', 'cis@gmail.com', 'N' FROM DUAL UNION ALL
 SELECT 'yhs', '2222', '연홍시', 'yhs@gmail.com', 'A' FROM DUAL UNION ALL
 SELECT 'ljw', '3333', '이지우', 'ljw@gmail.com', 'N' FROM DUAL;
 
 commit;
 