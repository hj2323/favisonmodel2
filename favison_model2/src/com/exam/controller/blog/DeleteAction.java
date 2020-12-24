package com.exam.controller.blog;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.dao.BlogDao;
import com.exam.domain.BlogVo;

public class DeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNum = request.getParameter("pageNum");
		int no = Integer.parseInt(request.getParameter("no"));
		String passwd = request.getParameter("passwd");

		BlogDao dao = new BlogDao();
		
		BlogVo vo = dao.getBlogByNo(no);

		String filename = vo.getFilename();
		if(filename != null){
			String realPath=request.getServletContext().getRealPath("/upload");
			File file = new File(realPath, filename);
			if(file.exists()){
				file.delete();
			}
		}

		dao.deleteByNo(no);
		
		return "redirect:/favison_model2/blog.hj?pageNum"+ pageNum;
	}

}
