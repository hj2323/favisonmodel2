package com.exam.controller.blog;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.dao.BlogDao;
import com.exam.domain.BlogVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class WriteProAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String realPath = request.getServletContext().getRealPath("/upload");
		System.out.println("realPath=" + realPath);
		int maxSize = 1024 * 1024 * 50;// 50MB 제한
		
		MultipartRequest multi = new MultipartRequest(
				request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

		BlogDao dao = new BlogDao();
		BlogVo vo = new BlogVo();
		
		int no = dao.getNextNo();
		System.out.println(no);
		vo.setNum(no);
		vo.setName(multi.getParameter("name"));
		vo.setPasswd(multi.getParameter("passwd"));
		vo.setSubject(multi.getParameter("subject"));
		vo.setContent(multi.getParameter("content"));
		vo.setReadcount(0);//조회수
		vo.setRegDate(new Timestamp(System.currentTimeMillis()));
		vo.setIp(request.getRemoteAddr());// 작성자 Ip주소 :문자열
		vo.setReRef(no);//주글은 글그룹 번호와 글번호가 동일함
		vo.setReLev(0); //주글은 들여쓰기 레벨이 0(들여쓰기 안함)
		vo.setReSeq(0);
		
		String originalFilename = multi.getOriginalFileName("filename");
		System.out.println("원본파일명 = " + originalFilename);
		String realFilename = multi.getFilesystemName("filename");
		System.out.println("실제 파일명 = " + realFilename);
		vo.setFilename(realFilename);
		
		dao.insert(vo);
		
		
		return "redirect:/favison_model2/blog.hj";
		
	}

}
