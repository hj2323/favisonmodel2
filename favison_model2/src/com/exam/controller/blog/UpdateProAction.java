package com.exam.controller.blog;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.dao.BlogDao;
import com.exam.domain.BlogVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateProAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String realPath = request.getServletContext().getRealPath("/upload");
		int maxSize = 1024 *1024 *100;//100mb제한
		MultipartRequest multi = new MultipartRequest(
				request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());


		//기존에 첨부된 파일 삭제할 필요 있으면 삭제하기
		String delFilename = multi.getParameter("delFilename");
		if(delFilename!=null){
			File file=new File(realPath, delFilename);
			if(file.exists()){//존재하지않는데 삭제메소드 사용하면 exception이 발생하기 떄문에 
				file.delete();
			}
		}

		//pageNum 파라미터값 가져오기
		String pageNum = multi.getParameter("pageNum");
		String no = multi.getParameter("no");
		System.out.println(no);

		//DAO객체 준비
		BlogDao dao = new BlogDao();

		//DB 테이블에 update할 글정보를 VO객체로 준비
		BlogVo vo = new BlogVo();

		//파라미터값 가져와서 VO에 저장
		//System.out.println(multi.getParameter("no"));
		vo.setNo(Integer.parseInt(multi.getParameter("no")));
		vo.setName(multi.getParameter("name"));
		vo.setPasswd(multi.getParameter("passwd"));
		vo.setSubject(multi.getParameter("subject"));
		vo.setContent(multi.getParameter("content"));

		//원본 파일명
		System.out.println("원본 파일명 = " + multi.getOriginalFileName("filename"));
		//업로드한 실제 파일명
		System.out.println("실제 파일명 = " + multi.getFilesystemName("filename"));


		//새로 업로드된 파일이 있으면 
		if(multi.getFilesystemName("filename")!=null){
			vo.setFilename(multi.getFilesystemName("filename"));//새 파일명으로 저장
		}else{//새로 업로드된 파일이 없으면
			vo.setFilename(multi.getParameter("oldFilename"));//기존 파일명으로 저장
		}


		//DB테이블 글정보 수정하기
		dao.update(vo);
		//System.out.println(vo.getNo());
		
		//수정한 글내용 바로 확인하도록 상세보기 페이지 content.jsp로 이동
		//response.sendRedirect("single-blog.jsp?no="+vo.getNo() + "&pageNum=" + pageNum);
		return "redirect:/favison_model2/singleblog.hj?no="+vo.getNo() + "&pageNum=" + pageNum;
	}

}
