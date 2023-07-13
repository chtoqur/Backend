package com.study.board.common;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.study.board.bbs.BbsTblVO;

// MainController라는 클래스를 Controller로 사용할 것이다.
@Controller
public class MainController {

    // 실질적인 요청이 들어왔을 때 응답하는 함수 작성

    // index로 들어왔을 때 > viewIndex() 실행


    @GetMapping("/reLogin")
    public String reLogin()
    {
        return "reLogin";
    }

    // @GetMapping("/bbs/content")
    // public String viewContent()
    // {
    //     return "bbs/content";
    // }
    
}
