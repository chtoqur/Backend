package com.study.board.bbs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class BbsController {
    
    @PostMapping("/bbs/list")
    @ResponseBody   // OK라는 jsp파일(X), 단순 데이터를 보내고자 함
    public String dataBbslist(String divi, String pageNum)
    {
        System.out.println("divi : " + divi);
        System.out.println("pageNum : " + pageNum);

        return "OK";
    }
}
