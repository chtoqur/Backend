package com.study.board.member;

import lombok.Data;

@Data
public class MemberTblVO {

    // 기본 속성
    private String memberId;
    private String memberPw;
    private String name;
    private String email;
    private String grade;
}