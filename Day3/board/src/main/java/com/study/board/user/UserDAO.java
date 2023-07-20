package com.study.board.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// 이 클래스를 Repository로 쓸 것임을 알려줌
@Repository
public class UserDAO {
    
    // MyBatis 사용, autowired로 객체 가지고 옴
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    // 유저가 존재하는지 확인하는 함수, 파라메터로 vo받기
    // 리턴 : 
    // 파라메터에 vo(id, pw)넣어주면 이걸 응용해서
    // 해당하는 유저를 찾는 쿼리를 던진 후 받아서
    // 모든 정보가 들어있는 데이터를 넘겨주겠다는 것
    public UserTblVO selectOneUser(UserTblVO vo) throws Exception
    {
        // sqlSessionTemplate는 1.select 2.insert 3.update 4.delete 함수를 지원
        // 그 중 select는 1-1. select(selectOne)과 1-2. select(selectList) 사용 가능
        return sqlSessionTemplate.selectOne("selectOneUser", vo);
    }

    public UserTblVO selectOneUserById(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.selectOne("selectOneUserById", vo);
    }

    public int insertOneUser(UserTblVO vo) throws Exception
    {
        return sqlSessionTemplate.update("insertOneUser", vo);
    }

}