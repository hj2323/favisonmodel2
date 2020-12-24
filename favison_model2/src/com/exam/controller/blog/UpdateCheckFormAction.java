package com.exam.controller.blog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;

public class UpdateCheckFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String no = request.getParameter("no");
		String pageNum = request.getParameter("pageNum");
		
		
		request.setAttribute("no",no);
		request.setAttribute("pageNum", pageNum);
		
		return "updateCheckForm";
	}

}
