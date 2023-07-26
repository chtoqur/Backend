package com.study.board.book;

import java.net.URLEncoder;
import java.net.http.HttpHeaders;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class BookService implements BookSearchService {

    private final RestTemplate restTemplate;

    public BookService(RestTemplateBuilder restTemplateBuilder)
    {
        this.restTemplate = restTemplateBuilder.build();
    }

    @Override
    public List<BookSearchResult> searchBooks(BookSearchQuery query)
    {
        List<BookSearchResult> results = new ArrayList<>();

        String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
        String queryParam = URLEncoder.encode(query.getQuery(), StandardCharsets.UTF_8);
        String url = apiUrl + "?ttbkey=ttbyejiniano1959001" + "&Query=" + queryParam + "&QueryType=Keyword" + "&Sort=" + query.getSort() + "&MaxResults=" + query.getMaxResults() + "&Start=" + query.getStart();

        // HttpHeaders headers = new HttpHeaders();
        

        // JSONObject item = items.
        return results;
    }
    
}
