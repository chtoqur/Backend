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

import com.study.board.common.GmailSender;
import com.study.board.common.SessionUtil;
import com.study.board.user.UserDAO;
import com.study.board.user.UserTblVO;

@Controller
public class MainController {

    @Autowired
    UserDAO userDAO;

    @GetMapping("/index")
    public String index(Model model) throws Exception
    {
        // 1. index를 요청한 대상에 세션이 존재하는지 여부 확인
        //    USER라는 대상의 VO를 가져옴
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        if (userTblVO != null)
        {
            // 2-1. 세션O : model에 사용자 정보 저장 후 index.jsp로 전송
            model.addAttribute("vo", userTblVO);
        }

        // 2-2. 세션X : 정보 전송 없이 index.jsp 전송

        return "index";
    }

    @GetMapping("/login")
    public String login(Model model) throws Exception
    {
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);
        }
        return "login";
    }

    // 아이디 패스워드를 넘겨서 로그인을 실제로 처리해달라는 요청
    @PostMapping("/login")
    @ResponseBody
    public String login(@ModelAttribute("UserTblVO") UserTblVO vo, HttpServletRequest request, Model model) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOneUser(vo);

        if (resultVO == null)
        {
            return "FAIL";
        }
        else
        {
            SessionUtil.set(request, "USER", resultVO);
            return "OK";
        }
    }

    @GetMapping("/logout")
    public void logout(HttpServletResponse response,
                        HttpServletRequest request) throws Exception
    {
        // 세션 삭제 후 인덱스로
        SessionUtil.remove(request, "USER");
        response.sendRedirect("index");
    }

    @GetMapping("/join")
    public String join()
    {
        return "join";
    }

    @PostMapping("/idChecking")
    @ResponseBody
    public String idChecking(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    {
        // 1. 넘어온 데이터(ID값)와 일치하는 유저가 DB에 존재하는지 확인
        UserTblVO resultVO = userDAO.selectOneUserById(vo);
        
        // 2-1. 일치하는 정보 존재한다면 아이디 사용 불가
        if (resultVO != null)
        {
            return "FAIL";
        }
        // 2-2. 일치하는 정보 존재하지 않는다면 아이디 사용 가능
        else
        {
            return "OK";
        }
    }

    @PostMapping("/join")
    @ResponseBody
    public String join(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    {
        int insertUserCount = userDAO.insertOneUser(vo);

        if (insertUserCount == 1)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }
    }

    @GetMapping("/idinquery")
    public String idinquery()
    {
        return "idinquery";
    }



    @PostMapping("/idinquery")
    @ResponseBody
    public String idinquery(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOneUserByEmail(vo);
        
        if (resultVO == null)
        {
            
            return "$NOUSER";
        }
        else
        {
            //id를 가공한다.
            String id = resultVO.getUserId();
            String editedId = id.substring(0, id.length() - 1) + "*";

            return editedId;
        }
    
    }

    @GetMapping("/pwinquery")
    public String pwinquery()
    {
        return "pwinquery";
    }

    @PostMapping("/pwinquery")
    @ResponseBody
    public String pwinquery(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOneUserById(vo);

        String senderName = "chtoqur@gmail.com";
        String senderPasswd = "jciisnugzlibtlcg";

        // Gmail 인스턴스 생성
        GmailSender gmailSender = null;
        
        if (resultVO == null)
        {
            return "$NOUSER";
        }
        else
        {
            gmailSender = new GmailSender(senderName, senderPasswd);
            // 파라메터
            // 1param : 받을 사람의 이메일 주소
            // 2param : 이메일 제목
            // 3param : 이메일 내용
            gmailSender.sendEmail(resultVO.getEmail(), "비밀번호 입니다.", "비밀번호 : " + resultVO.getUserPw());
            return "$OK";
        }
    
    }

    @GetMapping("/postalcode")
    public String postalcode()
    {
        return "postalcode";
    }

}
