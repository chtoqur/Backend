package com.study.board.bbs;

import java.util.List;

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

    @PostMapping("/bbs/list")
    @ResponseBody   // OK라는 jsp파일(X), 단순 데이터를 보내고자 함
    // 데이터를 보낼 때는 ResponseBody 어노테이션이 필요함
    // OK.jsp가 아니라 서버가 응답할 수 있는 http 패킷 바디 영역에
    // OK라는 정보를 작성해서 날리겠다는 의미. Body에 응답하겠다는 것
    public BbsMstVO dataBbslist(@ModelAttribute("BbsTblVO") BbsTblVO vo) throws Exception
    {
        BbsMstVO mstvo = new BbsMstVO();

        // 쿼리를 전송하여 결과를 가지고 온다.
        List<BbsTblVO> list =  bbsDao.selectBbsList(vo);

        // 결과를 MstVO에 저장하고 이것을 클라이언트에게 전송한다.
        mstvo.setBbsList(list);

        return mstvo;

        // 컨트롤러 수정
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
        // System.out.println(vo.getSeq());

        // System.out.println(resultVO.getTitle());
        // System.out.println(resultVO.getContent());


        return "bbs/content";
    }
}
