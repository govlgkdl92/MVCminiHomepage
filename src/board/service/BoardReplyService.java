package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardReplyService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8"); //요청시 post방식일 때는 한글처리 해야함!!!

		String pseq = request.getParameter("pseq"); //원글 번호
		String pg = request.getParameter("pg"); 	//원글이 있는 페이지
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		HttpSession session = request.getSession();
		
		String name = (String)session.getAttribute("memName"); //자식 = (자식)부모
		String id = (String)session.getAttribute("memId");
		String email = (String)session.getAttribute("memEmail");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);

		map.put("subject", subject);
		map.put("content", content);

		map.put("pseq", pseq);

		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		int check = boardDAO.boardReply(map);	
				
		//응답
		request.setAttribute("check", check);
		request.setAttribute("subject", subject);
		
		request.setAttribute("pseq", pseq);
		request.setAttribute("pg", pg);
		
		request.setAttribute("display", "/board/boardReply.jsp");
		
		return "/main/index.jsp";
	}

}
