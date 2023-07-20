package com.study.board.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public MemberTblVO selectOneUser(MemberTblVO vo)throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUser", vo);
    }

    public MemberTblVO selectOneUserById(MemberTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUserById", vo);
    }

    public int insertOneUser(MemberTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("insertOneUser", vo);
    }
    
}
