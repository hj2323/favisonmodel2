package com.exam.controller.blog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.dao.BlogDao;
import com.exam.domain.BlogVo;

public class SingleBlogAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		int prev = no - 1;
		int next =  no +1 ;
		String pageNum = request.getParameter("pageNum");

		BlogDao dao = new BlogDao();
		dao.updateReadcountByNo(no);
		BlogVo vo = dao.getBlogByNo(no);

		// 첨부파일 존재유무
		boolean hasFile = (vo.getFilename() != null) ? true : false;

		boolean isImage = false;
		if (hasFile) {// hasFile == true
			isImage = isImage(vo.getFilename());
		}

		// request 영역객체에 vo객체를 저장
		request.setAttribute("no", no);
		request.setAttribute("blog", vo);
		request.setAttribute("hasFile", hasFile);
		request.setAttribute("isImage", isImage);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);

		return "singleblog";
	}
	
	
	//이미지 파일이면(확장자가 jpg, jpeg, gif, png) img태그로 보여주기
		// 이미지 파일이 아니면 다운로드 링크걸기
		boolean isImage(String filename) {
			boolean isImage = false;
			
			int index = filename.lastIndexOf(".");
			String ext = filename.substring(index + 1); // 확장자 문자열
			
			if (ext.equalsIgnoreCase("jpg") 
					|| ext.equalsIgnoreCase("jpeg")
					|| ext.equalsIgnoreCase("gif")
					|| ext.equalsIgnoreCase("png")) {
				isImage = true;
			} else {
				isImage = false;
			}
			return isImage;
		}

}
