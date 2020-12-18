package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static BoardDAO instance;


	// 싱글톤 - DB는 반드시 싱글톤으로 해야 한다. 한번만 생성해야 하기 때문에.
	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();// 맨처음 실행할 때 딱 한 번만 실행,생성된다.
			}
		}
		return instance; // 그 외에는 기존값을 불러옴.
	}

	
	//생성자
	public BoardDAO() {
		//mybatis-config.xml의 내용 읽어오기
		
		try {
			//InputStream inputStream =Resources.getResourceAsStream("mybatis-config.xml");
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			//자바 빌드 생성
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
	// 1. 등록 - write
	public int boardWrite(Map<String, String> map) {
		int su = 0;
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		su = sqlSession.insert("boardSQL.write", map);

		sqlSession.commit();
		sqlSession.close();
		
		return su;	
	}// write end

	
	
	//BoardList 목록 생성
	public List<BoardDTO> getBoardList(Map<String, String> map) {
		List<BoardDTO> BoardList = new ArrayList<BoardDTO>();
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardList  = sqlSession.selectList("boardSQL.getBoardList", map);	
		
		sqlSession.close();

		return BoardList;
	}// BoardList list 목록 생성 end
	
	
	
	//글목록 list 총 글 수
	public int getTotalA(Map<String, String> map) {
		int count = 0;

		SqlSession sqlSession = sqlSessionFactory.openSession();
		count = sqlSession.selectOne("boardSQL.getTotalA", map);

		sqlSession.close();

		return count;
	}//글목록 list 총 글 수 end
	
		
	
	//boardView 생성
	public BoardDTO boardView(int seq) {
		BoardDTO boardDTO = new BoardDTO();
	
		SqlSession sqlSession = sqlSessionFactory.openSession();
		boardDTO = sqlSession.selectOne("boardSQL.boardView", seq);

		sqlSession.close();

		return boardDTO;
	}// boardView end
		
	

	//조회수 증가
	public void hitUpdate(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.hitUpdate", seq);

		sqlSession.commit();
		sqlSession.close();
	}//조회수 증가 end	
	
	
	
	//글 수정
	public int boardUpdate(Map<String, String> map) {
		int su = 0;

		SqlSession sqlSession = sqlSessionFactory.openSession();
		su = sqlSession.update("boardSQL.boardUpdate", map);

		sqlSession.commit();
		sqlSession.close();
	
		return su;
	}//글 수정 end
	
	
	
	//글삭제
	public void boardDelete(int seq) {	
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		//삭제할 글의 원글을 찾아서 답글(reply)를 한개 감소
		//삭제될 글의 답글들 제목 업데이트
		//글 삭제
		sqlSession.update("boardSQL.boardDelete", seq);

		sqlSession.commit();
		sqlSession.close();
		
	}//글삭제 end	
		
		
	// 1. 답글 - Reply
	public int boardReply(Map<String, String> map) {
		int su = 0;	
		
		//원글
		BoardDTO pDTO = boardView(Integer.parseInt(map.get("pseq")));
				
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		//원글 ref
		sqlSession.update("boardSQL.boardReply1", pDTO);

		// 2번째 생성
		map.put("ref", Integer.toString(pDTO.getRef()));
		map.put("lev", Integer.toString(pDTO.getLev()+1));
		map.put("step", Integer.toString(pDTO.getStep()+1));

		sqlSession.insert("boardSQL.boardReply2", map);
		
		// 3번째 생성				
		su = sqlSession.update("boardSQL.boardReply3", map);

		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}// Reply end

}
