
 CREATE TABLE MEMBER_TBL
 (
    MEMBERID    VARCHAR2(50)    NOT NULL,   PRIMARY KEY(MEMBERID),  -- ���̵�
    MEMBERPW    VARCHAR2(50)    NOT NULL,   -- �н�����
    NAME        VARCHAR2(50)    NOT NULL,   -- �̸�
    EMAIL       VARCHAR2(100)   NOT NULL,   -- �̸���
    GRADE       VARCHAR2(2)     NOT NULL    -- A : ������, N : �Ϲ�ȸ��
 );
 
 select * from member_tbl;
 
 INSERT into MEMBER_TBL (MEMBERID, MEMBERPW, NAME, EMAIL, GRADE)
 SELECT 'cis', '1111', '���̼�', 'cis@gmail.com', 'N' FROM DUAL UNION ALL
 SELECT 'yhs', '2222', '��ȫ��', 'yhs@gmail.com', 'A' FROM DUAL UNION ALL
 SELECT 'ljw', '3333', '������', 'ljw@gmail.com', 'N' FROM DUAL;
 
 commit;
 