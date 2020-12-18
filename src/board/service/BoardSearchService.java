package board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardSearchService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8"); //요청시 post방식일 때는 한글처리 해야함!!!

		List<BoardDTO> list = new ArrayList<BoardDTO>();
	    Map<String, String> map = new HashMap<String, String>();    
	      
	    int pg = Integer.parseInt(request.getParameter("pg"));

		//페이징 처리 - 한 페이지 당 10개 식 꺼낼 때 쓰는 공식
		String endNum = Integer.toString(pg*5);
		String startNum = Integer.toString(pg*5-4);	
	    
		//로그인 여부
		boolean login = false;

		HttpSession session = request.getSession();//생성
		
		//세션
		String name = (String)session.getAttribute("memName"); //자식 = (자식)부모
		String id = (String)session.getAttribute("memId");

		request.setAttribute("name", name);
		request.setAttribute("id", id);
		if(id != null) {
			login = true;
		}
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
	    String search = request.getParameter("search");
		String searchValue = request.getParameter("searchValue");

		map.put("searchValue", searchValue);
		map.put("search", search);

		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		list = boardDAO.getBoardList(map);
		
		//검색 총 글수
		int totalA = boardDAO.getTotalA(map); 
		int totalP = (totalA+4)/5; //총 페이지 수
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		request.setAttribute("list", list);
		request.setAttribute("login", login);
		request.setAttribute("boardPaging", boardPaging);
		request.setAttribute("totalP", totalP);
		request.setAttribute("pg", pg);
		request.setAttribute("search", search);
		request.setAttribute("searchValue", searchValue);
		
		request.setAttribute("display", "/board/boardList.jsp?pg="+pg);
			
		return "/main/index.jsp";
	}

}
