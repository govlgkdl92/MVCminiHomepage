package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public class MemberDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static MemberDAO instance;

	// 싱글톤 - DB는 반드시 싱글톤으로 해야 한다. 한번만 생성해야 하기 때문에.
		public static MemberDAO getInstance() {
			if (instance == null) {
				synchronized (MemberDAO.class) {
					instance = new MemberDAO();// 맨처음 실행할 때 딱 한 번만 실행,생성된다.
				}
			}
			return instance; // 그 외에는 기존값을 불러옴.
		}
		
	
	//생성자
	public MemberDAO() {
		//mybatis-config.xml의 내용 읽어오기
		
		try {
			//InputStream inputStream =Resources.getResourceAsStream("mybatis-config.xml");
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			//자바 빌드 생성
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}//생성자 end
	
	// 2.로그인
	public MemberDTO login(Map<String, String> map) {
		MemberDTO memberDTO = new MemberDTO();
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		memberDTO  = sqlSession.selectOne("memberSQL.login", map);	
		
		sqlSession.close();
		
		return memberDTO;
	}// 로그인 end
	
	
	//2.내정보 수정  출력 modifyForm
	public MemberDTO modifyInfo(String id) {
		MemberDTO memberDTO = new MemberDTO();
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		memberDTO  = sqlSession.selectOne("memberSQL.modifyInfo", id);	
		
		sqlSession.close();
		
		return memberDTO;
	}// 내정보 수정 출력 modifyForm end
	
	
	//2.내정보 수정 업데이트 modifyForm
	public int modifyUpdate(MemberDTO memberDTO) {
		int su = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		su = sqlSession.update("memberSQL.modifyUpdate", memberDTO);

		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}// 내정보 수정 업데이트 modifyForm end
	
	
	
	// 1. 회원가입 - write
	public int write(MemberDTO memberDTO) {
		int su = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		su = sqlSession.insert("memberSQL.write", memberDTO);

		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}// write end
	
	
	//2.아이디 중복 체크 (boolean 타입)
	public int isExistID(String id) {
		int exist = 0;

		SqlSession sqlSession = sqlSessionFactory.openSession();
		exist  = sqlSession.selectOne("memberSQL.isExistID", id);	
		
		sqlSession.close();
		
		return exist;
	}// 아이디 중복 체크  end
	
/*		참 거짓으로 체크 하려고 할 경우
		boolean exist = false;
		sqlSession sqlSession = sqlSessionFactory.openSession(); 
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistID", id);	 
		if(memberDTO != null) exist = true;
		sqlSession.close();
		return exist		*/
	
	
	//집코드 목록
	public List<ZipcodeDTO> getZipcodeList(Map<String, String> map) {
		List<ZipcodeDTO> dtoList = new ArrayList<ZipcodeDTO>();
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		dtoList  = sqlSession.selectList("memberSQL.getZipcodeList", map);	
		
		sqlSession.close();
		
		return dtoList;
	}//집코드 목록 end
	
	
	// 회원 탈퇴
	public int idDelete(String id) {
		int su = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		su = sqlSession.delete("memberSQL.deleteUser", id);

		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}// 회원 탈퇴 end
	
		
		
}