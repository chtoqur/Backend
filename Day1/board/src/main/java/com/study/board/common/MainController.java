package com.study.board.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// MainController라는 클래스를 Controller로 사용할 것이다.
@Controller
public class MainController {

    // 실질적인 요청이 들어왔을 때 응답하는 함수 작성

    // index로 들어왔을 때 > viewIndex() 실행
    @GetMapping("/index")
    public String viewIndex()
    {
        return "index";
    }

    // @GetMapping("/bbs/content")
    // public String viewContent()
    // {
    //     return "bbs/content";
    // }
    
}
