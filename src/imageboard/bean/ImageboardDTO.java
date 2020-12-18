package imageboard.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ImageboardDTO {
	private int seq;
	private String imageId; // 상품 코드
	private String imageName;  //상품 명

	private int imagePrice; //단가
	private int imageQty; //개수
	private String imageContent;
	private String image1;
	
	private Date logtime;
	
}
