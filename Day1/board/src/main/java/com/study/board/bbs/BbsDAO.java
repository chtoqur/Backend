package com.study.board.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    // 입력 : VO로 받아온 것을 집어넣기
    // 출력 : VO 한개(한 줄)로 불가능, 따라서 list형 VO(BbsMstVO)
    // way1 : Master VO(BbsMstVO)를 리턴하는 방법
    // way2 : VO LIST를 리턴

    // 여러줄을 받을 때의 정형화된 패턴 메소드
    public List<BbsTblVO> selectBbsList(BbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectList("selectBbsList", vo);
    }

    // 관련 내용 추가
    public BbsTblVO selectOneUser(BbsTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUser", vo);
    }
}
