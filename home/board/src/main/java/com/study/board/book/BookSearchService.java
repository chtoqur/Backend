package com.study.board.book;

import java.util.List;

public interface BookSearchService {
    List<BookSearchResult> searchBooks(BookSearchQuery query);
}
