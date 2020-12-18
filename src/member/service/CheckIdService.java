package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		request.setCharacterEncoding("UTF-8"); 
		//데이터
		String id = request.getParameter("id");
		int check = 0;
		
		System.out.println(" 아이디 중복 체크 !!!!");
		System.out.println(" id :" + id);
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		check = memberDAO.isExistID(id);
		response.setContentType("text/html;charset=UTF-8");

		//로그인
		if(check == 1) { //중복 있음, 사용불가능
			return "/member/checkIdFail.jsp";
			
		}else { //중복 없음, 사용 가능
			return "/member/checkIdOk.jsp";			
		}
	}

}
