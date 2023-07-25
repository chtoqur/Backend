package com.study.board.book;

import java.net.URI;
import java.util.List;

import javax.swing.text.html.HTMLDocument.Iterator;

import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class LibController {

    private final BookSearchService bookSearchService;

    public LibController(BookSearchService bookSearchService)
    {
        this.bookSearchService = bookSearchService;
    }

    // @GetMapping("/book/main")
    // public String main()
    // {
    //     return "/book/main";
    // }

    // @GetMapping("/book/result")
    // public String showResult(Model model, BookSearchQuery query)
    // {
    //     List<BookSearchResult> results = bookSearchService.searchBooks(query);
    //     model.addAttribute("results", results);
    //     return "/book/result";
    // }
    
}
