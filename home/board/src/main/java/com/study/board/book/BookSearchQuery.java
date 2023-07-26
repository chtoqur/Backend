package com.study.board.book;

import lombok.Data;

@Data
public class BookSearchQuery {
    
    private String Query;
    private String Sort;
    private int MaxResults;
    private int Start;
    
}
