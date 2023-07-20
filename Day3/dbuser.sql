
 select * from USER_TBL;
 select * from BBS_TBL;
 
 select rownum RN, BBS_TBL.* FROM BBS_TBL;
 -- RN : ÇÊµå º°Äª

 INSERT into BBS_TBL (SEQ, TITLE, CONTENT, REGDATE, DIVI, USERID)
 SELECT 3, 'Å×½ºÆ® Á¦¸ñ3', 'Å×½ºÆ® ÄÁÅÙÃ÷3', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 4, 'Å×½ºÆ® Á¦¸ñ4', 'Å×½ºÆ® ÄÁÅÙÃ÷4', '2023-07-09', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 5, 'Å×½ºÆ® Á¦¸ñ5', 'Å×½ºÆ® ÄÁÅÙÃ÷5', '2023-07-10', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 2, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ2', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷2', '2023-07-10', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 6, 'Å×½ºÆ® Á¦¸ñ6', 'Å×½ºÆ® ÄÁÅÙÃ÷6', '2023-07-11', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 7, 'Å×½ºÆ® Á¦¸ñ7', 'Å×½ºÆ® ÄÁÅÙÃ÷7', '2023-07-12', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 3, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ3', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷3', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 4, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ4', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷4', '2023-07-13', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 5, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ5', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷5', '2023-07-14', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 8, 'Å×½ºÆ® Á¦¸ñ8', 'Å×½ºÆ® ÄÁÅÙÃ÷8', '2023-07-14', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 9, 'Å×½ºÆ® Á¦¸ñ9', 'Å×½ºÆ® ÄÁÅÙÃ÷9', '2023-07-15', 'C', 'cis' FROM DUAL;

 INSERT into BBS_TBL (SEQ, TITLE, CONTENT, REGDATE, DIVI, USERID)
 SELECT 10, 'Å×½ºÆ® Á¦¸ñ10', 'Å×½ºÆ® ÄÁÅÙÃ÷10', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 11, 'Å×½ºÆ® Á¦¸ñ11', 'Å×½ºÆ® ÄÁÅÙÃ÷11', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 12, 'Å×½ºÆ® Á¦¸ñ12', 'Å×½ºÆ® ÄÁÅÙÃ÷12', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 6, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ6', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷6', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 7, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ7', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷7', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 8, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ8', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷8', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 9, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ9', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷9', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 10, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ10', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷10', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 13, 'Å×½ºÆ® Á¦¸ñ13', 'Å×½ºÆ® ÄÁÅÙÃ÷13', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 11, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ11', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷11', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 14, 'Å×½ºÆ® Á¦¸ñ14', 'Å×½ºÆ® ÄÁÅÙÃ÷14', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 12, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ12', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷12', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 15, 'Å×½ºÆ® Á¦¸ñ15', 'Å×½ºÆ® ÄÁÅÙÃ÷15', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 16, 'Å×½ºÆ® Á¦¸ñ16', 'Å×½ºÆ® ÄÁÅÙÃ÷16', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 17, 'Å×½ºÆ® Á¦¸ñ17', 'Å×½ºÆ® ÄÁÅÙÃ÷17', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 18, 'Å×½ºÆ® Á¦¸ñ18', 'Å×½ºÆ® ÄÁÅÙÃ÷18', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 13, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ13', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷13', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 14, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ14', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷14', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 15, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ15', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷15', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 19, 'Å×½ºÆ® Á¦¸ñ19', 'Å×½ºÆ® ÄÁÅÙÃ÷19', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 20, 'Å×½ºÆ® Á¦¸ñ20', 'Å×½ºÆ® ÄÁÅÙÃ÷20', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 21, 'Å×½ºÆ® Á¦¸ñ21', 'Å×½ºÆ® ÄÁÅÙÃ÷21', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 22, 'Å×½ºÆ® Á¦¸ñ22', 'Å×½ºÆ® ÄÁÅÙÃ÷22', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 23, 'Å×½ºÆ® Á¦¸ñ23', 'Å×½ºÆ® ÄÁÅÙÃ÷23', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 16, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ16', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷16', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 17, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ17', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷17', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 24, 'Å×½ºÆ® Á¦¸ñ24', 'Å×½ºÆ® ÄÁÅÙÃ÷24', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 25, 'Å×½ºÆ® Á¦¸ñ25', 'Å×½ºÆ® ÄÁÅÙÃ÷25', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 26, 'Å×½ºÆ® Á¦¸ñ26', 'Å×½ºÆ® ÄÁÅÙÃ÷26', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 27, 'Å×½ºÆ® Á¦¸ñ27', 'Å×½ºÆ® ÄÁÅÙÃ÷27', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 28, 'Å×½ºÆ® Á¦¸ñ28', 'Å×½ºÆ® ÄÁÅÙÃ÷28', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 18, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ18', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷18', '2023-07-12', 'C', 'yhs' FROM DUAL UNION ALL
 SELECT 29, 'Å×½ºÆ® Á¦¸ñ29', 'Å×½ºÆ® ÄÁÅÙÃ÷29', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 30, 'Å×½ºÆ® Á¦¸ñ30', 'Å×½ºÆ® ÄÁÅÙÃ÷30', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 31, 'Å×½ºÆ® Á¦¸ñ31', 'Å×½ºÆ® ÄÁÅÙÃ÷31', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 32, 'Å×½ºÆ® Á¦¸ñ32', 'Å×½ºÆ® ÄÁÅÙÃ÷32', '2023-07-08', 'C', 'cis' FROM DUAL;
 
 INSERT into BBS_TBL (SEQ, TITLE, CONTENT, REGDATE, DIVI, USERID)
 SELECT 33, 'Å×½ºÆ® Á¦¸ñ33', 'Å×½ºÆ® ÄÁÅÙÃ÷33', '2023-07-08', 'C', 'cis' FROM DUAL UNION ALL
 SELECT 34, 'Å×½ºÆ® Á¦¸ñ34', 'Å×½ºÆ® ÄÁÅÙÃ÷34', '2023-07-08', 'C', 'cis' FROM DUAL;

 
 select rownum RN, BBS_TBL.* FROM BBS_TBL
 WHERE RN >= 1 AND RN <= 5;
 -- ERROR
 -- ÀÌÀ¯ : WHERE Á¶°ÇÀº Å×ÀÌºíÀÇ °¡·Î, Áï Æ©ÇÃÀ» °¡Á®¿À´Â °Í
 --       ÇÏÁö¸¸ ÇöÀç RNÀº BBS_TBL¿¡ »ý¼ºµÇÁö ¾ÊÀº »óÅÂÀÓ
 -- ¼öÁ¤ : WHERE Á¶°ÇÀ» BBS_TBLÀÌ ¾Æ´Ñ
 --       RN + BBS_TBLÀÌ ÇÕÃÄÁø Å×ÀÌºí¿¡ Äõ¸®¸¦ ³¯·Á¾ß ÇÔ
 
 -- ¼öÁ¤
 select * FROM
 (select rownum RN, BBS_TBL.* FROM BBS_TBL)
 WHERE RN >= 1 AND RN <= 5;
 
 select * from BBS_TBL;
 
 commit;
 
 
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
 DIVI           VARCHAR2(10),   -- N(Notice) : °øÁö, C(Common) : ÀÏ¹Ý, R(Required) : ÇÊµ¶
 USERID         VARCHAR2(50)     NOT NULL,
 FOREIGN KEY(USERID) REFERENCES user_tbl(USERID)
 );
 
 select * from user_tbl;
 select * from bbs_tbl;
 
 INSERT INTO user_tbl VALUES
 ('cis', '1111', 'cis@gmail.com', 'ÃÖÀÌ¼­');
 INSERT INTO user_tbl VALUES
 ('yhs', '2222', 'yhs@gmail.com', '¿¬È«½Ã');
 
 -- N(Notice) : °øÁö, C(Common) : ÀÏ¹Ý, R(Required) : ÇÊµ¶
 INSERT INTO bbs_tbl VALUES
 (1, 'Å×½ºÆ® Á¦¸ñ1', 'Å×½ºÆ® ÄÁÅÙÃ÷1', sysdate, 'C', 'cis');
 INSERT INTO bbs_tbl VALUES
 (2, 'Å×½ºÆ® Á¦¸ñ2', 'Å×½ºÆ® ÄÁÅÙÃ÷2', sysdate, 'C', 'cis');
 INSERT INTO bbs_tbl VALUES
 (1, '¿¬È«½Ã Å×½ºÆ® Á¦¸ñ1', '¿¬È«½Ã Å×½ºÆ® ÄÁÅÙÃ÷1', sysdate, 'C', 'yhs');
 
 commit;
 
 
