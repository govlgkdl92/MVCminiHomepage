package member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;


public class CheckPostService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		List<ZipcodeDTO> list;	
		
		//데이터 받기
		request.setCharacterEncoding("UTF-8"); //요청시 post방식일 때는 한글처리 해야함!!!

		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");
		
		Map<String, String> map = new HashMap<String, String>();
	    map.put("sido", sido);
	    map.put("sigungu", sigungu);
		map.put("roadname", roadname);
		
		//DB 
		list = null;
		if(sido!=null && roadname!=null){
			MemberDAO memberDAO = MemberDAO.getInstance();
			
			
			list = memberDAO.getZipcodeList(map);
				
			
		}
		//데이터 넣기
		request.setAttribute("list", list);
		System.out.println(list);
		
		return "/member/checkPost.jsp";
	}

}
