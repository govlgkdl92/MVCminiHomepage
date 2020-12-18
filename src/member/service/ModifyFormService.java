package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class ModifyFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();//생성

		//쿠키
		String name = (String)session.getAttribute("memName"); //자식 = (자식)부모
		String id = (String)session.getAttribute("memId");

		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.modifyInfo(id);	

		//request.setAttribute("memberDTO", memberDTO);
		request.setAttribute("id", id);
		request.setAttribute("name", memberDTO.getName());
		request.setAttribute("pwd", memberDTO.getPwd());
		request.setAttribute("gender", memberDTO.getGender());
		request.setAttribute("email1", memberDTO.getEmail1());
		request.setAttribute("email2", memberDTO.getEmail2());
		request.setAttribute("tel1", memberDTO.getTel1());
		request.setAttribute("tel2", memberDTO.getTel2());
		request.setAttribute("tel3", memberDTO.getTel3());
		request.setAttribute("zipcode", memberDTO.getZipcode());
		request.setAttribute("addr1", memberDTO.getAddr1());
		request.setAttribute("addr2", memberDTO.getAddr2());
	
		request.setAttribute("display", "/member/modifyForm.jsp");
		
		return "/main/index.jsp";
	}

}
