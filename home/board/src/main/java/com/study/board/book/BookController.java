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
public class BookController {

    @GetMapping("/book/list")
    public String list(Model model)
    {
        // 애플리케이션 클라이언트 아이디-시크릿
        String clientId = "48nxdPZ14ojZRBfJ7zW7";
        String clientSecret = "tO37rq0RyH";

        // 네이버 제공 파라미터
        URI uri = UriComponentsBuilder
        .fromUriString("https://openapi.naver.com")
        .path("/v1/search/book.json")
        .queryParam("query", "그린팩토리")
        .queryParam("display", 10)
        .queryParam("start", 1)
        .queryParam("sort", "sim")
        .encode()
        .build()
        .toUri();

        // Spring 요청 제공 클래스
        RequestEntity<Void> req = RequestEntity
                         .get(uri)
                         .header("X-Naver-Client-Id", clientId)
                         .header("X-Naver-Client-Secret", clientSecret)
                         .build();

        // Spring 제공 restTemplate
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);

        // JSON 문자열을 객체로 생성
        ObjectMapper om = new ObjectMapper();
        NaverResultVO resultVO = null;
        
        try {
            resultVO = om.readValue(resp.getBody(), NaverResultVO.class);
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        List<BookVO> books = resultVO.getItems();	// books를 list.html에 출력 -> model 선언

        // System.out.println(books.getTitle());
        model.addAttribute("books", books);

        return "/book/list";
    }
    
}