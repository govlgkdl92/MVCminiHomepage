package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import imageboard.bean.ImageboardDTO;

public class ImageboardDAO {
	private SqlSessionFactory sqlSessionFactory;
	private static ImageboardDAO instance;


	// 싱글톤 - DB는 반드시 싱글톤으로 해야 한다. 한번만 생성해야 하기 때문에.
	public static ImageboardDAO getInstance() {
		if (instance == null) {
			synchronized (ImageboardDAO.class) {
				instance = new ImageboardDAO();// 맨처음 실행할 때 딱 한 번만 실행,생성된다.
			}
		}
		return instance; // 그 외에는 기존값을 불러옴.
	}

	
	//생성자
	public ImageboardDAO() {
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
		public int imageboardWrite(Map<String, String> map) {
			int su = 0;
			
			SqlSession sqlSession = sqlSessionFactory.openSession();
			su = sqlSession.insert("imageboardSQL.imageboardWrite", map);

			sqlSession.commit();
			sqlSession.close();
			
			return su;	
		}// write end
		
		
		//imageBoardList 목록 생성
		public List<ImageboardDTO> getImageboardList(Map<String, String> map) {
			List<ImageboardDTO> ImageboardList = new ArrayList<ImageboardDTO>();
			
			SqlSession sqlSession = sqlSessionFactory.openSession();
			ImageboardList  = sqlSession.selectList("imageboardSQL.getImageboardList", map);	
			
			sqlSession.close();

			return ImageboardList;
		}// BoardList list 목록 생성 end
		
		
		
		//글목록 list 총 글 수
		public int getTotalI(Map<String, String> map) {
			int count = 0;

			SqlSession sqlSession = sqlSessionFactory.openSession();
			count = sqlSession.selectOne("imageboardSQL.getTotalI", map);

			sqlSession.close();

			return count;
		}//글목록 list 총 글 수 end
		
		

	//imageboardView 생성
	public ImageboardDTO imageboardView(int seq) {
		ImageboardDTO imageboardDTO = new ImageboardDTO();
	
		SqlSession sqlSession = sqlSessionFactory.openSession();
		imageboardDTO = sqlSession.selectOne("imageboardSQL.imageboardView", seq);

		sqlSession.close();

		return imageboardDTO;
	}// imageboardView end
		
	
	//글삭제
	public void imageboardDelete(String[] seq) {	
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("array", seq);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		sqlSession.update("imageboardSQL.imageboardDelete", map);

		sqlSession.commit();
		sqlSession.close();
		
	}//글삭제 end	
	
/*	
 * 
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
*/
	
	
}
