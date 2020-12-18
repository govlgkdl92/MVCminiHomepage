package imageboard.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class ImageboardWriteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();//생성
		
		//세션
		String name = (String)session.getAttribute("memName"); //자식 = (자식)부모
		String id = (String)session.getAttribute("memId");
		
		String seq = request.getParameter("seq");
		
		request.setAttribute("name", name);
		request.setAttribute("id", id);
		request.setAttribute("seq", seq);

		request.setAttribute("display", "/imageboard/imageboardWriteForm.jsp");
		
		return "/main/index.jsp";
	}

}
