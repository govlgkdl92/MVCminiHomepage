package imageboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.dao.ImageboardDAO;

public class ImageboardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		response.setContentType("text/html;charset=UTF-8");
		List<ImageboardDTO> list = new ArrayList<ImageboardDTO>();
		
		int pg = request.getParameter("pg") == null ? 1 : Integer.parseInt(request.getParameter("pg"));

		//페이징 처리 - 한 페이지 당 10개 식 꺼낼 때 쓰는 공식
		String endNum = Integer.toString(pg*3);
		String startNum = Integer.toString(pg*3-2);	

		//로그인 여부
		boolean login = false;

		HttpSession session = request.getSession();//생성
		
		//세션
		String name = (String)session.getAttribute("memName"); //자식 = (자식)부모
		String id = (String)session.getAttribute("memId");

		request.setAttribute("name", name);
		request.setAttribute("id", id);
		if(id != null) {
			login = true;
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		//DB
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		list = imageboardDAO.getImageboardList(map);	

		
		//총 글수
		int totalA = imageboardDAO.getTotalI(map); 
		int totalP = (totalA+2)/3; //총 페이지 수		

		ImageboardPaging imageboardPaging = new ImageboardPaging();
		imageboardPaging.setCurrentPage(pg);
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);
		imageboardPaging.makePagingHTML();
		
		request.setAttribute("list", list);
		request.setAttribute("login", login);
		request.setAttribute("imageboardPaging", imageboardPaging);
		request.setAttribute("totalP", totalP);
		request.setAttribute("pg", pg);
		
		request.setAttribute("display", "/imageboard/imageboardList.jsp?pg="+pg);
		
		return "/main/index.jsp";
	}

}
