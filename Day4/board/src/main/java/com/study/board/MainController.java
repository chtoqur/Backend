package com.study.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ServerProperties.Reactive.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.common.SessionUtil;
import com.study.board.member.MemberDAO;
import com.study.board.member.MemberTblVO;

@Controller
public class MainController {

    @Autowired
    MemberDAO memberDAO;

    @GetMapping("/login")
    public String login(Model model) throws Exception
    {
        MemberTblVO memberTblVO = (MemberTblVO)SessionUtil.getAttribute("MEMBER");
        if (memberTblVO != null)
        {
            model.addAttribute("vo", memberTblVO);
        }

        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public String login(@ModelAttribute("MemberTblVO") MemberTblVO vo,
                        HttpServletRequest request, Model model) throws Exception
    {
        MemberTblVO resultVO = memberDAO.selectOneUser(vo);
        
        if (resultVO == null)
        {
            return "FAIL";
        }
        else
        {
            SessionUtil.set(request, "Member", resultVO);
            model.addAttribute("vo", resultVO);
            return "OK";
        }
    }

    @GetMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        SessionUtil.remove(request, "Member");
        response.sendRedirect("index");
    }

    @GetMapping("/join")
    public String join()
    {
        return "join";
    }

    @PostMapping("/join")
    @ResponseBody
    public String join(@ModelAttribute("MemberTblVO") MemberTblVO vo) throws Exception
    {
        int insertCount = memberDAO.insertOneUser(vo);
        
        if (insertCount == 1)
            return "OK";
        else
            return "FAIL";
    }

    @GetMapping("/index")
    public String index(Model model) throws Exception
    {
        MemberTblVO memberTblVO = (MemberTblVO)SessionUtil.getAttribute("Member");
        
        if (memberTblVO != null)
        {
            model.addAttribute("vo", memberTblVO);
        }

        return "index";
    }

    @PostMapping("/checkId")
    @ResponseBody
    public String checkId(@ModelAttribute("MemberTblVO") MemberTblVO vo) throws Exception
    {
        MemberTblVO resultVO = memberDAO.selectOneUserById(vo);

        if (resultVO == null)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }
    }
}
