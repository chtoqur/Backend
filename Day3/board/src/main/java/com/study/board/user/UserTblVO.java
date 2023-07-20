package com.study.board.user;

import lombok.Data;

// 생성자와 게터,세터는 롬복의 도움을 받는다
@Data
public class UserTblVO {
    
    // 요청이 들어오면 VO는 DAO와 오라클, 세션, Model 등을
    // 이동하면서 다양한 기능을 수행함
    // VO는 테이블 스키마의 최대 개수대로 생성한다.

    private String userId;
    private String userPw;
    private String email;
    private String name;
}
