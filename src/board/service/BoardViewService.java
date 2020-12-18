package board.service;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 받아오기
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8"); //요청시 post방식일 때는 한글처리 해야함!!!
		String memId = (String)session.getAttribute("memId");
		request.setAttribute("memId", memId);
		
		System.out.println(memId);
		
	 	int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		int countHit = 0;
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardDTO boardDTO = boardDAO.boardView(seq);	
		
		
		String id = boardDTO.getId();		
		String name = boardDTO.getName();
		String email = boardDTO.getEmail();
		String subject = boardDTO.getSubject();
		String content = boardDTO.getContent();
		
		int ref = boardDTO.getRef();
		int lev = boardDTO.getLev();
		int step = boardDTO.getStep();
		int reply = boardDTO.getReply();				
		int hit = boardDTO.getHit();
		
		Date logtime = boardDTO.getLogtime();

		
		Cookie cookie=null;
		Cookie[] cookies=request.getCookies();
		
		if(cookies !=null) {
			for (int i = 0; i < cookies.length; i++) {
				//System.out.println("쿠키 이름 : "+cookies[i].getName());
	            
	            //만들어진 쿠키들을 확인하며, 만약 들어온 적 있다면 생성되었을 쿠키가 있는지 확인
				if(cookies[i].getName().equals(memId+seq+"")) {
					System.out.println("if문 쿠키 이름 : "+cookies[i].getName());
				
	            //찾은 쿠키를 변수에 저장
					cookie=cookies[i];
				}
			}
			
		}else {
			System.out.println("cookies 확인 로직 : 쿠키가 없습니다.");
		}
		
		
		//만들어진 쿠키가 없음을 확인
		if(cookie==null) {
		    try {  
		        //이 페이지에 왔다는 증거용(?) 쿠키 생성
				Cookie newCookie=new Cookie(memId+seq+"","readCount");
				response.addCookie(newCookie);
		              
		        //쿠키가 없으니 증가 로직 진행
				boardDAO.hitUpdate(seq);    
			} catch (Exception e) {
				e.getStackTrace();
			}
				
	        //만들어진 쿠키가 있으면 증가로직 진행하지 않음
		}else {
				String value=cookie.getValue();
				System.out.println("viewCookie 확인 로직 : 쿠키 value : "+value);
			}
		
		
		request.setAttribute("seq", seq);
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		request.setAttribute("subject", subject);
		request.setAttribute("content", content);
		
		request.setAttribute("ref", ref);
		request.setAttribute("lev", lev);
		request.setAttribute("step", step);
		request.setAttribute("reply", reply);
		request.setAttribute("hit", hit);
		request.setAttribute("logtime", logtime);
		
		request.setAttribute("pg", pg);
		
		request.setAttribute("display", "/board/boardView.jsp");
		
		return "/main/index.jsp";
	}

}
