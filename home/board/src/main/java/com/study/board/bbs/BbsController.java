package com.study.board.bbs;

import java.util.List;

import javax.mail.Session;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.common.SessionUtil;
import com.study.board.user.UserTblVO;

@Controller
public class BbsController {
    
    @Autowired
    BbsDAO bbsDAO;
    @PostMapping("/bbs/list")
    @ResponseBody
    public BbsMstVO bbsList(@RequestBody BbsTblVO vo) throws Exception
    {
        BbsMstVO bbsMstVO = new BbsMstVO();

        // 1. 전체 row의 개수를 가지고 온다.
        int rowCount = bbsDAO.selectBbsRowCount();

        // 2. page에 해당하는 BBS 데이터를 가지고 온다.
        List<BbsTblVO> list = bbsDAO.selectBbsList(vo);

        // 3. Master VO에 가져온 데이터를 저장하고 전송한다.
        bbsMstVO.setRowCount(rowCount);
        bbsMstVO.setBbsList(list);

        return bbsMstVO;
    }

    @GetMapping("/bbs/content")
    public String content(@ModelAttribute("BbsTblVO") BbsTblVO vo, Model model) throws Exception
    {
        // userId, seq에 맞는 게시물을 가지고 온다.
        BbsTblVO resultVO = bbsDAO.selectBbsContent(vo);
        // 세션 정보를 가지고 온다.
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        
        // 게시판 정보와 사용자 세션 정보를 모델에 저장한다.
        model.addAttribute("vo", resultVO);         // content row 정보
        model.addAttribute("session", userTblVO);   // log-in user 정보
        // cf. 만약 resultVO나 userTblVO가 null인 경우 model에서 알아서
        //     집어넣지 않도록 처리해줌

        return "/bbs/content";
    }

    @PostMapping("/bbs/content")
    @ResponseBody
    public String content(@RequestBody BbsTblVO vo) throws Exception
    {
        int updateCount = bbsDAO.updateBbsContent(vo);
        
        if (updateCount == 1)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }
    }   

    @GetMapping("/bbs/newcontent")
    public String newContent(Model model) throws Exception
    {
        // 어느 계정으로 로그인 된 상태인지 세션 정보를 전송함
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");
        model.addAttribute("session", userTblVO);      // log-in user 정보

        return "/bbs/newcontent";
    }

    @PostMapping("/bbs/newcontent")
    @ResponseBody
    public int newContent(@RequestBody BbsTblVO vo, HttpServletRequest request) throws Exception
    {
        int updateCount = bbsDAO.insertBbsContent(vo);
        
        if (updateCount == 1)
        {
            BbsMstVO bbsMstVO = new BbsMstVO();
            int rowCount = bbsDAO.selectBbsRowCount();
            bbsMstVO.setRowCount(rowCount);
            return rowCount;
        }
        else
        {
            return -1;
        }
    }

 
}
