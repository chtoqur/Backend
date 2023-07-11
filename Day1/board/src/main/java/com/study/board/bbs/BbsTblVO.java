package com.study.board.bbs;

import lombok.Data;

// 데이터를 저장하는 공간
// 나올 수 있는 최대값을 저장할 수 있는 공간의 크기로 만들어야 한다.
// 최대값이랑 테이블의 스키마 개수


@Data
public class BbsTblVO {
    
    // 파생 속성 (계산을 위해서 들어가는 속성)
    private String pageNum;     // 몇 번째 페이지인가?
    private String rowPerPage;  // 페이지 당 표현할 Row의 개수
    
    // 기본 속성
    private String seq;
    private String title;
    private String content;
    private String regdate;
    private String divi;
    private String userId;

}
