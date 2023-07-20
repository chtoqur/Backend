package com.study.board.bbs;

import java.util.List;

import lombok.Data;

@Data
public class BbsMstVO {
    
    private int rowCount;               // 게시판에 속한 데이터의 전체 개수
    private List<BbsTblVO> bbsList;     // 게시물의 리스트
}
