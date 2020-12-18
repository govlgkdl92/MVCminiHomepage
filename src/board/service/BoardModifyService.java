package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardModifyService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8"); //요청시 post방식일 때는 한글처리 해야함!!!
		 
		int pg = Integer.parseInt(request.getParameter("pg"));
		String seq = request.getParameter("seq");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
	
		Map<String, String> map = new HashMap<String, String>();
		//map.put(Key, Value);
		map.put("seq", seq);
		map.put("subject", subject);
		map.put("content", content);

		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		int check = boardDAO.boardUpdate(map);	
				
		request.setAttribute("check", check);
		request.setAttribute("subject", subject);
		request.setAttribute("pg", pg);
		request.setAttribute("seq", seq);

		request.setAttribute("display", "/board/boardModify.jsp");
		
		return "/main/index.jsp";
	}

}
