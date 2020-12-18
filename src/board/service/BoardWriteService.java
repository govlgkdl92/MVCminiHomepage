package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;
import member.dao.MemberDAO;

public class BoardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8"); //요청시 post방식일 때는 한글처리 해야함!!!

		HttpSession session = request.getSession();
		
		String name = (String)session.getAttribute("memName"); //자식 = (자식)부모
		String id = (String)session.getAttribute("memId");
		String email = (String)session.getAttribute("memEmail");
		 
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
	
		Map<String, String> map = new HashMap<String, String>();
		//map.put(Key, Value);
		map.put("name", name);
		map.put("email", email);
		map.put("id", id);
		map.put("subject", subject);
		map.put("content", content);
		
		map.put("lev" , "0");
		map.put("step" , "0");
		map.put("pseq", "0");
		map.put("reply", "0");
		map.put("hit", "0");

		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		int check = boardDAO.boardWrite(map);	
				
		request.setAttribute("check", check);
		request.setAttribute("subject", subject);

		request.setAttribute("display", "/board/boardWrite.jsp");
		
		return "/main/index.jsp";
	}

}
