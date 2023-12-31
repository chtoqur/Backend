package com.study.board.bbs;

import lombok.Data;

@Data
public class BbsTblVO {
    
    // 설계 속성
    private int page;
    private int rowsPerPage;

    // 기본 속성
    private String rowNum;
    private String userId;
    private String seq;
    private String title;
    private String content;
    private String divi;
    private String regDate;
        
}
