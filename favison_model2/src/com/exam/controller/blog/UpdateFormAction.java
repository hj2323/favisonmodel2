package com.exam.controller.blog;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.dao.BlogDao;
import com.exam.domain.BlogVo;

public class UpdateFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		//파라미터값	pageNum	num	passwd 가져오기
		String pageNum = request.getParameter("pageNum");
		int no = Integer.parseInt(request.getParameter("no"));
		String passwd = request.getParameter("passwd");

		//DAO 객체 준비
		BlogDao dao = new BlogDao();

		//글번호에 해당하는 패스워드 비교하기 
		boolean isCorrect = dao.isPasswdCorrect(no, passwd);

		//패스워드가 불일치하면 "글 패스워드가 틀림" 뒤로가기
		if (!isCorrect) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 패스워드가 틀립니다. 다시 입력하세요.');");
			out.println("history.back(); // 뒤로가기");
			out.println("</script>");
			out.close();  
			return null;
		}

		//글번호에 해당하는 글정보 한개 가져오기
		BlogVo vo = dao.getBlogByNo(no);
		
		//System.out.println(vo.getNo());
		request.setAttribute("no", no);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("blog", vo);
		
		
		return "updateForm";
	}

}
