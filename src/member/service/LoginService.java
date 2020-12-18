package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		Map<String, String> map = new HashMap<String, String>();
	    map.put("pwd", pwd);
	    map.put("id", id);
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.login(map);	
		
		
		//로그인
		if(memberDTO == null) {
			return "/member/loginFail.jsp";
			
		}else {
			String name = memberDTO.getName();
			String email = memberDTO.getEmail1()+"@"+memberDTO.getEmail2();
			
			
			//세션 값 설정
			HttpSession session = request.getSession(); //생성 
			session.setAttribute("memName", name);
			session.setAttribute("memId", id);
			session.setAttribute("memEmail", email);
			
			session.setAttribute("memberDTO", memberDTO);
			
			return "/member/loginOk.jsp";			
		}
		
	}

}
