package board.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardModifyFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8"); //요청시 post방식일 때는 한글처리 해야함!!!

		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		System.out.println("seq"+seq);
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardDTO boardDTO = boardDAO.boardView(seq);	
				
		request.setAttribute("boardDTO", boardDTO);

		request.setAttribute("seq", seq);
		request.setAttribute("pg", pg);

		request.setAttribute("display", "/board/boardModifyForm.jsp");
		
		return "/main/index.jsp";
	}

}
