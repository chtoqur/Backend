package com.study.board.book;

import java.util.List;

import lombok.Data;

@Data
public class BookSearchResult {

	private String title;
	private String cover;
	private String author;
	private String publisher;
	private String link;
	private String pubdate;
	private String isbn;
	private String description;
    
}
