package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class IdDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		 
		String id = request.getParameter("id");
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		int check = memberDAO.idDelete(id);
		
		request.setAttribute("check", check);
		
		HttpSession session = request.getSession();//생성
		//모든 세션 제거
		session.invalidate();
		
		request.setAttribute("display", "/member/idDelete.jsp");
		
		return "/main/index.jsp";
	}

}
