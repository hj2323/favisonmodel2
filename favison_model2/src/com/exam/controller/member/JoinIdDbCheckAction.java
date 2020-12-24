package com.exam.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.dao.MemberDao;

public class JoinIdDbCheckAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		  String id = request.getParameter("id");
		    
		    MemberDao dao = new MemberDao();
		    
		    int count = dao.idcheck(id);
		    boolean isIdDup = (count == 1)? true: false;
		
		    request.setAttribute("isIdDup", isIdDup);
			request.setAttribute("id", id);
		return "joinIdDbCheck";
	}

}
