package imageboard.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dao.BoardDAO;
import imageboard.dao.ImageboardDAO;
import member.dao.MemberDAO;

public class ImageboardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8"); //요청시 post방식일 때는 한글처리 해야함!!!

		String realFolder = request.getServletContext().getRealPath("/storage");
		
		//업로드
		MultipartRequest multi = new MultipartRequest(request
													, realFolder //실제 파일 저장 공간
													, 5*1024*1024 //5KB -> 5MB 업로드 할 수 있는 최대 크기
													, "UTF-8" //한글 파일이 있다면 이 형식
													, new DefaultFileRenamePolicy());

		//데이터
		String imageId = multi.getParameter("imageId");
		String imageName = multi.getParameter("imageName");
		String imagePrice = multi.getParameter("imagePrice");
		String imageQty = multi.getParameter("imageQty");
		String imageContent = multi.getParameter("imageContent");
		
		System.out.println("상품코드 = "+imageId);
		System.out.println("imageQty = "+imageQty);
		String image1 = multi.getOriginalFileName("image1");
/*
		String fileName1 = multi.getFilesystemName("image1");
		File file1 = multi.getFile("image1");

		long fileSize1 = 0;
		if(file1!=null) fileSize1 = file1.length();
*/
		
		Map<String, String> map = new HashMap<String, String>();
		//map.put(Key, Value);
		map.put("imageId", imageId);
		map.put("imageName", imageName);
		map.put("imagePrice", imagePrice);
		map.put("imageQty", imageQty);
		map.put("imageContent", imageContent);
		map.put("image1" , image1);

		//DB
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		int check = imageboardDAO.imageboardWrite(map);	
				
		request.setAttribute("check", check);
		request.setAttribute("imageName", imageName);

		request.setAttribute("display", "/imageboard/imageboardWrite.jsp");
		
		return "/main/index.jsp";
	}

}
