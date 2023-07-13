package com.study.board.bbs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BbsController {
    
    @Autowired
    BbsDAO bbsDao;

    @GetMapping("/index")
    public String viewIndex()
    {
        // 유저의 로그인 유무 정보를
        // 세선 유틸을 통해 확인한다
        // login 성공 시 > 세션 정보 저장
        // login 실패 시 > 세션 정보 미저장
        return "index";
    }

    @GetMapping("/login")
    public String login()
    {
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("BbsTblVO") BbsTblVO vo,
                        Model model) throws Exception
    {
        BbsTblVO resultVO = bbsDao.selectOneUserId(vo);
        model.addAttribute("userId", resultVO);

        if (resultVO != null)
        {
            // System.out.println(vo.getUserId());
            return "index";
        }
        else
        {
            
            // System.out.println(vo.getUserId());
            return "reLogin";
        }
    }
    
    @PostMapping("/bbs/list")
    @ResponseBody   
    public BbsMstVO dataBbslist(@ModelAttribute("BbsTblVO") BbsTblVO vo) throws Exception
    {
        BbsMstVO mstvo = new BbsMstVO();

        // 쿼리를 전송하여 결과를 가지고 온다.
        List<BbsTblVO> list =  bbsDao.selectBbsList(vo);

        // 결과를 MstVO에 저장하고 이것을 클라이언트에게 전송한다.
        mstvo.setBbsList(list);

        return mstvo;
    }

    @GetMapping("/bbs/content")
    public String viewContent (@ModelAttribute("BbsTblVO") BbsTblVO vo,
                                Model model) throws Exception 
    {
        // 1. 파라미터를 통해 클라이언트로부터 userId와 seq를 받는다.
        // 2. 쿼리를 DB에 던져서(DAO) 결과를 가지고 온다.
        // SELECT * FROM BBS_TBL WHERE userid='userid' AND seq = seq;
        
        BbsTblVO resultVO = bbsDao.selectBbsContent(vo);
        // JSP가 받은 값을 인식할 수 있는 이름 "vo"
        model.addAttribute("vo", resultVO);

        // System.out.println(vo.getUserId());
        return "bbs/content";
    }
}
